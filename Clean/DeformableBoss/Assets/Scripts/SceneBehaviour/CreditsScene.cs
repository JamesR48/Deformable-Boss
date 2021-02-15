using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CreditsScene : MonoBehaviour
{
    public Animator playerAnimator;
    public GameObject pillars;

    Scene creditScene;

    // Start is called before the first frame update
    void Start()
    {
        Cursor.lockState = CursorLockMode.None;

        creditScene = SceneManager.GetActiveScene();

        if (creditScene.buildIndex == 3)
        {
            playerAnimator.SetLayerWeight(1, 0);
            playerAnimator.Play("Dance");
        }

        if (!pillars.activeSelf)
        {
            pillars.SetActive(true);
        }
    }
}
