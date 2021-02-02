using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AcidLake : MonoBehaviour
{
    public GameEvent acidLakeEvent;

    // Start is called before the first frame update
    void Start()
    {
        InvokeRepeating("StartAcidLakeEvent", 5f, 8f);//15 15
    }

    public void StartAcidLakeEvent()
    {
        acidLakeEvent.Raise();
    }
}
