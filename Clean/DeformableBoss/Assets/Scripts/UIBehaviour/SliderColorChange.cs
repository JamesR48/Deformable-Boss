using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SliderColorChange : MonoBehaviour
{
    public Image sliderImage;
    Color originalColor;

    private void Start()
    {
        originalColor = sliderImage.color;
    }

    public void SetImageColorRed()
    {
        sliderImage.color = Color.red;
    }

    public void SetImageColorOriginal()
    {
        sliderImage.color = originalColor;
    }
}
