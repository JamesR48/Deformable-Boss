using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{    
    public int nextSceneIndex;
    public float delayTime = 0.3f;

    void Start()
    {
        if (SceneManager.GetActiveScene().buildIndex != 1)
        {
            Time.timeScale = 1;
            Cursor.lockState = CursorLockMode.None;
        }    
    }

    public void LoadScene()
    {
        StartCoroutine(Delay());
    }

    IEnumerator Delay()
    {
        yield return new WaitForSecondsRealtime(delayTime);

        SceneManager.LoadScene(nextSceneIndex);
    }
}
