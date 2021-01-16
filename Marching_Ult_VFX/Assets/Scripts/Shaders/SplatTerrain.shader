// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/SplatTerrain"
{
	/*
	This shader renders the given vertices as circles with the given color.
	The point size is the radius of the circle given in WORLD COORDINATES
	Implemented using geometry shader
	*/
	Properties{
		_PointSize("Point Size", Float) = 1
		[Toggle] _Circles("Circles", Int) = 0
		_Color("_Color", Color) = (0,0,0,1)
		_MainTex("Albedo (RGB)", 2D) = "white" {}
	}

		SubShader
	{
		Tags { "RenderType" = "Opaque"}

		LOD 200

		Pass
		{
			Cull off

			// indicate that our pass is the "base" pass in forward
			// rendering pipeline. It gets ambient and main directional
			// light data set up; light direction in _WorldSpaceLightPos0
			// and color in _LightColor0
			Tags { "LightMode" = "ForwardBase" }

			CGPROGRAM

//#define RECEIVE_SHADOWS 1	

			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag

		#pragma multi_compile _ SHADOWS_SCREEN
			#pragma multi_compile _ VERTEXLIGHT_ON

			// compile shader into multiple variants, with and without shadows
			// (we don't care about any lightmaps yet, so skip these variants)
			//#pragma multi_compile_fwdbase nolightmap nodirlightmap nodynlightmap novertexlight
		#pragma multi_compile_fwdbase
			// shadow helper functions and macros
			#include "AutoLight.cginc"
			
			#include "SplatCommon.cginc"

			ENDCG
		}

		// shadow caster rendering pass, implemented manually
        // using macros from UnityCG.cginc
        Pass
        {
            Tags {"LightMode"="ShadowCaster"}

            CGPROGRAM

            #pragma multi_compile_shadowcaster
		
			#pragma vertex vert
			#pragma geometry geom
			#pragma fragment frag

			#include "SplatCommon.cginc"

			ENDCG
        }

	}
		//FallBack "Diffuse"
}
