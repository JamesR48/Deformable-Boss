using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeshGenerator : MonoBehaviour
{

    const int threadGroupSize = 8;

    [Header("General Settings")]
    public DensityGenerator densityGenerator;

    public Vector3Int numChunks = Vector3Int.one;

    [Space()]
    public bool autoUpdateInEditor = true;
    public bool autoUpdateInGame = true;
    public ComputeShader shader;

    public ComputeShader fixArgs;
    public ComputeShader mcNormals;
    public ComputeShader mcVertex;

    public Material mat;
    public bool generateColliders;

    [Header("Voxel Settings")]
    public float isoLevel;
    public float boundsSize = 1;
    public Vector3 offset = Vector3.zero;

    [Range(2, 100)]
    public int numPointsPerAxis = 30;

    [Header("Gizmos")]
    public bool showBoundsGizmo = true;
    public Color boundsGizmoCol = Color.green;

    public Transform creatureParent;

    GameObject chunkHolder;
    //const string chunkHolderName = "Chunks Holder";
    List<Chunk> chunks;
    Dictionary<Vector3Int, Chunk> existingChunks;
    Queue<Chunk> recycleableChunks;

    // Buffers
    ComputeBuffer triangleBuffer;
    ComputeBuffer pointsBuffer;
    ComputeBuffer triCountBuffer;

    private ComputeBuffer argBuffer;
    private ComputeBuffer normalsBuffer;
    //private ComputeBuffer verticesBuffer;

    public Transform bullet;
    public Transform tailParent;
    public Transform skullParent;
    public Transform chestParent;
    public Transform mouthParent;

    public GameObject chunk;

    bool settingsUpdated;

    int init = 0;


    private void Start()
    {
        settingsUpdated = true;
    }

    void Update()
    {
        if (settingsUpdated || densityGenerator.boxPos.hasChanged || densityGenerator.spherePos.hasChanged)
        {
            //RequestMeshUpdate();
            settingsUpdated = false;
            densityGenerator.boxPos.hasChanged = false;
            densityGenerator.spherePos.hasChanged = false;
        }
        //foreach (Chunk chunk in chunks)
        //{
        //    Graphics.DrawProceduralIndirect(mat, new Bounds(chunk.gameObject.transform.position, chunk.gameObject.transform.lossyScale), MeshTopology.Triangles, argBuffer, 0, null, null, UnityEngine.Rendering.ShadowCastingMode.On, true);
        //}

        RequestMeshUpdate();
    }

    public void Run()
    {
        if(init == 0)
        {
            CreateBuffers();
            InitChunks();
        }
        init = 1;
        UpdateAllChunks();

        // Release buffers immediately in editor
        if (!Application.isPlaying)
        {
            ReleaseBuffers();
        }

    }

    public void RequestMeshUpdate()
    {
        if ((Application.isPlaying && autoUpdateInGame) || (!Application.isPlaying && autoUpdateInEditor))
        {
            Run();
        }
    }

    public void UpdateChunkMesh(Chunk chunk)
    {
        int numVoxelsPerAxis = numPointsPerAxis - 1;
        int numThreadsPerAxis = Mathf.CeilToInt(numPointsPerAxis / (float)threadGroupSize);
        float pointSpacing = boundsSize / (numPointsPerAxis - 1);

        Vector3Int coord = chunk.coord;
        Vector3 centre = CentreFromCoord(coord);

        Vector3 worldBounds = new Vector3(numChunks.x, numChunks.y, numChunks.z) * boundsSize;

        densityGenerator.Generate(pointsBuffer, numPointsPerAxis, boundsSize, worldBounds, centre, offset, pointSpacing);

        //mcNormals.SetInt("_Width", numPointsPerAxis);
        //mcNormals.SetInt("_Height", numPointsPerAxis);
        //mcNormals.SetBuffer(0, "_Points", pointsBuffer);
        //mcNormals.SetBuffer(0, "_Result", normalsBuffer);
        //mcNormals.Dispatch(0, numThreadsPerAxis, numThreadsPerAxis, numThreadsPerAxis);

        triangleBuffer.SetCounterValue(0);
        shader.SetBuffer(0, "points", pointsBuffer);
        shader.SetBuffer(0, "triangles", triangleBuffer);
        shader.SetInt("numPointsPerAxis", numPointsPerAxis);
        shader.SetFloat("isoLevel", isoLevel);

        //shader.SetBuffer(0, "_Normals", normalsBuffer);

        shader.Dispatch(0, numThreadsPerAxis, numThreadsPerAxis, numThreadsPerAxis);

        //mcVertex.SetBuffer(0, "points", pointsBuffer);
        //mcVertex.SetBuffer(0, "triangles", triangleBuffer);
        //mcVertex.SetInt("numPointsPerAxis", numPointsPerAxis);
        //mcVertex.SetFloat("isoLevel", isoLevel);
        //mcVertex.SetBuffer(0, "_Normals", normalsBuffer);
        //mcVertex.SetFloat("boundsSize", boundsSize);
        //mcVertex.SetFloat("spacing", pointSpacing);
        //mcVertex.Dispatch(0, numThreadsPerAxis, numThreadsPerAxis, numThreadsPerAxis);

        //int[] args = new int[] { 0, 1, 0, 0 };
        //argBuffer.SetData(args);

        // Get number of triangles from the triangle buffer
        ComputeBuffer.CopyCount(triangleBuffer, argBuffer, 0);

        // Get total number of vertices (numtris * 3)
        fixArgs.SetBuffer(0, "DrawCallArgs", argBuffer);
        fixArgs.Dispatch(0, 1, 1, 1);

        Mesh mesh = chunk.mesh;
        mesh.Clear();

        //mesh.vertices = vertb;
        //mesh.triangles = trib;
        //mesh.normals = normb;

        mat.SetPass(0);
        mat.SetBuffer("_Buffer", triangleBuffer);
        mat.SetMatrix("objMat", chunk.gameObject.transform.localToWorldMatrix);
        mat.SetVector("skelePos", new Vector4(chunk.gameObject.transform.position.x, chunk.gameObject.transform.position.y, chunk.gameObject.transform.position.z, 1.0f));
        mat.SetVector("bullet", new Vector4(bullet.position.x, bullet.position.y, bullet.position.z, 1.0f));
        mat.SetVector("skeleScale", new Vector4(chunk.gameObject.transform.lossyScale.x, chunk.gameObject.transform.lossyScale.y, chunk.gameObject.transform.lossyScale.z, 1.0f));
        mat.SetVector("skeleTail", new Vector4(tailParent.position.x, tailParent.position.y, tailParent.position.z, 1.0f));
        mat.SetVector("skeleSkull", new Vector4(skullParent.position.x, skullParent.position.y, skullParent.position.z, 1.0f));
        mat.SetVector("skeleChest", new Vector4(chestParent.position.x, chestParent.position.y, chestParent.position.z, 1.0f));
        mat.SetVector("skeleMouth", new Vector4(mouthParent.position.x, mouthParent.position.y, mouthParent.position.z, 1.0f));
        //mat.SetMatrix("objMat", chunk.gameObject.transform.worldToLocalMatrix);
        //Graphics.DrawProceduralIndirectNow(MeshTopology.Triangles, argBuffer);
        Graphics.DrawProceduralIndirect(mat, new Bounds(chunk.gameObject.transform.position, chunk.gameObject.transform.lossyScale), MeshTopology.Triangles, argBuffer, 0, null, null, UnityEngine.Rendering.ShadowCastingMode.On, true);
    }

    public void UpdateAllChunks()
    {

        // Create mesh for each chunk
        foreach (Chunk chunk in chunks)
        {
            UpdateChunkMesh(chunk);
        }

    }

    void OnDestroy()
    {
        //if (Application.isPlaying)
        //{
            ReleaseBuffers();
        //}
    }

    void CreateBuffers()
    {
        int numPoints = numPointsPerAxis * numPointsPerAxis * numPointsPerAxis;
        int numVoxelsPerAxis = numPointsPerAxis - 1;
        int numVoxels = numVoxelsPerAxis * numVoxelsPerAxis * numVoxelsPerAxis;
        int maxTriangleCount = numVoxels * 5;

        // Always create buffers in editor (since buffers are released immediately to prevent memory leak)
        // Otherwise, only create if null or if size has changed
        //if (!Application.isPlaying || (pointsBuffer == null || numPoints != pointsBuffer.count))
        //{
            //if (Application.isPlaying)
            //{
            //    ReleaseBuffers();
            //}

            //triangleBuffer = new ComputeBuffer(maxTriangleCount, sizeof(float) * 3 * 3, ComputeBufferType.Append);
            //triangleBuffer = new ComputeBuffer(numPoints * 5 * 3, sizeof(float) * 8 * 3, ComputeBufferType.Append);
            triangleBuffer = new ComputeBuffer(numPoints*5, sizeof(float) * 3 * 3, ComputeBufferType.Append);

            pointsBuffer = new ComputeBuffer(numPoints, sizeof(float) * 4);
            triCountBuffer = new ComputeBuffer(1, sizeof(int), ComputeBufferType.Raw);

            argBuffer = new ComputeBuffer(1, DrawCallArgBuffer.size, ComputeBufferType.IndirectArguments);
            int[] args = new int[] { 0, 1, 0, 0 };
            argBuffer.SetData(args);

            normalsBuffer = new ComputeBuffer(numPoints, sizeof(float) * 3);
            //verticesBuffer = new ComputeBuffer(maxTriangleCount*3, sizeof(float) * 3 * 3, ComputeBufferType.Append);
        //}
    }

    void ReleaseBuffers()
    {
        if (triangleBuffer != null)
        {
            triangleBuffer.Release();
            pointsBuffer.Release();
            triCountBuffer.Release();
            normalsBuffer.Release();
            //verticesBuffer.Release();
            argBuffer.Release();
        }
    }

    Vector3 CentreFromCoord(Vector3Int coord)
    {
        // Centre entire map at origin
            Vector3 totalBounds = (Vector3)numChunks * boundsSize;
        return -totalBounds / 2 + (Vector3)coord * boundsSize + Vector3.one * boundsSize / 2;
    }

    //void CreateChunkHolder()
    //{
    //    // Create/find mesh holder object for organizing chunks under in the hierarchy
    //    if (chunkHolder == null)
    //    {
    //        if (GameObject.Find(chunkHolderName))
    //        {
    //            chunkHolder = GameObject.Find(chunkHolderName);
    //        }
    //        else
    //        {
    //            chunkHolder = new GameObject(chunkHolderName);
    //        }
    //    }
    //}

    // Create/get references to all chunks

    void InitChunks()
    {
        //CreateChunkHolder();
        chunks = new List<Chunk>();
        List<Chunk> oldChunks = new List<Chunk>(FindObjectsOfType<Chunk>());

        // Go through all coords and create a chunk there if one doesn't already exist
        for (int x = 0; x < numChunks.x; x++)
        {
            for (int y = 0; y < numChunks.y; y++)
            {
                for (int z = 0; z < numChunks.z; z++)
                {
                    Vector3Int coord = new Vector3Int(x, y, z);
                    bool chunkAlreadyExists = false;

                    // If chunk already exists, add it to the chunks list, and remove from the old list.
                    for (int i = 0; i < oldChunks.Count; i++)
                    {
                        if (oldChunks[i].coord == coord)
                        {
                            chunks.Add(oldChunks[i]);
                            oldChunks.RemoveAt(i);
                            chunkAlreadyExists = true;
                            break;
                        }
                    }

                    // Create new chunk 
                    if (!chunkAlreadyExists)
                    {
                        var newChunk = CreateChunk(coord);
                        chunks.Add(newChunk);
                    }

                    chunks[chunks.Count - 1].SetUp(mat, generateColliders);
                }
            }
        }

        // Delete all unused chunks
        for (int i = 0; i < oldChunks.Count; i++)
        {
            oldChunks[i].DestroyOrDisable();
        }
    }

    Chunk CreateChunk(Vector3Int coord)
    {
        //GameObject chunk = new GameObject($"Chunk ({coord.x}, {coord.y}, {coord.z})");
        

        //chunk.transform.parent = chunkHolder.transform;
        chunk.transform.parent = creatureParent;
        chunk.transform.localPosition = new Vector3(0f, 0.5f, 0f);

        tailParent.parent = chunk.transform;
        tailParent.localPosition = new Vector3(-4.7f,1f, 0f);
        skullParent.parent = chunk.transform;
        skullParent.localPosition = new Vector3(4.5f, -0.5f, 0f);
        chestParent.parent = chunk.transform;
        chestParent.localPosition = new Vector3(1f,0f,0f);
        mouthParent.parent = chunk.transform;
        mouthParent.localPosition = new Vector3(8.54f, -2.34f, 0f);

        bullet.parent = chunk.transform;
        bullet.localPosition = new Vector3(20,20,20);

        //chunk.transform.localScale = chunk.transform.localScale/2;
        //chunk.transform.localScale = (chunk.transform.localScale / 2) * 2;
        Chunk newChunk = chunk.AddComponent<Chunk>();
        newChunk.coord = coord;
        return newChunk;
    }

    void OnDrawGizmos()
    {
        if (showBoundsGizmo)
        {
            Gizmos.color = boundsGizmoCol;

            List<Chunk> chunks = (this.chunks == null) ? new List<Chunk>(FindObjectsOfType<Chunk>()) : this.chunks;
            foreach (var chunk in chunks)
            {
                Bounds bounds = new Bounds(CentreFromCoord(chunk.coord), Vector3.one * boundsSize);
                Gizmos.color = boundsGizmoCol;
                Gizmos.DrawWireCube(CentreFromCoord(chunk.coord), Vector3.one * boundsSize);
            }
        }
    }

    struct DrawCallArgBuffer
    {
        public const int size =
            sizeof(int) +
            sizeof(int) +
            sizeof(int) +
            sizeof(int);
        public int vertexCountPerInstance;
        public int instanceCount;
        public int startVertexLocation;
        public int startInstanceLocation;
    }
}