using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TorusDensity : DensityGenerator
{
    public float radiusInner = 1;
    public float radiusOuter = 1;

    public override ComputeBuffer Generate(ComputeBuffer pointsBuffer, int numPointsPerAxis, float boundsSize, Vector3 worldBounds, Vector3 centre, Vector3 offset, float spacing)
    {
        densityShader.SetFloat("radiusInner", radiusInner);
        densityShader.SetFloat("radiusOuter", radiusOuter);
        return base.Generate(pointsBuffer, numPointsPerAxis, boundsSize, worldBounds, centre, offset, spacing);
    }
}
