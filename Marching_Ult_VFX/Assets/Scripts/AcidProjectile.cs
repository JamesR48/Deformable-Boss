using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AcidProjectile : MonoBehaviour
{
    Vector3 startPoint;
    Vector3 controlPoint;
    Vector3 midPoint;
    //Transform playerPoint;
    Vector3 playerCurrentPositon;
    string playerTag = "Player";
    string floorTag = "Floor";
    float bezierTime = 0;
    int launch = -1;
    Vector3 randomPoint = Vector3.zero;

    public float maxHeight = 25;
    public GameObject aProjectile;
    public GameObject aShadow;

    // Start is called before the first frame update
    void Start()
    {
        //startPoint = GameObject.FindGameObjectWithTag(acidLakeTag).transform.position;
        startPoint = transform.position;
        playerCurrentPositon = GameObject.FindGameObjectWithTag(playerTag).transform.position*1.1f;

        midPoint = (playerCurrentPositon - startPoint) /2;
        controlPoint = new Vector3(midPoint.x, maxHeight, midPoint.z);
    }

    // Update is called once per frame
    void Update()
    {
        if (launch == 0)
        {
            LaunchAtPlayer(Time.deltaTime);
        }
        else if (launch == 1)
        {
            LaunchAtRandom(Time.deltaTime, randomPoint);
        }
    }

    public void LaunchCondition(int launchTo, Vector3 randPoint)
    {
        launch = launchTo;
        randomPoint = randPoint;
           
        if (launch == 1)
        {
            aShadow.transform.position = randomPoint;
        }
    }

    void LaunchAtRandom(float time, Vector3 launchTarget)
    {
        bezierTime = bezierTime + time * 0.5f; //Time.deltaTime
        if (bezierTime >= 1)
        {
            bezierTime = 0;
        }
        aProjectile.transform.position = QuadraticBezier(bezierTime, launchTarget);
    }

    void LaunchAtPlayer(float time)
    {
        aShadow.transform.position = new Vector3(playerCurrentPositon.x/1.1f, -10.7f, playerCurrentPositon.z / 1.1f);

        bezierTime = bezierTime + time * 0.5f; //Time.deltaTime
        if (bezierTime >= 1)
        {
            bezierTime = 0;
        }
        aProjectile.transform.position = QuadraticBezier(bezierTime, playerCurrentPositon);
    }

    Vector3 QuadraticBezier(float time, Vector3 endPoint)
    {
        return (((1 - time) * (1 - time)) * startPoint) + (2 * time * (1 - time) * controlPoint) + ((time * time) * endPoint);
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.layer == 9) //player
        {
            Destroy(this.gameObject);
        }
        //else if (other.gameObject.layer == 8) //ground
        else if(other.tag == floorTag)
        {
            //Instantiate(acidLake, other.ClosestPoint(this.transform.position), acidLake.transform.rotation);
            Destroy(this.gameObject);
        }
    }
}
