using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProceduralController : MonoBehaviour
{
    public Vector3 worldVel;
    public float averageRotationRadius = 3f;

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
    public FloatVariable desiredSufaceDist;
    public float dist;
    public bool grounded = false;

    public FloatVariable rotationSpeed;
    public BoolVariable isDead;

    void Start()
    {
        desiredSufaceDist.SetValue(-6);
        rotationSpeed.SetValue(0);

        for (int i = 0; i < legs.Length; i++)
        {
            averageRotationRadius += legs[i].restingPos.z;
        }
        averageRotationRadius /= legs.Length;
    }

    void Update()
    {
        if (useAlignment)
        {
            CalculateOrientation();
        }

        if (dynamicGait)
        {
            if (grounded)
            {
                timeBetweenSteps = maxTargetDistance / Mathf.Max(worldVel.magnitude, Mathf.Abs(2 * Mathf.PI * rotationSpeed.Value * Mathf.Deg2Rad * averageRotationRadius));
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
        Vector3 rotationalPoint = ((Quaternion.AngleAxis((rotationSpeed.Value * timeBetweenSteps) / 2f, transform.up) * legDirection) + transform.position) - legPoint;
        return rotationalPoint + (worldVel * timeBetweenSteps) / 2f;
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
        }

        up /= legs.Length;
        avgSurfaceDist /= legs.Length;
        dist = avgSurfaceDist;

        if (grounded && !isDead.Value)
        {
            transform.Translate(0, -(-avgSurfaceDist + desiredSufaceDist.Value) * 0.5f, 0, Space.Self);
            float positionX = Mathf.Clamp(transform.position.x, -0.51f, -0.51f);
            float positionZ = Mathf.Clamp(transform.position.z, 0, 0);
            transform.position = new Vector3(positionX, transform.position.y, positionZ);
        }
        if (isDead.Value)
        {
            foreach (LegPlacement lp in legs)
            {
                lp.enabled = false;
            }
        }

        //else if (!grounded)
        //{
        //    //Simple Gravity
        //    transform.Translate(0, -20 * Time.deltaTime, 0, Space.World);
        //}
    }
}
