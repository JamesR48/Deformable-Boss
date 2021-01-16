using UnityEngine;
using System;
using System.Collections;

//Original version of the ConditionalHideAttribute created by Brecht Lecluyse (www.brechtos.com)
//Modified by: Sebastian Lague

[AttributeUsage(AttributeTargets.Field | AttributeTargets.Property |
    AttributeTargets.Class | AttributeTargets.Struct, Inherited = true)]
public class ConditionalHideAttribute : PropertyAttribute
{
    //public string conditionalSourceField;
    //public bool showIfTrue;
    //public int enumIndex;

    //public ConditionalHideAttribute(string boolVariableName, bool showIfTrue)
    //{
    //    conditionalSourceField = boolVariableName;
    //    this.showIfTrue = showIfTrue;
    //}

    //public ConditionalHideAttribute(string enumVariableName, int enumIndex)
    //{
    //    conditionalSourceField = enumVariableName;
    //    this.enumIndex = enumIndex;
    //}

    //The name of the bool field that will be in control
    public string ConditionalSourceField = "";

    public int EnumValue1 = 0;
    public int EnumValue2 = 0;

    public bool HideInInspector = false;
    public bool Inverse = false;

    public ConditionalHideAttribute(string conditionalSourceField, int enumValue1)
    {
        this.ConditionalSourceField = conditionalSourceField;
        this.EnumValue1 = enumValue1;
        this.EnumValue2 = enumValue1;
    }

    public ConditionalHideAttribute(string conditionalSourceField, int enumValue1, int enumValue2)
    {
        this.ConditionalSourceField = conditionalSourceField;
        this.EnumValue1 = enumValue1;
        this.EnumValue2 = enumValue2;
    }

}



