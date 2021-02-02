using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateWithCamera : MonoBehaviour
{
    public float turnSpeed = 8f;
    float cameraYaw;

    // Update is called once per frame
    void Update()
    {
        YawRotate();
    }

    public void YawRotate()
    {
        cameraYaw = Camera.main.transform.rotation.eulerAngles.y;
        transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.Euler(0, cameraYaw, 0), turnSpeed * Time.deltaTime);
    }
}
