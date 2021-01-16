using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    private CharacterController characterController;

    [HideInInspector]
    public Animator animator;

    [SerializeField]
    private float moveSpeed = 100;
    [SerializeField]
    private float turnSpeed = 1f; //3f //100f

    public Transform target;

    public GameObject reticle;
    public GameObject movementCamera;
    public GameObject aimCamera;

    [HideInInspector]
    public bool isAiming = false;
    public bool isFiring = false;
    public int playerHealth = 3;
    public bool playerIsDead = false;

    float mouseX, mouseY;
    float horizontal, vertical;

    public Cinemachine.AxisState xAxis; //camera pitch
    public Cinemachine.AxisState yAxis; //camera yaw

    private void Awake()
    {
        characterController = GetComponent<CharacterController>();
        animator = GetComponentInChildren<Animator>();

        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update()
    {
        if (!playerIsDead)
        {
            MouseRotation();

            if (Input.GetMouseButton(1)) //right click held down
            {
                PlayerAim();
                PlayerMove();
            }
            else
            {
                PlayerStopAim();
                PlayerMove();
            }

            if (playerHealth == 0)
            {
                playerIsDead = true;
            }
        }
        else
        {
            animator.Play("Death");
        }
    }

    void PlayerMove()
    {
        horizontal = Input.GetAxis("Horizontal");
        vertical = Input.GetAxis("Vertical");

        Vector3 movement = new Vector3(horizontal, 0, vertical);

        movement = transform.TransformDirection(movement);

        //animator.SetFloat("Speed", movement.magnitude);

        animator.SetFloat("SpeedX", horizontal);
        animator.SetFloat("SpeedY", vertical);

        //characterController.SimpleMove(movement * Time.deltaTime * moveSpeed);
        movement = Vector3.ClampMagnitude(movement, 1f);
        characterController.Move(movement * Time.deltaTime * moveSpeed);

        target.eulerAngles = new Vector3(yAxis.Value, xAxis.Value, 0);
        float yawCamera = Camera.main.transform.rotation.eulerAngles.y;
        transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.Euler(0, yawCamera, 0), turnSpeed * Time.deltaTime);

        //animator.SetFloat("Speed", vertical);

        ////target.rotation = Quaternion.Euler(mouseY, mouseX, 0);
        //target.rotation = Quaternion.Lerp(target.rotation, Quaternion.Euler(mouseY, mouseX, 0), 0.5f);

        //transform.Rotate(Vector3.up, horizontal * turnSpeed * Time.deltaTime);

        //if (vertical != 0)
        //{
        //    characterController.SimpleMove(transform.forward * Time.deltaTime * moveSpeed * vertical);
        //}
        //else if(vertical == 0)
        //{            
        //    transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.Euler(0, mouseX, 0), 0.5f);
        //}



        //if (movement.magnitude > 0)
        //{
        //Quaternion newDirection = Quaternion.LookRotation(movement);

        //transform.rotation = Quaternion.Slerp(transform.rotation, newDirection, Time.deltaTime * turnSpeed);
        //}
    }

    void MouseRotation()
    {
        //mouseX += Input.GetAxis("Mouse X") * turnSpeed;
        //mouseY -= Input.GetAxis("Mouse Y") * turnSpeed;
        //mouseY = Mathf.Clamp(mouseY, -35, 60);
        //mouseX = Mathf.Clamp(mouseY, -180, 180);
        //target.rotation = Quaternion.Euler(mouseY, mouseX, 0);
        //transform.rotation = Quaternion.Euler(0, mouseX, 0);
        xAxis.Update(Time.deltaTime);
        yAxis.Update(Time.deltaTime);
        //target.eulerAngles = new Vector3(yAxis.Value, xAxis.Value, 0);
        //float yawCamera = Camera.main.transform.rotation.eulerAngles.y;
        //transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.Euler(0, yawCamera, 0), turnSpeed * Time.deltaTime);
        //transform.forward = Vector3.Lerp(transform.forward, Camera.main.transform.forward, turnSpeed * Time.deltaTime);
    }

    void PlayerAim()
    {
        isAiming = true;
        reticle.SetActive(true);
        movementCamera.SetActive(false);
        aimCamera.SetActive(true);
        animator.SetBool("IsAiming", isAiming);
        animator.SetFloat("Aim", yAxis.Value);
    }

    void PlayerStopAim()
    {
        isAiming = false;
        animator.SetBool("IsAiming", isAiming);
        movementCamera.SetActive(true);
        aimCamera.SetActive(false);
        reticle.SetActive(false);
    }
}