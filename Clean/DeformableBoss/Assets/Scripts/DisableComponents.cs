using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class DisableComponents : MonoBehaviour
{
    public MonoBehaviour[] componentsToDisable;

    public void DisableList()
    {
        foreach(MonoBehaviour comp in componentsToDisable)
        {
            comp.enabled = false;
        }
    }

    public void EnableList()
    {
        foreach (MonoBehaviour comp in componentsToDisable)
        {
            comp.enabled = true;
        }
    }

}
