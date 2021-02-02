using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BezierMotion : MonoBehaviour
{
    [HideInInspector]
    public Vector3 endPoint;
    public float maxHeight = 25;

    Vector3 startPoint;
    Vector3 currentEndPoint;
    Vector3 midPoint;
    Vector3 controlPoint;
    float bezierTime = 0;

    // Start is called before the first frame update
    void Start()
    {
        startPoint = transform.position;
    }

    void OnEnable()
    {
        bezierTime = 0;
    }

    // Update is called once per frame
    void Update()
    {
        if (this.gameObject.activeSelf)
        {
            SetUp();
            bezierTime = bezierTime + Time.deltaTime * 0.5f; //Time.deltaTime
            if (bezierTime >= 1)
            {
                bezierTime = 0;
            }
            transform.position = QuadraticBezier(bezierTime, currentEndPoint);
        }
    }

    Vector3 QuadraticBezier(float time, Vector3 end)
    {
        return (((1 - time) * (1 - time)) * startPoint) + (2 * time * (1 - time) * controlPoint) + ((time * time) * end);
    }

    public void SetUp()
    {
        currentEndPoint = endPoint;
        midPoint = (currentEndPoint - startPoint) / 2f;
        controlPoint = new Vector3(midPoint.x, maxHeight, midPoint.z);
    }
}
