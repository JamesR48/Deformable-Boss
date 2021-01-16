using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GunHeatBar : MonoBehaviour
{
    public Slider gunHeatBarSlider;
    public Gun playerGun;
    public Image heatBarImage;

    // Start is called before the first frame update
    void Start()
    {
        gunHeatBarSlider.maxValue = playerGun.gunOverheat;
        gunHeatBarSlider.value = playerGun.gunOverheat;
    }

    public void SetGunHeat(float heat)
    {
        gunHeatBarSlider.value = heat;
    }

    public void SetHeatBarColor(Color heatBarColor)
    {
        heatBarImage.color = heatBarColor;
    }
}
