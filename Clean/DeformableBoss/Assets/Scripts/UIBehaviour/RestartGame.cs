using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class RestartGame : MonoBehaviour
{
    public float delayTime = 0.3f;
    Scene actualScene;

    // Start is called before the first frame update
    void Start()
    {
        actualScene = SceneManager.GetActiveScene();
    }

    public void RestartScene()
    {
        StartCoroutine(Delay());
    }

    IEnumerator Delay()
    {
        yield return new WaitForSecondsRealtime(delayTime);

        SceneManager.LoadScene(actualScene.buildIndex);
    }
}
