using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioPlayer : MonoBehaviour
{
    public AudioSource musicSource;
    public AudioSource effectSource;

    // Play a single clip through the sound effects source.
    public void Play(AudioClip clip)
    {
        effectSource.PlayOneShot(clip);
    }

    // Play a single clip through the music source.
    public void PlayMusic(AudioClip clip)
    {
        musicSource.clip = clip;
        musicSource.loop = false;
        musicSource.Play();
    }

    public void LowerMusic()
    {
        musicSource.volume = 0.25f;
    }

    public void NormalMusic()
    {
        musicSource.volume = 1;
    }

    public void StopMusic()
    {
        musicSource.Stop();
    }

    public void StopAudio()
    {
        effectSource.Stop();
    }
}
