﻿using UnityEngine;

[CreateAssetMenu(fileName = "NewBoolVar", menuName = "CustomSO/Types/BoolVariable")]
public class BoolVariable : ScriptableObject
{
    public bool Value;

    public void SetValue(bool value)
    {
        Value = value;
    }

    public void SetValue(BoolVariable value)
    {
        Value = value.Value;
    }
}
