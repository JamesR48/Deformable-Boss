using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnPool : MonoBehaviour
{
    public GameObjectPool objectPool;

    void Awake()
    {
        objectPool.ResetPool();
        objectPool.SpawnPool();   
    }

}
