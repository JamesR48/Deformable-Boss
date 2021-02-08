using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Rotates the Y axis of the object towards the main camera yaw rotation
/// </summary>
public class MouseCameraRotation : MonoBehaviour
{
    public Transform target;
    public Cinemachine.AxisState xAxis; //camera pitch
    public Cinemachine.AxisState yAxis; //camera yaw

    private void Awake()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        MouseRotateCam();
    }

    public void MouseRotateCam()
    {
        xAxis.Update(Time.deltaTime * 0.8f);
        yAxis.Update(Time.deltaTime * 0.8f);

        target.eulerAngles = new Vector3(yAxis.Value, xAxis.Value, 0);
        //float yawCamera = Camera.main.transform.rotation.eulerAngles.y;
        //transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.Euler(0, yawCamera, 0), turnSpeed * Time.deltaTime);
    }
}
