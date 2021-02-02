using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class GroundMovement : MonoBehaviour
{
    public FloatReference moveSpeed;

    public FloatVariable horizontalInput, verticalInput;

    float gravity = 9.8f;
    float verticalSpeed = 0;
    CharacterController charControl;
    Vector3 movement;

    private void Awake()
    {
        charControl = GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void Update()
    {
        Move();
    }

    public void Move()
    {
        //horizontalInput = Input.GetAxis("Horizontal");
        //verticalInput = Input.GetAxis("Vertical");

        horizontalInput.SetValue(Input.GetAxis("Horizontal"));
        verticalInput.SetValue(Input.GetAxis("Vertical"));

        if (charControl.isGrounded)
        {
            verticalSpeed = 0;
        }
        else
        {
            verticalSpeed -= gravity * Time.deltaTime;
        }

        movement = new Vector3(horizontalInput.Value, verticalSpeed, verticalInput.Value);

        movement = transform.TransformDirection(movement);
        movement = Vector3.ClampMagnitude(movement, 1f);
        charControl.Move(movement * Time.deltaTime * moveSpeed);
    }
}
