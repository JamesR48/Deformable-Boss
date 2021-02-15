using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayParticles : MonoBehaviour
{
    public GameObject effectGO;
    public Vector3 positionOffset = Vector3.up;

    ParticleSystem effectParticles;
    GameObject effectInstance;

    // Start is called before the first frame update
    void Start()
    {
        effectInstance = Instantiate(effectGO, this.transform);
        effectInstance.transform.position -= positionOffset;
        effectParticles = effectInstance.transform.GetChild(0).GetComponent<ParticleSystem>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void PlayEffect()
    {
        effectParticles.Play();
    }

    public void StopEffect()
    {
        effectParticles.Stop();
    }
}
