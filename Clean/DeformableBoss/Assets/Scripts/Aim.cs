using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Aim : MonoBehaviour
{
    public GameObject movementCamera;
    public GameObject aimCamera;

    public BoolVariable isAiming;
    public GameEvent onAiming;
    public GameEvent onStopAiming;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButton(1)) //right click held down
        {
            Aiming();
        }
        else if(isAiming.Value && !Input.GetMouseButton(1))
        {
            StopAiming();
        }
    }

    public void Aiming()
    {
        if (!isAiming.Value)
        {
            onAiming.Raise();
        }

        isAiming.SetValue(true);
        movementCamera.SetActive(false);
        aimCamera.SetActive(true);
    }

    public void StopAiming()
    {
        isAiming.SetValue(false);
        movementCamera.SetActive(true);
        aimCamera.SetActive(false);
        onStopAiming.Raise();
    }
}
