using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShootBullets : MonoBehaviour
{
    public GameObjectPool bulletPool;
    public Transform firePoint;
    public Vector3 firePointOffset = new Vector3(0, -1, 0);
    public GameObject explosionSoundGO;

    Vector3 fpPosition;
    Quaternion fpRotation;
    GameObject[] bullets;

    void Awake()
    {
        bullets = new GameObject[7];    
    }

    public void BossBulletShoot()
    {
        fpPosition = firePoint.position + firePointOffset;
        fpRotation = firePoint.rotation;

        bullets[0] = bulletPool.GetPooledObject(fpPosition, fpRotation);
        bullets[1] = bulletPool.GetPooledObject(fpPosition + (firePoint.right * 3f), fpRotation);
        bullets[2] = bulletPool.GetPooledObject(fpPosition + (firePoint.right * -3f), fpRotation);
        bullets[3] = bulletPool.GetPooledObject(fpPosition + (firePoint.right * 6f) + (firePoint.forward * -1.5f), fpRotation);
        bullets[4] = bulletPool.GetPooledObject(fpPosition + (firePoint.right * -6f) + (firePoint.forward * -1.5f), fpRotation);
        bullets[5] = bulletPool.GetPooledObject(fpPosition + (firePoint.right * 9f) + (firePoint.forward * -2f), fpRotation);
        bullets[6] = bulletPool.GetPooledObject(fpPosition + (firePoint.right * -9f) + (firePoint.forward * -2f), fpRotation);

        for (int i = 0; i < bullets.Length; i++)
        {
            bullets[i].GetComponent<ExplodeOnCollision>().explosionSourceGO = explosionSoundGO;
        }
    }
}
