using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ExplodeOnCollision : MonoBehaviour
{
    public GameObject effectGO;
    [HideInInspector]
    public GameObject explosionSourceGO;
    public float effectSizeMultiplier = 5;
    public Vector3 effectPostionOffset = Vector3.up;
    public AudioClip effectSound;

    public bool makeSound = false;
    public bool makeSingleSound = true;

    ParticleSystem particleFX;
    AudioSource audioFXsource;
    AudioSource explosionSource;
    GameObject FXParent;
    string FXTag = "FXParent";
    GameObject FXInstance;

    void Awake()
    {
        FXParent = GameObject.FindGameObjectWithTag(FXTag);
        FXInstance = Instantiate(effectGO, FXParent.transform);
        particleFX = FXInstance.transform.GetChild(0).GetComponent<ParticleSystem>();
        particleFX.transform.localScale *= effectSizeMultiplier;
        audioFXsource = FXInstance.GetComponent<AudioSource>();

        
    }

    void OnTriggerEnter(Collider other)
    {
        particleFX.transform.position = this.transform.position + effectPostionOffset;
        particleFX.Play();

        if (explosionSource == null)
        {
            explosionSource = explosionSourceGO.GetComponent<AudioSource>();
        }

        if (makeSound)
        {
            audioFXsource.PlayOneShot(effectSound);
        }
        else if(makeSingleSound)
        {
            if (!explosionSource.isPlaying)
            {
                explosionSource.PlayOneShot(effectSound);
            }
        }
    }
}
