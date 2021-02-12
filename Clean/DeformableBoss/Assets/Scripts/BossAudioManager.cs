using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossAudioManager : MonoBehaviour
{
    public AudioSource bossSource;
    public AudioSource bossFX;
    public AudioSource bossAttackSource;

    public BoolVariable isAttacking;
    public BoolVariable isDead;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (isAttacking.Value)
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

    public void PlayAudio(AudioClip clip)
    {
        if(!bossSource.isPlaying && !isDead.Value)
        {
            bossSource.PlayOneShot(clip);
        }
        else if (isDead.Value)
        {
            bossSource.clip = clip;
            bossSource.priority = 0;
            bossSource.Play();
        }
    }

    public void PlayFX(AudioClip clip)
    {
        if(bossFX.clip != clip)
        {
            bossFX.clip = clip;
        }
        if (!bossFX.isPlaying)
        {
            bossFX.Play();
        }
    }
}
