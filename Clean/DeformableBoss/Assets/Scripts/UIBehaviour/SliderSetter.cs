using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Sets a Slider component's fill amount to represent how far Variable is
/// between Min and Max.
/// </summary>
[RequireComponent(typeof(Slider))]
public class SliderSetter : MonoBehaviour
{
    Slider slider;
    public IntVariable Variable;
    public IntReference Max;

    // Start is called before the first frame update
    void Start()
    {
        slider = GetComponent<Slider>();
        slider.maxValue = Max.Value;
        slider.value = Max.Value;
    }

    // Update is called once per frame
    private void Update()
    {
        if (slider.value != Variable.Value)
        {
            slider.value = Variable.Value;
        }
    }
}
