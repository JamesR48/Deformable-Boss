using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeScene : MonoBehaviour
{
    public int nextSceneIndex;

    void Start()
    {
        if (SceneManager.GetActiveScene().buildIndex != 0)
        {
            Time.timeScale = 1;
            Cursor.lockState = CursorLockMode.None;
        }    
    }

    public void LoadScene()
    {
        SceneManager.LoadScene(nextSceneIndex);
    }
}
