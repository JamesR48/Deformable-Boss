using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class GameEventListener : MonoBehaviour
{
    [Tooltip("Event to register with.")]
    public GameEvent Event;

    [Tooltip("Response to invoke when Event is raised.")]
    public UnityEvent Response;

    //[Tooltip("Response to invoke when Event is raised (with Transform parameter).")]
    //public TransformEvent ResponseTransform;

    private void OnEnable()
    {
        Event.RegisterListener(this);
    }

    private void OnDisable()
    {
        Event.UnregisterListener(this);
    }

    public void OnEventRaised()
    {
        Response.Invoke();
    }

    //public void OnEventRaised(Transform trans)
    //{
    //    ResponseTransform.Invoke(trans);
    //}

}
