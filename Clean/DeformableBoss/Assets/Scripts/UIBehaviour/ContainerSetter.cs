using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ContainerSetter : MonoBehaviour
{
    public IntReference containerVariable;
    public IntReference containerQuantity;
    public bool hasDelay = false;
    public float delayTime = 0.1f;

    public Image[] containers;
    public Sprite fullContainer;
    public Sprite emptyContainer;

    bool isCoroutineExecuting = false;

    public void UpdateContainer()
    {
        if (hasDelay)
        {
            StartCoroutine(Delay(delayTime));
        }
        else
        {
            ContainerLogic();
        }
    }

    IEnumerator Delay(float delayTime)
    {
        yield return new WaitForSeconds(delayTime);

        ContainerLogic();
    }

    void ContainerLogic()
    {
        for (int i = 0; i < containers.Length; i++)
        {
            if (i < containerVariable.Value)
            {
                containers[i].sprite = fullContainer;
            }
            else
            {
                containers[i].sprite = emptyContainer;
            }

            if (i < containerQuantity.Value)
            {
                containers[i].enabled = true;
            }
            else
            {
                containers[i].enabled = false;
            }
        }
    }
}
