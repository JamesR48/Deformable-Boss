using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActiveEmission : MonoBehaviour
{
    public GameObject emissiveObject;
    public Color standardColor;
    public Color alternativeColor;

    Color matColor;
    Material emissiveMaterial;

    // Start is called before the first frame update
    void Start()
    {
        emissiveMaterial = emissiveObject.GetComponent<Renderer>().material;
        matColor = standardColor;
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void EnableEmission()
    {
        SetEmissionColor(1);
    }

    public void DisableEmission()
    {
        SetEmissionColor(0);
    }

    public void AlternativeEmission()
    {
        matColor = alternativeColor;
        SetEmissionColor(1);
    }

    public void SetBackEmission()
    {
        matColor = standardColor;
        SetEmissionColor(1);
    }

    void SetEmissionColor(float value)
    {
        emissiveMaterial.SetColor("_EmissionColor", new Vector4(matColor.r, matColor.g, matColor.b, 0) * value);
    }
}
