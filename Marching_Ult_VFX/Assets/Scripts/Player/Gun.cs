using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gun : MonoBehaviour
{
    public GameObject gun;
    public PlayerMovement pmInfo;

    public LineRenderer line;

    Transform firePoint;

    public GameObject bullet;
    //public GameObject boss;

    RaycastHit hit;
    Transform bulletOriginalTransform;
    public Transform chunk;

    [Range(1, 10)]
    public int gunDamagePower = 1;
    [Range(0.5f, 10f)]
    public float gunCooldown = 10f;
    [Range(0.5f, 10f)]
    public float gunOverheat = 5f;

    float overheatTimer;
    bool isOverheated = false;

    public GunHeatBar heatBar;

    // Start is called before the first frame update
    void Start()
    {
        firePoint = gun.transform.GetChild(0).transform;
        bulletOriginalTransform = bullet.transform;
        //chunk = boss.transform.GetChild(8);
        //chunk = boss.transform.Find("Chunk (0, 0, 0)");
    }

    // Update is called once per frame
    void Update()
    {

        if (pmInfo.isAiming && Input.GetKey(KeyCode.Q) && !isOverheated)
        {
            if (overheatTimer < gunOverheat)
            {
                Fire();
                overheatTimer += Time.deltaTime;

                heatBar.SetGunHeat(gunOverheat - overheatTimer);
            }
            else
            {
                StopFire();
                isOverheated = true;
            }
        }
        else
        {
            StopFire();
        }
    }

    void Fire()
    {
        pmInfo.isFiring = true;
        pmInfo.animator.SetBool("IsFiring", pmInfo.isFiring);

        line.enabled = true;
        //Debug.DrawRay(firePoint.position, transform.forward * 100, Color.red);

        line.SetPosition(0, firePoint.position);
        line.SetPosition(1, (pmInfo.target.forward + Camera.main.transform.forward) * 100);

        if (Physics.Raycast(firePoint.position, (pmInfo.target.forward + Camera.main.transform.forward) * 100, out hit))
        {
            //Debug.Log(hit.point);

            //line.SetPosition(1, (pmInfo.target.forward + Camera.main.transform.forward) * 100);
            //line.SetPosition(1, (hit.point));
            if (hit.collider.tag == "Deformable")
            {
                bullet.transform.localPosition = chunk.InverseTransformPoint(hit.point);
                BossHealth bHealth = hit.collider.transform.parent.parent.GetComponent<BossHealth>();
                bHealth.TakeDamage(gunDamagePower);
            }
        }

        //bullet.transform.localPosition = bulletOriginalTransform.position;
    }

    void StopFire()
    {
        if (pmInfo.isAiming && Input.GetKey(KeyCode.Q) && isOverheated)
        {
            pmInfo.isFiring = false;
            pmInfo.animator.SetBool("IsFiring", pmInfo.isFiring);
            line.enabled = false;
        }
        else if(!Input.GetKey(KeyCode.Q) && !isOverheated)
        {
            pmInfo.isFiring = false;
            pmInfo.animator.SetBool("IsFiring", pmInfo.isFiring);
            line.enabled = false;
            GunCooldown();
        }
        if (!Input.GetKey(KeyCode.Q) && isOverheated)
        {
            pmInfo.isFiring = false;
            pmInfo.animator.SetBool("IsFiring", pmInfo.isFiring);
            line.enabled = false;
            GunCooldown();
        }
    } 

    void GunCooldown()
    {
        if(overheatTimer >= 0f)
        {
            if (!isOverheated)
            {
                heatBar.SetHeatBarColor(Color.cyan);
                overheatTimer -= Time.deltaTime / 4;
            }
            else
            {
                heatBar.SetHeatBarColor(Color.red);
                overheatTimer -= Time.deltaTime / 6;

                if (overheatTimer <= 0f)
                {
                    isOverheated = false;
                    heatBar.SetHeatBarColor(Color.cyan);
                }
            }

            heatBar.SetGunHeat(gunOverheat - overheatTimer);
        }
    }

}
