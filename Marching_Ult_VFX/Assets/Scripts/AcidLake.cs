using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AcidLake : MonoBehaviour
{
    public GameObject acidProjectile;
    public GameObject ground;
    Renderer groundRenderer;

    GameObject projectileToPlayer;
    float lastTime = -1;
    //public Transform playerTransform;

    // Start is called before the first frame update
    void Start()
    {
        groundRenderer = ground.GetComponent<Renderer>();
        InvokeRepeating("LaunchAcid", 5f, 8f);//15 15
    }

    void LaunchAcid()
    {
        projectileToPlayer = Instantiate(acidProjectile, transform.position + new Vector3(0, 11, 0), Quaternion.identity);
        projectileToPlayer.GetComponent<AcidProjectile>().LaunchCondition(0, Vector3.zero) ;
        for (int i = 0; i < 3; i ++)
        {
            GameObject proj = Instantiate(acidProjectile, transform.position + new Vector3(0, 11, 0), Quaternion.identity);
            proj.GetComponent<AcidProjectile>().LaunchCondition(1, new Vector3(Random.Range(-groundRenderer.bounds.size.x/2, groundRenderer.bounds.size.x/2), -10.7f, Random.Range(-groundRenderer.bounds.size.z/2, groundRenderer.bounds.size.z/2)));
        }
    }


}
