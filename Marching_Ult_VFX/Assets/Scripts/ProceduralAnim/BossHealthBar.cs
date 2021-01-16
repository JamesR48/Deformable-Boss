using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BossHealthBar : MonoBehaviour
{
    public Slider bossHealthBarSlider;
    public BossHealth bHealth;
    public Image bossHealthBarImage;

    // Start is called before the first frame update
    void Start()
    {
        bossHealthBarSlider.maxValue = bHealth.startingHealth;
        bossHealthBarSlider.value = bHealth.currentHealth;
    }

    public void SetBossHealth(float bossHealth)
    {
        bossHealthBarSlider.value = bossHealth;
    }
}
