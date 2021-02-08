using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class OffscreenIndicator : MonoBehaviour
{
    public GameObject indicatorGO;
    public Vector3 indicatorOffset;

    float minX;
    float maxX;
    float minY;
    float maxY;
    Vector2 screenPosition;
    float dotProduct;
    GameObject indicatorParent;
    string indicatorTag = "IndicatorParent";
    Image indicatorImage;
    GameObject indicatorInstance;

    void Awake()
    {
        indicatorParent = GameObject.FindGameObjectWithTag(indicatorTag);
        indicatorInstance = Instantiate(indicatorGO, indicatorParent.transform);
        indicatorImage = indicatorInstance.GetComponent<Image>();
        indicatorInstance.SetActive(false);
    }

    void OnEnable()
    {
        indicatorInstance.SetActive(true);
    }

    void OnDisable()
    {
        if(indicatorInstance != null)
        {
            indicatorInstance.SetActive(false);
        }
    }

    // Update is called once per frame
    void Update()
    {
        PlaceIndicator(this.gameObject.transform, indicatorImage);
    }

    void PlaceIndicator(Transform target, Image indicatorImg)
    {

        minX = indicatorImg.GetPixelAdjustedRect().width / 2;
        maxX = Screen.width - minX;
        minY = indicatorImg.GetPixelAdjustedRect().height / 2;
        maxY = Screen.height - minY;

        //convert 3D point to 2D point which is the equivalent point on the screen
        screenPosition = Camera.main.WorldToScreenPoint(target.position + indicatorOffset);

        dotProduct = Vector3.Dot((target.position - Camera.main.transform.position), Camera.main.transform.forward);

        if (dotProduct < 0)
        {
            //target is behind camera
            if (screenPosition.x < Screen.width / 2)
            {
                screenPosition.x = maxX;
            }
            else
            {
                screenPosition.x = minX;
            }
        }

        screenPosition.x = Mathf.Clamp(screenPosition.x, minX, maxX);
        screenPosition.y = Mathf.Clamp(screenPosition.y, minY, maxY);

        indicatorImg.transform.position = screenPosition;
    }
}
