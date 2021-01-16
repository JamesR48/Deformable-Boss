using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoxDensity : DensityGenerator
{
    public Vector3 boxSize = new Vector3(1f, 1f, 1f);

    public override ComputeBuffer Generate(ComputeBuffer pointsBuffer, int numPointsPerAxis, float boundsSize, Vector3 worldBounds, Vector3 centre, Vector3 offset, float spacing)
    {
        densityShader.SetVector("boxSize", new Vector4(boxSize.x, boxSize.y, boxSize.z));
        return base.Generate(pointsBuffer, numPointsPerAxis, boundsSize, worldBounds, centre, offset, spacing);
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(this.transform.position, 3f);
    }
}
