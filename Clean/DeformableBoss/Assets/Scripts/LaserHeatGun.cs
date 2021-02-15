using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class LaserHeatGun : MonoBehaviour
{
    public Transform gunMouth;
    public GameObject hitEffect;
    public GameObject glowEffect;
    public GameObject smokeEffect;

    public BoolVariable isFiring;
    public BoolVariable isAiming;
    public BoolVariable isOverheated;

    public IntVariable gunHeat;
    public IntVariable gunMaxHeat;

    public int heatUsageRate = 2;

    public GameEvent onDamage;
    public GameEvent onPlayerFire;
    public GameEvent onPlayerStopFire;

    public GameObject deformer;
    public Transform deformable;

    LineRenderer laser;
    RaycastHit hit;
    Vector3 laserDirection;

    int acidLayer = 10;
    int projectileLayer = 13;
    int layerMask;

    GameObject hitEffectInstance;
    ParticleSystem hitParticles;
    GameObject glowEffectInstance;
    ParticleSystem glowParticles;
    GameObject smokeEffectInstance;
    ParticleSystem smokeParticles;

    private void Awake()
    {
        hitEffectInstance = Instantiate(hitEffect, gunMouth);
        hitParticles = hitEffectInstance.transform.GetChild(0).GetComponent<ParticleSystem>();
        glowEffectInstance = Instantiate(glowEffect, gunMouth);
        glowParticles = glowEffectInstance.transform.GetChild(0).GetComponent<ParticleSystem>();
        smokeEffectInstance = Instantiate(smokeEffect, gunMouth);
        smokeParticles = smokeEffectInstance.transform.GetChild(0).GetComponent<ParticleSystem>();

        gunHeat.SetValue(gunMaxHeat);
        isOverheated.SetValue(false);
    }

    // Start is called before the first frame update
    void Start()
    {
        laser = GetComponent<LineRenderer>();
        layerMask = ~((1 << acidLayer) | (1 << projectileLayer)); // NOT ~(1 << layer1) | ~(1 << layer2)
    }

    // Update is called once per frame
    void Update()
    {
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
                if (hitParticles.isPlaying)
                {
                    hitParticles.Stop();
                }
                if (glowParticles.isPlaying)
                {
                    glowParticles.Stop();
                }

                if (!smokeParticles.isPlaying)
                {
                    smokeParticles.Play();
                }
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

        onPlayerFire.Raise();

        gunHeat.ApplyChange(-heatUsageRate);
        gunHeat.Value = (int)Mathf.Clamp(gunHeat.Value, 0, gunMaxHeat.Value);

        laserDirection = (Camera.main.transform.forward -gunMouth.right) * 100;
        laser.SetPosition(0, gunMouth.position);

        if (!glowParticles.isPlaying)
        {
            glowParticles.Play();
        }

        if (Physics.Raycast(gunMouth.position, laserDirection, out hit, Mathf.Infinity, layerMask))
        {
            laser.SetPosition(1, hit.point);

            hitParticles.transform.position = hit.point;
            if (!hitParticles.isPlaying)
            {
                hitParticles.Play();
            }

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

            if(hitParticles.isPlaying)
            {
                hitParticles.Stop();
            }
        }
    }

    public void StopFire()
    {
        if(isFiring.Value)
        {
            onPlayerStopFire.Raise();
            isFiring.SetValue(false);

            if (hitParticles.isPlaying)
            {
                hitParticles.Stop();
            }
            if (glowParticles.isPlaying)
            {
                glowParticles.Stop();
            }
            if (smokeParticles.isPlaying)
            {
                smokeParticles.Stop();
            }
        }

        laser.enabled = false;
        if (!isOverheated.Value)
        {
            gunHeat.ApplyChange(heatUsageRate);
            gunHeat.Value = (int)Mathf.Clamp(gunHeat.Value, 0, gunMaxHeat.Value);
        }
    }
}
