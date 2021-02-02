using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Health : MonoBehaviour
{
    public IntVariable healthPoints;
    public IntReference startingHP;
    public GameEvent deathEvent;

    // Start is called before the first frame update
    void Start()
    {
        healthPoints.SetValue(startingHP.Value);
    }

    public void TakeDamage()
    {
        healthPoints.ApplyChange(-1);
        if (healthPoints.Value <= 0)
        {
            deathEvent.Raise();
        }
    }

}
