using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Crosshair : MonoBehaviour
{
    Image crosshairImg;
    Color imgColor;
    Color invisible;
    bool coroutineRunning = false;
    Coroutine lastRoutine = null;

    // Start is called before the first frame update
    void Start()
    {
        crosshairImg = GetComponent<Image>();
        imgColor = crosshairImg.color;
        invisible = new Color(imgColor.r, imgColor.g, imgColor.b, 0);
        crosshairImg.color = invisible;
    }

    public void EnableCrosshair()
    {
        lastRoutine = StartCoroutine(Delay());
    }

    public void DisableCrosshair()
    {
        if (coroutineRunning && lastRoutine != null)
        {
            StopCoroutine(lastRoutine);
            coroutineRunning = false;
        }
        crosshairImg.color = invisible;
    }

    IEnumerator Delay()
    {
        coroutineRunning = true;
        yield return new WaitForSeconds(0.15f); //0.25
        crosshairImg.color = imgColor;
        coroutineRunning = false;
    }
}
