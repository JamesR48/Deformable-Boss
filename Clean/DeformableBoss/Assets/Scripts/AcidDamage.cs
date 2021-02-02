using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AcidDamage : MonoBehaviour
{
    public GameEvent OnDamaged;
    public FloatVariable invulnerableCounter;
    public VectorVariable knockDirection;

    void OnTriggerEnter(Collider other)
    {
        // layer 10: Acid                 //layer 13: Projectile
        if ((other.gameObject.layer == 10 || other.gameObject.layer == 13) && invulnerableCounter.Value <= 0)
        {
            Vector3 hitDirection = other.transform.position - transform.position;
            hitDirection = hitDirection.normalized;
            knockDirection.SetValue(hitDirection);
            OnDamaged.Raise();
        }
    }


}
