using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossDeathControl : MonoBehaviour
{
    public GameObject flashImage;
    public GameEvent onChangeScene;

    void ActiveFlash()
    {
        flashImage.SetActive(true);
    }

    public void InitBossDeath()
    {
        StartCoroutine(Delay());
    }

    IEnumerator Delay()
    {
        yield return new WaitForSeconds(4);
        ActiveFlash();
        yield return new WaitForSeconds(4);
        onChangeScene.Raise();
    }
}
