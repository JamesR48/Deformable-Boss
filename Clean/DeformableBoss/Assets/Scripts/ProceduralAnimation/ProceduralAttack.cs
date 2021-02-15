using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProceduralAttack : MonoBehaviour
{
    public GameObject chargeEffect;
    public Transform shootPoint;
    public FloatVariable desiredSufaceDist; //-6 default
    public GameEvent attackEvent;
    public float rotationAngle = -45;
    public float chargingSpeed = 20;
    public float releaseSpeed = 40;

    //bool isAttacking = false;
    public BoolVariable isAttacking;
    bool attack = false;
    Quaternion newRotation;
    float eulerRotX = 0, eulerRotY = 0, eulerRotZ = 0;

    GameObject chargeFXInstance;
    ParticleSystem chargeParticles;

    void Awake()
    {
        isAttacking.SetValue(false);

        chargeFXInstance = Instantiate(chargeEffect,shootPoint);
        chargeParticles = chargeFXInstance.transform.GetChild(0).GetComponent<ParticleSystem>();
    }

    // Update is called once per frame
    void Update()
    {
        if (!attack)
        {
            StartCoroutine(AttackRoutine());
        }

        AttackMotion();
    }

    void AttackMotion()
    {
        if (isAttacking.Value)
        {
            if (desiredSufaceDist.Value > -15)
            {
                desiredSufaceDist.ApplyChange(-Time.deltaTime * 2);
            }

            eulerRotX = transform.eulerAngles.x;
            eulerRotX += (rotationAngle * Time.deltaTime * chargingSpeed);
            eulerRotX = Mathf.Clamp(eulerRotX, 326, 360);

            eulerRotY = transform.eulerAngles.y;
            eulerRotZ = transform.eulerAngles.z;

            newRotation = Quaternion.Euler(eulerRotX, eulerRotY, eulerRotZ);
            transform.rotation = Quaternion.Slerp(transform.rotation, newRotation, Time.deltaTime);
        }
        else
        {
            if (transform.rotation.eulerAngles.x > 0)
            {
                eulerRotX = 0;
                eulerRotY = transform.eulerAngles.y;
                eulerRotZ = transform.eulerAngles.z;

                newRotation = Quaternion.Euler(eulerRotX, eulerRotY, eulerRotZ);
                transform.rotation = Quaternion.Slerp(transform.rotation, newRotation, Time.deltaTime * releaseSpeed);
            }
            desiredSufaceDist.SetValue(-6);
        }
    }

    IEnumerator AttackRoutine()
    {
        attack = true;
        yield return new WaitForSeconds(3f);
        isAttacking.SetValue(true); //raiseAttackMotionEvent()
        if(!chargeParticles.isPlaying)
        {
            chargeParticles.Play();
        }
        yield return new WaitForSeconds(5f);
        isAttacking.SetValue(false); //raiseEndAttackMotionEvent()
        if(chargeParticles.isPlaying)
        {
            chargeParticles.Stop();
        }
        //desiredSufaceDist.SetValue(-6);
        yield return new WaitForSeconds(0.1f);
        attackEvent.Raise();  //raiseAttackEvent()
        attack = false;
    }

    float EulerAngleTo360(float angle)
    {
        float result = angle - Mathf.CeilToInt(angle / 360f) * 360f;
        if (result < 0)
        {
            result += 360f;
        }
        return result;
    }

    public void StopEffects()
    {
        if (chargeParticles.isPlaying)
        {
            chargeParticles.Stop();
        }
    }
}
