using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossAudioManager : MonoBehaviour
{
    public AudioSource bossSource;
    public AudioSource bossFX;
    public AudioSource bossAttackSource;
    public AudioSource bossDeathSource;

    public BoolVariable isAttacking;
    public BoolVariable isDead;

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
            if (isAttacking.Value && !isDead.Value)
            {
                if (!bossAttackSource.isPlaying)
                {
                    bossAttackSource.Play();
                }
            }
            else
            {
                bossAttackSource.Stop();
            }
        }
    }

    public void PlayAudio(AudioClip clip)
    {
        if(!bossSource.isPlaying && !isDead.Value)
        {
            bossSource.PlayOneShot(clip);
        }
        else if (isDead.Value)
        {
            bossSource.Stop();
        }
    }

    public void PlayDeath()
    {
        bossDeathSource.Play();
    }

    public void PlayFX(AudioClip clip)
    {
        if (bossFX.clip != clip)
        {
            bossFX.clip = clip;
        }
        if (!bossFX.isPlaying)
        {
            bossFX.Play();
        }
    }

    public void StopAllAudio()
    {
        canPlay = false;
        if (!isDead.Value)
        {
            bossSource.Pause();
            bossFX.Pause();
            bossAttackSource.Pause();
        }
        else
        {
            bossSource.Stop();
            bossAttackSource.Stop();
        }
    }

    public void EnableAllAudio()
    {
        canPlay = true;
        bossSource.UnPause();
        bossFX.UnPause();
        bossAttackSource.UnPause();
    }

}
