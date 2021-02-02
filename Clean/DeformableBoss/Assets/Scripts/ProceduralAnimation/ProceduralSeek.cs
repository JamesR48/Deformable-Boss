using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProceduralSeek : MonoBehaviour
{
    public Transform seekTarget;
    public float moveSpeed = 10f;
    public float FOV = 0.99f;
    public FloatVariable legRotationSpeed;
    float dotProduct;
    Vector3 viewDirection;    
    Quaternion look;
    Quaternion newRotation;

    // Update is called once per frame
    void Update()
    {
        Seek();
    }

    public void Seek()
    {
        //look = Quaternion.LookRotation((seekTarget.position - transform.position).normalized);

        viewDirection = (seekTarget.position - transform.position);
        viewDirection.y = 0;
        dotProduct = Vector3.Dot(transform.forward, viewDirection.normalized);

        look = Quaternion.LookRotation(viewDirection);

        if (dotProduct < FOV)
        {   
            float value = Mathf.MoveTowards(legRotationSpeed.Value, moveSpeed*10, 20);
            legRotationSpeed.SetValue(value);

            newRotation = Quaternion.Euler(transform.rotation.eulerAngles.x, look.eulerAngles.y, transform.rotation.eulerAngles.z);
            transform.rotation = Quaternion.Slerp(transform.rotation, newRotation, Time.deltaTime * moveSpeed);
        }
        if (dotProduct >= FOV)
        {
            float value = Mathf.MoveTowards(legRotationSpeed.Value, 0, 10);
            legRotationSpeed.SetValue(value);
        }
    }
}
