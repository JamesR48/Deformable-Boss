using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "NewObjectPool", menuName = "CustomSO/ObjectPooling/ObjectPool")]
public class GameObjectPool : ScriptableObject
{
    public GameObject prefab;
    public int amount; //amount of objects to spawn

    Queue<GameObject> spawnedObjects; //contains all gameobjs we get spawned
    Transform parent; //for making a parent hierarchy on the inspector when spawning multiple objects (just for visual organization)

    //method for spawning the prefabs
    public void SpawnPool()
    {
        //if the queue hasn't been created yet or was created but is empty, then create a new one
        if(spawnedObjects == null || spawnedObjects.Count == 0)
        {
            spawnedObjects = new Queue<GameObject>();
        }

        //if we already have as many of this objects spawned, don't spawn anymore
        if(spawnedObjects.Count >= amount)
        {
            return;
        }

        //if there's no parent, create a new one with the name of this scriptableobject
        if (!parent)
        {
            parent = new GameObject(name).transform;
        }

        while (spawnedObjects.Count < amount)
        {
            GameObject obj = Instantiate(prefab, parent);
            obj.SetActive(false);
            spawnedObjects.Enqueue(obj);
        }
    }

    public GameObject GetPooledObject(Vector3 newPosition, Quaternion newRotation)
    {
        if (spawnedObjects == null || spawnedObjects.Count == 0)
        {
            SpawnPool();
            Debug.LogWarning($"{name} spawned mid game. Consider spawning it at the start!");
        }

        //get a reference to the first object (at the beginning of the queue) by removing it from the queue
        GameObject obj = spawnedObjects.Dequeue();
        //so we take the object from the front, and then stick it to the back
        spawnedObjects.Enqueue(obj);

        obj.SetActive(false);
        obj.transform.position = newPosition;
        obj.transform.rotation = newRotation;
        obj.SetActive(true);

        return obj;
    }

    public void ResetPool()
    {
        if (spawnedObjects != null && spawnedObjects.Count >= amount)
        {
            spawnedObjects.Clear();
        }
    }
}
