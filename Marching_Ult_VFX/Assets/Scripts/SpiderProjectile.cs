using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpiderProjectile : MonoBehaviour
{
    /// <summary>
    /// Public fields
    /// </summary>
    public float m_Speed = 10f;   // this is the projectile's speed
    public float m_Lifespan = 3f; // this is the projectile's lifespan (in seconds)

    public GameObject acidLake;

    /// <summary>
    /// Private fields
    /// </summary>
    //private Rigidbody m_Rigidbody;
    private string floorTag = "Floor";
    private string playerTag = "Player";

    /// <summary>
    /// Message that is called when the script instance is being loaded
    /// </summary>
    void Awake()
    {
        //m_Rigidbody = GetComponent<Rigidbody>();
    }

    /// <summary>
    /// Message that is called before the first frame update
    /// </summary>
    void Start()
    {
       // m_Rigidbody.AddForce(m_Rigidbody.transform.forward * m_Speed);
       // StartCoroutine( RemoveAfterSeconds(3) );
        //Destroy(gameObject, m_Lifespan);
    }

    private void Update()
    {
        //transform.position += new Vector3(1f, -0.1f, 0f) * m_Speed * Time.deltaTime;
        //transform.position += (transform.forward + new Vector3(0f, -0.1f, 0f)) * m_Speed * Time.deltaTime; //movedown
        transform.position += (transform.forward + new Vector3(0f, -0.05f, 0f)) * m_Speed * Time.deltaTime;
        //transform.position += new Vector3(0f, 0f, 1f) * m_Speed * Time.deltaTime;
    }

    //IEnumerator RemoveAfterSeconds(int seconds)
    //{
    //    yield return new WaitForSeconds(seconds);
    //    gameObject.SetActive(false);
    //}

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.layer == 9) //player
        {
            Destroy(this.gameObject);
        }
        else if (other.gameObject.layer == 8) //ground
        {
            //Instantiate(acidLake, other.ClosestPoint(this.transform.position), acidLake.transform.rotation);
            Destroy(this.gameObject);
        }
    }
}
