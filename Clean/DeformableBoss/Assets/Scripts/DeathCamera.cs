using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;

public class DeathCamera : MonoBehaviour
{
    public CinemachineVirtualCamera movementCamera;
    public Transform cameraTarget;
    //public GameObject deathCamera;
    float angle;
    Quaternion newRotation;
    float pos;
    Vector3 newPosition;
    bool deathCam = false;
    Cinemachine3rdPersonFollow cinemachineFollow;
    float newDistance;

    void Start()
    {
        cinemachineFollow = movementCamera.GetCinemachineComponent<Cinemachine3rdPersonFollow>();
    }

    // Update is called once per frame
    void Update()
    {
        if (deathCam)
        {
            RotateCamera();
            MoveDownCamera();
            MoveCloserCamera();
        }
    }

    void RotateCamera()
    {
        angle = cameraTarget.rotation.eulerAngles.y;
        angle += 185 * Time.deltaTime * 18;
        angle = Mathf.Clamp(angle, 0, 185);
        newRotation = Quaternion.Euler(cameraTarget.rotation.eulerAngles.x, angle, cameraTarget.rotation.eulerAngles.z);
        cameraTarget.rotation = Quaternion.Lerp(cameraTarget.rotation, newRotation, Time.deltaTime);
    }

    void MoveDownCamera()
    {
        pos = cameraTarget.localPosition.y;
        pos -= Time.deltaTime * 40;
        pos = Mathf.Clamp(pos, 0.1f, 1.34f); //0.47
        newPosition = new Vector3(cameraTarget.localPosition.x, pos, cameraTarget.localPosition.z);
        cameraTarget.localPosition = Vector3.Lerp(cameraTarget.localPosition, newPosition, Time.deltaTime);
    }

    void MoveCloserCamera()
    {
        newDistance = cinemachineFollow.CameraDistance;
        newDistance -= Time.deltaTime * 38;
        newDistance = Mathf.Clamp(newDistance, 3f, 4.24f); //3.33
        cinemachineFollow.CameraDistance = Mathf.Lerp(cinemachineFollow.CameraDistance, newDistance, Time.deltaTime);
    }

    public void ActiveDeathCamera()
    {
        deathCam = true;
    }
}
