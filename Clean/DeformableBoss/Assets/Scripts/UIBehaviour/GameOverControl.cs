using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameOverControl : MonoBehaviour
{
    public void ShowCursor()
    {
        Cursor.lockState = CursorLockMode.None;
    }
}
