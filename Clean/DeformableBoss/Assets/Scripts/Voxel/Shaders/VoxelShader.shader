﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/VoxelShader"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_ColorInner("ColorInner", Color) = (1,1,1,1)
		_MainTex("Texture", 2D) = "white" {}
		_InnerTex("InnerTexture", 2D) = "white" {}
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
		Distance("Distance", Range(-1,1)) = 0.0
	}

	SubShader
	{
		Tags { "RenderType" = "Opaque" }
		
		LOD 200

		CGPROGRAM

		#pragma surface surf Standard vertex:vert fullforwardshadows addshadow
		
#if SHADER_TARGET < 50
			#pragma target 4.5
#else
			#pragma target 5.0
#endif

		#include "UnityCG.cginc"

		struct Vertex
		{
			float4 position;
			float3 normal;
			float dummy;
		};

		half _Glossiness;
		half _Metallic;
		half Distance;
		sampler2D _MainTex;
		sampler2D _InnerTex;
		fixed4 _Color;
		fixed4 _ColorInner;
		float3 skelePos;
		float3 bullet;
		float3 skeleScale;
		float3 skeleTail;
		float3 skeleSkull;
		float3 skeleChest;
		float3 skeleMouth;

#if defined(SHADER_API_GLES) || defined(SHADER_API_D3D11) || defined(SHADER_API_GLES3) || defined(SHADER_API_VULKAN) || defined(SHADER_API_GLCORE)
		StructuredBuffer<Vertex> _Buffer;
		float4x4 objMat;
#endif
		
		void GetVertexData(in uint id, inout float4 position, inout float3 normal)
		{
#if defined(SHADER_API_GLES) || defined(SHADER_API_D3D11) || defined(SHADER_API_GLES3) || defined(SHADER_API_VULKAN) || defined(SHADER_API_GLCORE)
			Vertex vert = _Buffer[id];
			//position = float4(vert.position.xyz, 1.0);
			position = vert.position;
			normal = vert.normal;

			position = mul(objMat, float4(position.xyz, 1));
			//position = mul(objMat, position);
			normal = normalize(mul((float3x3)objMat, normal));
#endif
		}

		float regularUnion(float d1, float d2) {
			return(min(d1, d2));
		}

		struct appdata
		{
			float4 vertex : POSITION;
			float3 normal : NORMAL;
			float4 tangent : TANGENT;
			float4 color : COLOR;
			float4 texcoord : TEXCOORD0;
			float4 texcoord1 : TEXCOORD1;
			float4 texcoord2 : TEXCOORD2;
			float4 texcoord3 : TEXCOORD3;
			uint vid : SV_VertexID;
		};

		struct Input
		{
			float3 worldPos;
			float2 uv_MainTex;
			float3 worldNormal;
			float4 vertColor;
		};

		void vert(inout appdata v, out Input o) //: SV_POSITION
		{
			GetVertexData(v.vid, v.vertex, v.normal);
			UNITY_INITIALIZE_OUTPUT(Input, o);
			//return UnityObjectToClipPos(v.vertex);
		}

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			float skullDist= distance(skeleSkull, IN.worldPos.xyz) - 1.2;
			float tailDist = distance(skeleTail, IN.worldPos.xyz) - 3.5;
			float chestDist= distance(skeleChest, IN.worldPos.xyz) - 2.6;
			float mouthDist = distance(skeleMouth, IN.worldPos.xyz) - 0.1;
			
			//float skullDist = distance(skeleSkull, IN.worldPos.xyz);
			//float tailDist = distance(skeleTail, IN.worldPos.xyz);
			//float chestDist = distance(skeleChest, IN.worldPos.xyz);
			//float mouthDist = distance(skeleMouth, IN.worldPos.xyz);

			//if (skullDist < 2 || tailDist < 4 || chestDist < 3.2 || mouthDist < 0.7)
			//{
			//	skullDist = distance(skeleSkull, IN.worldPos.xyz) - 1.2;
			//	tailDist = distance(skeleTail, IN.worldPos.xyz) - 3.5;
			//	chestDist = distance(skeleChest, IN.worldPos.xyz) - 2.6;
			//	mouthDist = distance(skeleMouth, IN.worldPos.xyz) - 0.3;
			//	float densUnion = regularUnion(regularUnion(skullDist, mouthDist), regularUnion(tailDist, chestDist));
			//	fixed4 value = lerp(_ColorInner, _Color, densUnion);
			//	o.Albedo = value.rgb; // lerp colors
			//	o.Emission = value.rgb;
			//	/*o.Albedo = _ColorInner.rgb;
			//	o.Emission = _ColorInner.rgb;*/
			//}
			//else
			//{
			//	o.Albedo = _Color.rgb;
			//	o.Emission = _Color.rgb;
			//}

			float densUnion = regularUnion(regularUnion(skullDist, mouthDist), regularUnion(tailDist, chestDist) );

			//float3 value = lerp(tex2D(_InnerTex, IN.worldPos.xy).rgb, tex2D(_MainTex, IN.worldPos.xy).rgb, densUnion); //lerp textures
			fixed4 value = lerp(_ColorInner, _Color, densUnion); //lerp colors

			//o.Albedo = value; // lerp textures
			
			o.Albedo = value.rgb; // lerp colors
			o.Emission = value.rgb;

			/*if (distance(bullet.xyz, IN.worldPos.xyz) < 2.1)
			{
				o.Albedo += float3(0, 0, 1);
				o.Emission = float3(0.5, 1, 1);
			}*/

			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
		}
		ENDCG
	}
		FallBack "Diffuse"
}
