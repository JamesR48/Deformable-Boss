using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LegPlacement : MonoBehaviour
{
    public bool legGrounded = false;
    public Vector3 stepPoint;
    public Vector3 stepNormal;

    public Vector3 optimalRestingPos = Vector3.forward; //aprox. position I want the leg to stand on
    public Vector3 restingPos //getter that has the resting position (from local to world space)
    {
        get
        {
            return transform.TransformPoint(optimalRestingPos);
        }
    }
    public Vector3 worldVel = Vector3.right;
    public Vector3 desiredPos //getter that has the resting position + world velocity
    {
        get
        {
            return restingPos + worldVel;
        }
    }
    public Vector3 worldTarget = Vector3.zero;
    public Transform ikTarget;
    public Transform ikPoleTarget; //also this can be the point to raycast or step prediction and stuff

    //allows to turn off wether or not you want the legs to control themselves steping with leaving the control to a central controller
    public bool autoStep = true;

    public AnimationCurve stepHeightCurve; //controls the step height for each leg
    public float stepHeightMultiplier = 0.25f;
    public float stepCoolDown = 1f;
    public float stepDuration = 0.5f;
    public float stepOffset; //if you control multiple legs and want to step at different times
    public float lastStep = 0f;

    public LayerMask solidLayer;
    public float stepRadius = 0.25f;
    public float percent
    {
        get
        {
            return Mathf.Clamp01((Time.time - lastStep) / stepDuration);
        }
    }

    // Start is called before the first frame update
    void Start()
    {
        worldVel = Vector3.zero;
        lastStep = Time.time + stepCoolDown * stepOffset;
        ikTarget.position = restingPos;
        Step();
    }

    // Update is called once per frame
    void Update()
    {
        UpdateIKTarget();
        if(Time.time > lastStep + stepCoolDown && autoStep)
        {
            Step();
        }
    }

    public void MoveVelocity(Vector3 newVel)
    {
        worldVel = Vector3.Lerp(worldVel, newVel, 1f - percent);
    }

    public void UpdateIKTarget()
    {
        stepPoint = AdjustPos(worldTarget + worldVel);
        ikTarget.position = Vector3.Lerp(ikTarget.position, worldTarget,percent) + Vector3.up * stepHeightCurve.Evaluate(percent) * stepHeightMultiplier;
    }

    public void Step()
    {
        worldTarget = AdjustPos(desiredPos);
        stepPoint = worldTarget;
        lastStep = Time.time;
    }

    public Vector3 AdjustPos(Vector3 pos)
    {
        Vector3 direction = pos - ikPoleTarget.position;
        RaycastHit hit;
        if (Physics.SphereCast(ikPoleTarget.position, stepRadius, direction, out hit, direction.magnitude * 2f, solidLayer))
        {
            Debug.DrawLine(ikPoleTarget.position, hit.point, Color.green, 0f);
            pos = hit.point;
            stepNormal = hit.normal;
            legGrounded = true;
        }
        else
        {
            Debug.DrawLine(ikPoleTarget.position, restingPos, Color.red, 0f);
            pos = restingPos;
            stepNormal = Vector3.zero;
            legGrounded = false;
        }
        return pos;
    }

}
