using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class RestartGame : MonoBehaviour
{
    Scene actualScene;

    // Start is called before the first frame update
    void Start()
    {
        actualScene = SceneManager.GetActiveScene();
    }

    public void RestartScene()
    {
        SceneManager.LoadScene(actualScene.buildIndex);
    }
}
