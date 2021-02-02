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

    public Material mat;
    public bool generateColliders;

    [Header("Voxel Settings")]
    public float isoLevel = 0.5f;
    public float boundsSize = 20;
    public Vector3 offset = Vector3.zero;

    [Range(2, 100)]
    public int numPointsPerAxis = 30;

    [Header("Gizmos")]
    public bool showBoundsGizmo = true;
    public Color boundsGizmoCol = Color.green;

    public Transform creatureParent;

    List<Chunk> chunks;

    // Buffers
    ComputeBuffer triangleBuffer;
    ComputeBuffer pointsBuffer;
    ComputeBuffer argBuffer;

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
        if (settingsUpdated || densityGenerator.spherePos.hasChanged)
        {
            //RequestMeshUpdate();
            settingsUpdated = false;
            densityGenerator.spherePos.hasChanged = false;
        }

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

        triangleBuffer.SetCounterValue(0);
        shader.SetBuffer(0, "points", pointsBuffer);
        shader.SetBuffer(0, "triangles", triangleBuffer);
        shader.SetInt("numPointsPerAxis", numPointsPerAxis);
        shader.SetFloat("isoLevel", isoLevel);

        shader.Dispatch(0, numThreadsPerAxis, numThreadsPerAxis, numThreadsPerAxis);

        // Get number of triangles from the triangle buffer
        ComputeBuffer.CopyCount(triangleBuffer, argBuffer, 0);

        // Get total number of vertices (numtris * 3)
        fixArgs.SetBuffer(0, "DrawCallArgs", argBuffer);
        fixArgs.Dispatch(0, 1, 1, 1);

        Mesh mesh = chunk.mesh;
        mesh.Clear();

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

        triangleBuffer = new ComputeBuffer(numPoints*5, sizeof(float) * 3 * 3, ComputeBufferType.Append);
        pointsBuffer = new ComputeBuffer(numPoints, sizeof(float) * 4);

        argBuffer = new ComputeBuffer(1, DrawCallArgBuffer.size, ComputeBufferType.IndirectArguments);
        int[] args = new int[] { 0, 1, 0, 0 };
        argBuffer.SetData(args);
    }

    void ReleaseBuffers()
    {
        if (triangleBuffer != null)
        {
            triangleBuffer.Release();
            pointsBuffer.Release();
            argBuffer.Release();
        }
    }

    Vector3 CentreFromCoord(Vector3Int coord)
    {
        // Centre entire map at origin
            Vector3 totalBounds = (Vector3)numChunks * boundsSize;
        return -totalBounds / 2 + (Vector3)coord * boundsSize + Vector3.one * boundsSize / 2;
    }

    // Create/get references to all chunks

    void InitChunks()
    {
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
        if (creatureParent)
        {
            chunk.transform.parent = creatureParent;
            chunk.transform.localPosition = new Vector3(0f, 2.7f, -0.7f);
        }

        tailParent.parent = chunk.transform;
        tailParent.localPosition = new Vector3(-4.7f,1f, 0f);
        skullParent.parent = chunk.transform;
        skullParent.localPosition = new Vector3(4.5f, -0.5f, 0f);
        chestParent.parent = chunk.transform;
        chestParent.localPosition = new Vector3(1f,0f,0f);
        mouthParent.parent = chunk.transform;
        mouthParent.localPosition = new Vector3(8.54f, -2.34f, 0f);

        bullet.parent = chunk.transform;
        bullet.localPosition = new Vector3(20, 20, 20);

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