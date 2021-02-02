using UnityEngine;

[CreateAssetMenu(fileName = "NewVectorVar", menuName = "CustomSO/Types/VectorVariable")]
public class VectorVariable : ScriptableObject
{
    public Vector3 Value;

    public void SetValue(Vector3 value)
    {
        Value = value;
    }

    public void SetValue(VectorVariable value)
    {
        Value = value.Value;
    }
}
