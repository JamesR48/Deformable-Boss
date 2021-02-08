using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;

[RequireComponent(typeof(CinemachineVirtualCamera))]
public class CinemachineShake : MonoBehaviour
{
    public float shakeDuration = 0.25f;
    public float shakeAmplitude = 2;
    public float shakeFrequency = 1;
    public bool decreaseNoise = false;
    //public bool canActiveNoise = false;

    CinemachineVirtualCamera CMVirtualCamera;
    CinemachineBasicMultiChannelPerlin VCameraNoise;

    //bool activeNoise = false;
    float shakeTimer = 0;

    // Start is called before the first frame update
    void Start()
    {
        CMVirtualCamera = GetComponent<CinemachineVirtualCamera>();
        VCameraNoise = CMVirtualCamera.GetCinemachineComponent<CinemachineBasicMultiChannelPerlin>(); //GetComponent<CinemachineBasicMultiChannelPerlin>();
    }

    // Update is called once per frame
    void Update()
    {
        //if(activeNoise)
        //{
        //    if(decreaseNoise)
        //    {
        //        DecreasingNoise();
        //    }
        //}

        if(decreaseNoise)
        {
            DecreasingNoise();
        }

        if(shakeTimer > 0)
        {
            shakeTimer -= Time.deltaTime;
            if(shakeTimer <= 0)
            {
                StopNoise();
                shakeTimer = 0;
            }
        }

    }

    void DecreasingNoise()
    {
        if (VCameraNoise.m_AmplitudeGain <= 0)
        {
            VCameraNoise.m_AmplitudeGain = shakeAmplitude;
        }
        VCameraNoise.m_AmplitudeGain -= Time.deltaTime * shakeDuration;
        VCameraNoise.m_AmplitudeGain = Mathf.Clamp(VCameraNoise.m_AmplitudeGain, 0, shakeAmplitude);
    }

    public void InitNoise()
    {
        VCameraNoise.m_AmplitudeGain = shakeAmplitude/2;
    }

    public void StopNoise()
    {
        VCameraNoise.m_AmplitudeGain = 0;
    }

    public void NoiseForTime()
    {
        VCameraNoise.m_AmplitudeGain = shakeAmplitude;
        shakeTimer = shakeDuration;
    }
}
