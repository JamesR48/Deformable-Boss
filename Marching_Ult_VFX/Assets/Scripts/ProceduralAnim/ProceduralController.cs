using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProceduralController : MonoBehaviour
{
    public float moveInputFactor = 5f;
    public Vector3 inputVel;
    public Vector3 worldVel;
    public float walkSpeed = 2f;
    public float sprintSpeed = 5f;
    public float rotateInputFactor = 10f;
    public float rotationSpeed = 10f;
    public float averageRotationRadius = 3f;
    private float mSpeed = 0;
    private float rSpeed = 0;

    public LegPlacement[] legs;
    public int index;
    public bool dynamicGait = false;
    public float timeBetweenSteps = 0.25f;
    public float stepDurationRatio = 2f;
    [Tooltip("Used if dynamicGait is true to calculate timeBetweenSteps")] public float maxTargetDistance = 1f;
    public float lastStep = 0;

    [Header("Alignment")]
    public bool useAlignment = true;
    public int[] nextLegTri;
    public AnimationCurve sensitivityCurve;
    public float desiredSufaceDist = -1f;
    public float dist;
    public bool grounded = false;

    public bool seek = false;
    public bool attack = false;
    public bool isAttacking = false;
    public GameObject projectile;
    public Transform mouthShoot;

    public Transform player;

    void Start()
    {
        for (int i = 0; i < legs.Length; i++)
        {
            averageRotationRadius += legs[i].restingPos.z;
        }
        averageRotationRadius /= legs.Length;
    }

    void Update()
    {
        if (useAlignment) { CalculateOrientation(); }

        Move();
        
        if (!attack)
        {
            StartCoroutine(Attack());
        }

        if (dynamicGait)
        {
            if (grounded)
            {
                timeBetweenSteps = maxTargetDistance / Mathf.Max(worldVel.magnitude, Mathf.Abs(2 * Mathf.PI * rSpeed * Mathf.Deg2Rad * averageRotationRadius));
            }
            else
            {
                timeBetweenSteps = 0.25f;
            }
        }

        if (Time.time > lastStep + (timeBetweenSteps / legs.Length) && legs != null)
        {
            index = (index + 1) % legs.Length;
            if (legs[index] == null) return;

            for (int i = 0; i < legs.Length; i++)
            {
                legs[i].MoveVelocity(CalculateLegVelocity(i));
            }

            legs[index].stepDuration = Mathf.Min(1f, (timeBetweenSteps / legs.Length) * stepDurationRatio);
            legs[index].worldVel = CalculateLegVelocity(index);
            legs[index].Step();
            lastStep = Time.time;
        }
    }

    public Vector3 CalculateLegVelocity(int legIndex)
    {
        Vector3 legPoint = (legs[legIndex].restingPos);
        Vector3 legDirection = legPoint - transform.position;
        Vector3 rotationalPoint = ((Quaternion.AngleAxis((rSpeed * timeBetweenSteps) / 2f, transform.up) * legDirection) + transform.position) - legPoint;
        //DrawArc(transform.position, legDirection, rSpeed / 2f, 10f, Color.black, 1f);
        return rotationalPoint + (worldVel * timeBetweenSteps) / 2f;
    }

    private void EndAttack()
    {
        //Instantiate(projectile, mouthShoot.position + new Vector3(5f, 0f, 0f), mouthShoot.rotation, mouthShoot);
        Instantiate(projectile, mouthShoot.position, mouthShoot.rotation);
        Instantiate(projectile, mouthShoot.position + (mouthShoot.right * 3f), mouthShoot.rotation);
        Instantiate(projectile, mouthShoot.position + (mouthShoot.right * -3f), mouthShoot.rotation);
        Instantiate(projectile, mouthShoot.position + (mouthShoot.right * 6f) + (mouthShoot.forward * -1.5f), mouthShoot.rotation);
        Instantiate(projectile, mouthShoot.position + (mouthShoot.right * -6f) + (mouthShoot.forward * -1.5f), mouthShoot.rotation);
        Instantiate(projectile, mouthShoot.position + (mouthShoot.right * 9f) + (mouthShoot.forward * -2f), mouthShoot.rotation);
        Instantiate(projectile, mouthShoot.position + (mouthShoot.right * -9f) + (mouthShoot.forward * -2f), mouthShoot.rotation);
    }

    private void Move()
    {
        //mSpeed = (Input.GetButton("Fire3") ? sprintSpeed : walkSpeed);
        //mSpeed = walkSpeed;
        //Vector3 localInput = Vector3.ClampMagnitude(transform.TransformDirection(new Vector3(Input.GetAxis("Horizontal"), 0f, Input.GetAxis("Vertical"))), 1f);
        //inputVel = Vector3.MoveTowards(inputVel, localInput, Time.deltaTime * moveInputFactor);
        //worldVel = inputVel * mSpeed;
        //rSpeed = Mathf.MoveTowards(rSpeed, Input.GetAxis("Turn") * rotationSpeed, rotateInputFactor * Time.deltaTime);
        //transform.Rotate(0f, rSpeed * Time.deltaTime, 0f);

        Quaternion rot = Quaternion.LookRotation((player.position - transform.position).normalized);

        float dot = Vector3.Dot(transform.forward, (player.position - transform.position).normalized);

        //Debug.Log(dot);

        //if (player.hasChanged)
        if (dot < 0.99f && !isAttacking)
        {

            //rSpeed = Mathf.MoveTowards(rSpeed, rot.eulerAngles.y * rotationSpeed, rotateInputFactor * Time.deltaTime);

            rSpeed = Mathf.MoveTowards(rSpeed, rot.eulerAngles.normalized.y * rotationSpeed, rotateInputFactor );

            //transform.rotation = Quaternion.RotateTowards(transform.rotation, rot, rSpeed);

            //transform.Rotate(new Vector3(0f, rSpeed * Time.deltaTime,0f), Space.World);

            //Quaternion newRot = Quaternion.Slerp(transform.rotation, rot, rSpeed * Time.deltaTime * 0.1f);

            //transform.rotation = Quaternion.Euler(0f, 0f, 0f);

            transform.rotation = Quaternion.Slerp(transform.rotation, rot, rSpeed * Time.deltaTime * 0.1f);

            //player.hasChanged = false;
        }
        else if(dot >= 0.99f && !isAttacking)
        {
            rSpeed = Mathf.MoveTowards(rSpeed, 0f * rotationSpeed, rotateInputFactor * Time.deltaTime);
            //rSpeed = 0f;
            //transform.rotation = Quaternion.RotateTowards(transform.rotation, rot, rSpeed);
        }
        else if (isAttacking)
        {
            //Quaternion attackRot = Quaternion.LookRotation((player.position - transform.position).normalized);

            rSpeed = Mathf.MoveTowards(rSpeed, rot.eulerAngles.normalized.y * rotationSpeed, rotateInputFactor);

            transform.rotation = Quaternion.Slerp(transform.rotation, rot, rSpeed * Time.deltaTime * 0.1f);

            //transform.Rotate(Time.deltaTime * -45f, 0f, 0f);
            transform.Rotate(Time.deltaTime * -35f, 0f, 0f);
            Vector3 currentRotation = transform.localRotation.eulerAngles;
            if (currentRotation.x < -35f)
            {   
                currentRotation.x = -35f;
                transform.rotation = Quaternion.Euler(currentRotation);
            }
            //attack = false;
        }


        //Vector3 playerPos = new Vector3(player.transform.position.x, transform.position.y, player.transform.position.z);
        //transform.LookAt(playerPos);

        //transform.position += (worldVel * Time.deltaTime);
    }

    private void CalculateOrientation()
    {
        Vector3 up = Vector3.zero;
        float avgSurfaceDist = 0;

        grounded = false;

        Vector3 point, a, b, c;

        // Takes The Cross Product Of Each Leg And Calculates An Average Up
        for (int i = 0; i < legs.Length; i++)
        {
            point = legs[i].stepPoint;
            avgSurfaceDist += transform.InverseTransformPoint(point).y;
            a = (transform.position - point).normalized;
            b = ((legs[nextLegTri[i]].stepPoint) - point).normalized;
            c = Vector3.Cross(a, b);
            up += c * sensitivityCurve.Evaluate(c.magnitude) + (legs[i].stepNormal == Vector3.zero ? transform.forward : legs[i].stepNormal);
            grounded |= legs[i].legGrounded;

            //Debug.DrawRay(point, a, Color.red, 0);

            //Debug.DrawRay(point, b, Color.green, 0);

            //Debug.DrawRay(point, c, Color.blue, 0);
        }
        up /= legs.Length;
        avgSurfaceDist /= legs.Length;
        dist = avgSurfaceDist;
        //Debug.DrawRay(transform.position, up, Color.red, 0);
        if(isAttacking)
        {
            desiredSufaceDist = -1.5f;

        }
        else if(!isAttacking)
        {
            desiredSufaceDist = -1f;
            //desiredSufaceDist = Mathf.SmoothDamp(-0.85f, -1.16f, ref smoothVel, smoothTime); ;
            //desiredSufaceDist = (Mathf.Sin(Time.time * smoothVel) * (-1.16f))  -0.85f;
            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(Vector3.ProjectOnPlane(transform.forward, up), up), 22.5f * Time.deltaTime);
        }

        if (grounded)
        {
            transform.Translate(0, -(-avgSurfaceDist + desiredSufaceDist) * 0.5f, 0, Space.Self);
        }
        else if(!grounded && !attack)
        {
            // Simple Gravity
            transform.Translate(0, -20 * Time.deltaTime, 0, Space.World);
        }
    }

    IEnumerator Attack()
    {
        attack = true;
        yield return new WaitForSeconds(3f);
        isAttacking = true;
        yield return new WaitForSeconds(5f);
        isAttacking = false;
        yield return new WaitForSeconds(0.1f);
        EndAttack();
        attack = false;
    }

    public void OnDrawGizmosSelected()
    {
        Gizmos.DrawWireSphere(transform.position, averageRotationRadius);
    }

    public void DrawArc(Vector3 point, Vector3 dir, float angle, float stepSize, Color color, float duration)
    {
        if (angle < 0)
        {
            for (float i = 0; i > angle + 1; i -= stepSize)
            {
                Debug.DrawLine(point + Quaternion.AngleAxis(i, transform.up) * dir, point + Quaternion.AngleAxis(Mathf.Clamp(i - stepSize, angle, 0), transform.up) * dir, color, duration);
            }
        }
        else
        {
            for (float i = 0; i < angle - 1; i += stepSize)
            {
                Debug.DrawLine(point + Quaternion.AngleAxis(i, transform.up) * dir, point + Quaternion.AngleAxis(Mathf.Clamp(i + stepSize, 0, angle), transform.up) * dir, color, duration);
            }
        }
    }
}
