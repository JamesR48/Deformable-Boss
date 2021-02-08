using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProceduralDeath : MonoBehaviour
{
    public BoolVariable isAttacking;
    public FloatVariable desiredSufaceDist; //-6 default
    public BoolVariable isDead;
    public float rotationAngle = -45;
    public float riseSpeed = 4;
    public float shakeSpeed = 30;
    public float shakeAmplitude = 60;

    Quaternion newRotation;
    float eulerRotX = 0, eulerRotY = 0, eulerRotZ = 0;
    bool dead = false;
    bool initDeath = false;
    bool endDeath = false;
    bool goDown = false;

    void Start()
    {
        isDead.SetValue(false);    
    }

    // Update is called once per frame
    void Update()
    {
        if (dead)
        {
            StartCoroutine(DeathRoutine());
        }
        if (initDeath)
        {
            InitDeathMotion();
        }
        if (endDeath)
        {
            EndDeathMotion();
        }
        if (goDown)
        {
            transform.Translate(0, -5f * Time.deltaTime, 0, Space.World);
            Shake(shakeSpeed / 3, shakeAmplitude / 3);
        }
    }

    void InitDeathMotion()
    {
        if(desiredSufaceDist.Value > -12)
        {
            desiredSufaceDist.ApplyChange(-Time.deltaTime * 2);
        }

        Shake(shakeSpeed/1.5f, shakeAmplitude / 1.5f);
    }

    void EndDeathMotion()
    {
        if (desiredSufaceDist.Value < -2)
        {
            desiredSufaceDist.ApplyChange(Time.deltaTime * 4f); //4
        }

        Shake(shakeSpeed/3, shakeAmplitude/3);
    }

    void Shake(float speed, float amplitude)
    {
        eulerRotX = transform.eulerAngles.x;
        eulerRotX += (rotationAngle * Time.deltaTime * riseSpeed);
        eulerRotX = Mathf.Clamp(eulerRotX, 326, 360);

        eulerRotY = transform.eulerAngles.y;
        //eulerRotY += (Mathf.Sin(Time.time * shakeSpeed) * shakeAmplitude);

        eulerRotZ = transform.eulerAngles.z;
        eulerRotZ += (Mathf.Sin(Time.time * speed) * amplitude);

        newRotation = Quaternion.Euler(eulerRotX, eulerRotY, eulerRotZ);
        transform.rotation = Quaternion.Slerp(transform.rotation, newRotation, Time.deltaTime);
    }

    public void SetDead()
    {
        dead = true;
    }

    IEnumerator DeathRoutine()
    {
        if (transform.eulerAngles.x < 350)
        {
            transform.rotation = Quaternion.Euler(0, transform.eulerAngles.y, 0);
            desiredSufaceDist.SetValue(-6);
        }

        dead = false;
        initDeath = true;
        yield return new WaitForSeconds(3f);
        initDeath = false;
        endDeath = true;
        yield return new WaitForSeconds(1.5f);
        endDeath = false;
        isDead.SetValue(true);
        goDown = true;
        yield return new WaitForSeconds(2f);
        goDown = false;
    }
}
