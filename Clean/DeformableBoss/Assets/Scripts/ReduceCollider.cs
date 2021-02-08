using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ReduceCollider : MonoBehaviour
{
    CapsuleCollider col;
    float colRadius;
    float colHeight;

    // Start is called before the first frame update
    void Start()
    {
        col = this.GetComponent<CapsuleCollider>();
        colRadius = col.radius;
        colHeight = col.height;
        col.height = 1;
    }

    public void Reduce()
    {
        //Collider Direction: X = 0, Y = 1, Z = 2
        //if(col.height > 1)
        //{
        //    col.height -= 0.01f;
        //    col.height = Mathf.Clamp(col.height, 1, colHeight);
        //}
        //else if(col.radius > colRadius/2f)
        //{
        //    col.radius -= 0.01f;
        //    col.radius = Mathf.Clamp(col.radius, colRadius/2f, colRadius);
        //}
        //else if(col.radius <= colRadius/2f)
        //{
        //    col.height = colHeight;
        //    col.direction = 0;
        //    col.radius = colRadius/1.5f;
        //}
        col.radius -= 0.001f;
    }
}
