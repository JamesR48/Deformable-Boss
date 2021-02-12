using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AcidFountain : MonoBehaviour
{
    public Transform playerTransform;
    public GameObjectPool acidPool;
    public GameObjectPool markPool;
    public Renderer groundRenderer;
    public Vector3 acidOriginOffset = new Vector3(0, 11, 0);

    // Start is called before the first frame update
    void Start()
    {
        
    }

    public void Fountain()
    {
        GameObject projectileToPlayer = acidPool.GetPooledObject(transform.position+ acidOriginOffset, Quaternion.identity);
        projectileToPlayer.GetComponent<BezierMotion>().endPoint = playerTransform.position;
        projectileToPlayer.GetComponent<ExplodeOnCollision>().makeSound = true;

        GameObject markToPlayer = markPool.GetPooledObject(new Vector3(playerTransform.position.x, -10.7f, playerTransform.position.z), Quaternion.identity);

        for (int i = 0; i < 3; i++)
        {
            GameObject projectile = acidPool.GetPooledObject(transform.position + acidOriginOffset, Quaternion.identity);
            Vector3 randomPoint = new Vector3(Random.Range(-groundRenderer.bounds.size.x / 2, groundRenderer.bounds.size.x / 2), -10.7f, Random.Range(-groundRenderer.bounds.size.z / 2, groundRenderer.bounds.size.z / 2));
            projectile.GetComponent<BezierMotion>().endPoint = randomPoint;

            GameObject mark = markPool.GetPooledObject(randomPoint, Quaternion.identity);
        }
    }
}
