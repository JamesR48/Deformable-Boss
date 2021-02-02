using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Animator))]
public class PlayerAnimationManager : MonoBehaviour
{
    public FloatVariable horizontalInput, verticalInput;
    public BoolVariable isAiming;
    public BoolVariable isFiring;

    Animator playerAnimator;
    float rotationAngle;
    bool playerIsDeath = false;

    // Start is called before the first frame update
    void Start()
    {
        playerAnimator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if (!playerIsDeath)
        {
            RunningAnim();
            AimingAnim();
            if (isAiming)
            {
                FiringAnim();
            }
        }
    }

    public void RunningAnim()
    {
        playerAnimator.SetFloat("SpeedX", horizontalInput.Value);
        playerAnimator.SetFloat("SpeedY", verticalInput.Value);
    }

    public void AimingAnim()
    {
        playerAnimator.SetBool("IsAiming", isAiming.Value);
        if (isAiming.Value)
        {
            playerAnimator.SetFloat("Aim", GetAimRotationAngle());
        }
    }

    public void FiringAnim()
    {
        playerAnimator.SetBool("IsFiring", isFiring.Value);
    }

    public void DamageAnim()
    {
        playerAnimator.SetTrigger("GetDamage");
    }

    public void DeathAnim()
    {
        playerIsDeath = true;
        playerAnimator.Play("Death");
    }

    public float GetAimRotationAngle()
    {
        rotationAngle = Camera.main.transform.rotation.eulerAngles.x;
        rotationAngle %= 360;
        rotationAngle = rotationAngle > 90 ? rotationAngle - 360 : rotationAngle;
        return rotationAngle;
    }
}
