using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class LaserHeatGun : MonoBehaviour
{
    public Transform gunMouth;
    public BoolVariable isFiring;
    public BoolVariable isAiming;
    public BoolVariable isOverheated;

    public IntVariable gunHeat;
    public IntVariable gunMaxHeat;

    public int heatUsageRate = 2;

    public GameEvent onDamage;

    public GameObject deformer;
    public Transform deformable;

    LineRenderer laser;
    RaycastHit hit;
    Vector3 laserDirection;

    private void Awake()
    {
        gunHeat.SetValue(gunMaxHeat);
        isOverheated.SetValue(false);
    }

    // Start is called before the first frame update
    void Start()
    {
        laser = GetComponent<LineRenderer>();
    }

    // Update is called once per frame
    void Update()
    {
        //if (isAiming.Value && Input.GetKey(KeyCode.Q))
        if (isAiming.Value && (Input.GetMouseButton(0) || Input.GetKey(KeyCode.Q))) //Left click to shoot
        {
            isFiring.SetValue(true);
            if (!isOverheated.Value)
            {
                Fire();
            }
            else
            {
                laser.enabled = false;
            }
        }
        else
        {
            
            StopFire();
        }
    }

    public void Fire()
    {
        
        laser.enabled = true;

        gunHeat.ApplyChange(-heatUsageRate);
        gunHeat.Value = (int)Mathf.Clamp(gunHeat.Value, 0, gunMaxHeat.Value);

        laserDirection = (Camera.main.transform.forward -gunMouth.right) * 100;
        laser.SetPosition(0, gunMouth.position);

        if (Physics.Raycast(gunMouth.position, laserDirection, out hit))
        {
            laser.SetPosition(1, hit.point);
            if (hit.collider.gameObject.layer == 11) //Layer 11 = Boss
            {
                onDamage.Raise();
                if(deformer && deformable)
                {
                    deformer.transform.localPosition = deformable.InverseTransformPoint(hit.point);
                }
            }
        }
        else
        {
            laser.SetPosition(1, laserDirection);
        }
    }

    public void StopFire()
    {
        isFiring.SetValue(false);
        laser.enabled = false;
        if (!isOverheated.Value)
        {
            gunHeat.ApplyChange(heatUsageRate);
            gunHeat.Value = (int)Mathf.Clamp(gunHeat.Value, 0, gunMaxHeat.Value);
        }
    }
}
