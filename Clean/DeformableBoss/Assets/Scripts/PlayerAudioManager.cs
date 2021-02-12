using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerAudioManager : MonoBehaviour
{
    public AudioSource PlayerSource;
    public AudioSource PlayerRunningSource;
    public AudioSource laserSource;

    public BoolVariable isPlayerFiring;
    public BoolVariable isOverheated;
    public BoolVariable isPlayerAiming;

    public FloatVariable horizontalInput, verticalInput;

    bool isMoving = false;
    bool canPlay = true;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (canPlay)
        {
            PlayLaserOverHeat();
            PlayPlayerRun();
        }
    }

    public void PlayPlayer(AudioClip clip)
    {
        if (canPlay)
        {
            PlayerSource.PlayOneShot(clip);
        }
    }

    public void PlayLaser(AudioClip clip)
    {
        if(laserSource.clip != clip)
        {
            laserSource.clip = clip;
        }
        if(!laserSource.isPlaying && isPlayerFiring.Value)
        {
            laserSource.Play();
        }
    }

    void PlayLaserOverHeat()
    {
        if (isPlayerFiring.Value && isOverheated.Value && !laserSource.isPlaying)
        {
            laserSource.Play();
        }
    }

    void PlayPlayerRun()
    {
        if ((horizontalInput.Value != 0 || verticalInput.Value != 0))
        {
            isMoving = true;
        }
        else
        {
            isMoving = false;
        }
        if(isMoving && !PlayerRunningSource.isPlaying)
        {
            PlayerRunningSource.Play();
        }
        if (!isMoving)
        {
            PlayerRunningSource.Stop();
        }
    }

    public void StopLaser()
    {
        laserSource.Stop();
    }

    public void StopAllAudio()
    {
        canPlay = false;
        PlayerSource.Stop();
        laserSource.Stop();
        PlayerRunningSource.Stop();
    }

    public void EnableAllAudio()
    {
        canPlay = true;
    }
}
