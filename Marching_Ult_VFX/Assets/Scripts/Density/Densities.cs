using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Densities : DensityGenerator
{
    public enum DensityType { sphere, torus, box };
    public DensityType sdf = DensityType.sphere;

    //[ConditionalHide(nameof(sdf), 0)]
    //public float radius = 1f;

    //[ConditionalHide(nameof(sdf), 1)]
    //public float radiusInner = 1;
    //[ConditionalHide(nameof(sdf), 1)]
    //public float radiusOuter = 1;

    //[ConditionalHide(nameof(sdf), 2)]
    //public Vector3 boxSize = new Vector3(1f, 1f, 1f);


//    public Transform spherePos;
    public float radius = 1f;

    //public Transform boxPos;
    public Vector3 boxSize = new Vector3(1f, 1f, 1f);

    public float radiusInner;
    public float radiusOuter;

    public Vector3 lineOrig;
    public Vector3 lineEnd;
    public float lineRadius;

    public float k = 0.25f;
    public float off = 20f;

    public bool fire = true;
    public bool cond;
    bool updateCond = false;

    public override ComputeBuffer Generate(ComputeBuffer pointsBuffer, int numPointsPerAxis, float boundsSize, Vector3 worldBounds, Vector3 centre, Vector3 offset, float spacing)
    {
        //switch (sdf)
        //{
        //    case DensityType.sphere:
        //        densityShader.SetFloat("radius", radius);
        //        break;
        //    case DensityType.torus:
        //        densityShader.SetFloat("radiusInner", radiusInner);
        //        densityShader.SetFloat("radiusOuter", radiusOuter);
        //        break;
        //    case DensityType.box:
        //        densityShader.SetVector("boxSize", new Vector4(boxSize.x, boxSize.y, boxSize.z));
        //        break;

        //    default: break;
        //}

        densityShader.SetFloat("sphereRadius", radius);
        densityShader.SetVector("sphereOffset", new Vector4(spherePos.position.x, spherePos.position.y, spherePos.position.z)*-1);

        densityShader.SetVector("boxSize", new Vector4(boxSize.x, boxSize.y, boxSize.z));
        densityShader.SetVector("boxOffset", new Vector4(boxPos.localPosition.x, boxPos.localPosition.y, boxPos.localPosition.z) * -1);

        densityShader.SetFloat("torusRadiusInner", radiusInner);
        densityShader.SetFloat("torusRadiusOuter", radiusOuter);
        densityShader.SetVector("torusOffset", new Vector4(torusPos.position.x, torusPos.position.y, torusPos.position.z) * -1);

        densityShader.SetVector("lineOrigin", new Vector4(lineOrig.x, lineOrig.y, lineOrig.z));
        densityShader.SetVector("lineEnd", new Vector4(lineEnd.x, lineEnd.y, lineEnd.z));
        densityShader.SetFloat("lineRadius", lineRadius);

        densityShader.SetFloat("k", k);

        densityShader.SetFloat("off", off);

        densityShader.SetBool("fire", fire);

        if (!updateCond)
        {
            cond = false;
            updateCond = true;
        }
        else
        {
            cond = true;
        }

        densityShader.SetBool("cond", cond);

        return base.Generate(pointsBuffer, numPointsPerAxis, boundsSize, worldBounds, centre, offset, spacing);
    }
}
