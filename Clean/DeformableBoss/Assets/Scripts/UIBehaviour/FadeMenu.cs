using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(CanvasGroup))]
public class FadeMenu : MonoBehaviour
{
    CanvasGroup canvasGroup;
    public float fadeSpeed = 1;
    public bool fadeIn = false;
    public bool canFade = false;

    void OnEnable()
    {
        canvasGroup = this.GetComponent<CanvasGroup>();
    }

    // Update is called once per frame
    void Update()
    {
        if (canFade)
        {
            if (fadeIn)
            {
                FadeIn();
            }
            else
            {
                FadeOut();
            }
        }
    }

    void FadeIn()
    {
        if (canvasGroup.alpha <= 1)
        {
            canvasGroup.alpha = Mathf.Lerp(canvasGroup.alpha, 1, Time.deltaTime * fadeSpeed);
        }
    }

    void FadeOut()
    {
        if (canvasGroup.alpha > 0)
        {
            canvasGroup.alpha = Mathf.Lerp(canvasGroup.alpha, 0, Time.deltaTime * fadeSpeed);
        }
    }

    public void EnableFade()
    {
        canFade = true;
    }

    public void SetFadeIn()
    {
        fadeIn = true;
    }
}
