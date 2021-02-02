using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class KnockBack : MonoBehaviour
{
    public GameEvent OnKnockBackEnd;
    public FloatReference moveSpeed;
    public VectorVariable knockDirection;
    public FloatVariable horizontalInput, verticalInput;

    public float knockBackForce = 10;
    public float knockBackTime = 1;

    float knockBackCounter;
    Vector3 movement;
    CharacterController charControl;

    float horizontalOriginal, verticalOriginal;

    private void Awake()
    {
        charControl = GetComponent<CharacterController>();
        knockDirection.SetValue(Vector3.zero);
    }

    // Update is called once per frame
    void Update()
    {
        if (knockBackCounter > 0)
        {
            knockBackCounter -= Time.deltaTime;
            if (knockBackCounter <= 0)
            {
                OnKnockBackEnd.Raise();
                horizontalInput.SetValue(horizontalOriginal);
                verticalInput.SetValue(verticalOriginal);
            }
        }
    }

    public void KnockedBack()
    {
        knockBackCounter = knockBackTime;

        knockDirection.SetValue(knockDirection.Value * -1);

        movement = knockDirection.Value * knockBackForce;
        charControl.Move(movement * Time.deltaTime * moveSpeed);

        horizontalOriginal = horizontalInput.Value;
        verticalOriginal = verticalInput.Value;
    }
}

/*
    USAR UN EVENTO PARA SABER CUANDO EL PERSONAJE COLISIONA CON EL CHARCO O PROYECTILES.
    ONRAISE() ACTIVA EL KNOCKBACK Y EL INVULNERABILITY, DESACTIVA EL GROUNDMOVEMENT Y EL EL AIM, JUNTO A ESO
    RESTA VIDA. CUANDO SE ACABE EL TIEMPO DEL KNOCKBACK SE VUELVE A ACTIVAR LO OTRO CON OTRO EVENTO.
*/
