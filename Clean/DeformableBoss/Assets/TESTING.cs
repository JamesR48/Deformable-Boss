using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TESTING : MonoBehaviour
{
    public float counter;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (counter > 0)
        {
            Debug.Log("Counter is decreasing: "+counter);
            counter -= Time.deltaTime;
            if (counter <= 0)
            {
                Debug.Log("Counter is now: " + counter);
            }
        } 
    }
}
