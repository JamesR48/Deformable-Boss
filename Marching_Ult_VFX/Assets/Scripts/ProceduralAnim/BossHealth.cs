using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossHealth : MonoBehaviour
{
    public int startingHealth = 50;
    [HideInInspector]
    public int currentHealth;
    public BossHealthBar bHealthBar;

    private void OnEnable()
    {
        currentHealth = startingHealth;
    }

    public void TakeDamage(int damageAmount)
    {
        currentHealth -= damageAmount;
        bHealthBar.SetBossHealth(currentHealth);
    }
}
