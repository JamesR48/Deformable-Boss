using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LinearMotion : MonoBehaviour
{
    public float speed = 10f;
    public Vector3 upOffset = new Vector3(0f, 0f, 0f);

    // Update is called once per frame
    void Update()
    {
        transform.position += (transform.forward + upOffset) * speed * Time.deltaTime;
    }
}
