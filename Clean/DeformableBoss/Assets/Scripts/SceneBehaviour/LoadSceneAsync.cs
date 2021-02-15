using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class LoadSceneAsync : MonoBehaviour
{
    public int nextSceneIndex;
    public float fadeDelay = 0.5f;
    public GameObject nextSceneButton;
    public GameObject loadingGO;

    AsyncOperation loadLevel;
    Button continueButton;

    void Start()
    {
        if (SceneManager.GetActiveScene().buildIndex == 0 || SceneManager.GetActiveScene().buildIndex == 3)
        {
            Time.timeScale = 1;
            Cursor.lockState = CursorLockMode.None;
        }

        loadingGO.SetActive(true);
        nextSceneButton.SetActive(false);
        continueButton = nextSceneButton.GetComponent<Button>();
    }


    public void LoadAsync()
    {
        StartCoroutine(LoadAsyncRoutine());
    }

    IEnumerator LoadAsyncRoutine()
    {
        yield return null;

        loadLevel = SceneManager.LoadSceneAsync(nextSceneIndex);

        loadLevel.allowSceneActivation = false;

        while (!loadLevel.isDone)
        {
            if (loadLevel.progress >= 0.9f)
            {
                loadingGO.SetActive(false);
                nextSceneButton.SetActive(true);
                continueButton.onClick.AddListener(AllowChangeScene);
            }

            yield return null;
        }
    }

    public void AllowChangeScene()
    {
        StartCoroutine(FadeDelay());
    }

    IEnumerator FadeDelay()
    {
        yield return new WaitForSeconds(fadeDelay);
        loadLevel.allowSceneActivation = true;
    }
}
