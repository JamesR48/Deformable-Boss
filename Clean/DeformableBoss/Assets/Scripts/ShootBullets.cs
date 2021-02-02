using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShootBullets : MonoBehaviour
{
    public GameObjectPool bulletPool;
    public Transform firePoint;
    public Vector3 firePointOffset = new Vector3(0, -1, 0);

    Vector3 fpPosition;
    Quaternion fpRotation;

    public void BossBulletShoot()
    {
        fpPosition = firePoint.position + firePointOffset;
        fpRotation = firePoint.rotation;

        GameObject bullet0 = bulletPool.GetPooledObject(fpPosition, fpRotation);
        GameObject bullet1 = bulletPool.GetPooledObject(fpPosition + (firePoint.right * 3f), fpRotation);
        GameObject bullet2 = bulletPool.GetPooledObject(fpPosition + (firePoint.right * -3f), fpRotation);
        GameObject bullet3 = bulletPool.GetPooledObject(fpPosition + (firePoint.right * 6f) + (firePoint.forward * -1.5f), fpRotation);
        GameObject bullet4 = bulletPool.GetPooledObject(fpPosition + (firePoint.right * -6f) + (firePoint.forward * -1.5f), fpRotation);
        GameObject bullet5 = bulletPool.GetPooledObject(fpPosition + (firePoint.right * 9f) + (firePoint.forward * -2f), fpRotation);
        GameObject bullet6 = bulletPool.GetPooledObject(fpPosition + (firePoint.right * -9f) + (firePoint.forward * -2f), fpRotation);
    }
}
