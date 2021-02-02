using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LaserOverheat : MonoBehaviour
{
    public BoolVariable isFiring;
    public BoolVariable isOverheated;
    public IntVariable gunHeat;
    public IntVariable gunMaxHeat;
    public GameEvent onOverheat;
    public GameEvent onCooldown;

    public int heatRestoreRate = 1;

    // Update is called once per frame
    void Update()
    {
        Overheat();
        if (isOverheated.Value)
        {
            CoolDown();
        }
    }

    public void Overheat()
    {
        if (gunHeat.Value <= 0 && !isOverheated.Value)
        {
            isOverheated.SetValue(true);
            onOverheat.Raise();
        }
        else if (gunHeat.Value == gunMaxHeat.Value && isOverheated.Value)
        {
            isOverheated.SetValue(false);
            onCooldown.Raise();
        }
    }

    public void CoolDown()
    {
        if (!isFiring.Value)
        {
            gunHeat.ApplyChange(heatRestoreRate);
        }
    }
}
