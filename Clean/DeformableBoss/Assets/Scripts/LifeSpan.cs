using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LifeSpan : MonoBehaviour
{
    public int lifeSpan = 8;

    void OnEnable()
    {
        StartCoroutine(DisableAfterSeconds());
    }

    IEnumerator DisableAfterSeconds()
    {
        yield return new WaitForSeconds(lifeSpan);
        gameObject.SetActive(false);
    }
}
