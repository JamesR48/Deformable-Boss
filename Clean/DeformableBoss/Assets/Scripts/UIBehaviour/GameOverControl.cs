using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameOverControl : MonoBehaviour
{
    public GameObject playerDeathMenu;

    public void ShowCursor()
    {
        Cursor.lockState = CursorLockMode.None;
    }

    public void ActivePlayerDeathMenu()
    {
        playerDeathMenu.SetActive(true);
    }

    public void InitGameOver()
    {
        StartCoroutine(GameOverDelay());
    }

    IEnumerator GameOverDelay()
    {
        yield return new WaitForSeconds(2);
        ActivePlayerDeathMenu();
        ShowCursor();
    }
}
