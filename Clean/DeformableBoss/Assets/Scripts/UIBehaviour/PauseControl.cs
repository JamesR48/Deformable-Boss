using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseControl : MonoBehaviour
{
    public GameEvent OnPause;
    public GameEvent OnResume;

    bool gameIsPaused = false;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if (!gameIsPaused)
            {
                PauseGame();
                gameIsPaused = true;
            }
            else
            {
                ResumeGame();
                gameIsPaused = false;
            }
        }
    }

    public void PauseGame()
    {
        Time.timeScale = 0;
        Cursor.lockState = CursorLockMode.None; 
        OnPause.Raise();
    }

    public void ResumeGame()
    {
        OnResume.Raise();
        Time.timeScale = 1;
        Cursor.lockState = CursorLockMode.Locked;
    }
}
