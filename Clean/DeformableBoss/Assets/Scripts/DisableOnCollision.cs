using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DisableOnCollision : MonoBehaviour
{
    void OnTriggerEnter(Collider other)
    {
        this.gameObject.SetActive(false);
    }
}
