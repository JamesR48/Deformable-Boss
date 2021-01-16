// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Procedural Geometry"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		//_MainTex("Albedo (RGB)", 2D) = "white" {}
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
	}

	SubShader
	{
//			tags { "rendertype" = "opaque" }
//
//		cgprogram
//
//		#pragma surface surf standard fullforwardshadows vertex:vert
//		#pragma target 4.0
//
//			struct vertex
//			{
//				float3 vposition;
//				float3 vnormal;
//			};
//
//			struct triangle
//			{
//				vertex v[3];
//			};
//
//			struct input
//			{
//				float4 vertex : position;
//				float3 normal : normal;
//				uint   id : sv_vertexid;
//				float2 texcoord : texcoord0;
//				float2 texcoord1 : texcoord1;
//				float2 texcoord2 : texcoord2;
//			};
//
//		half4 _color;
//		half _glossiness;
//		half _metallic;
//
//#ifdef shader_api_d3d11
//		uniform structuredbuffer<triangle> triangles;
//		uniform float4x4 model;
//#endif
//
//		void getvertexdata(inout uint id, inout float4 position, inout half3 normal, inout float2 uv0, inout float2 uv1, inout float2 uv2)
//		//void getvertexdata(in uint id, inout float4 position, inout half3 normal)
//		{
//			uint pid = id / 3;
//			uint vid = id % 3;
//
//#ifdef shader_api_d3d11
//			triangle tri = triangles[pid];
//			position = float4(tri.v[vid].vposition, 1);
//			normal = tri.v[vid].vnormal;
//
//			position = mul(model, float4(position.xyz, 1));
//			normal = normalize(mul((float3x3)model, normal));
//#endif
//		}
//
//		//void vert(inout appdata_full v)
//		//void vert(inout v2f o)
//		//void vert(inout appdata_full v, out input o)
//		void vert(inout input o)
//		{
//			//v2f o;
//			unity_initialize_output(input, o);
//			getvertexdata(o.id, o.vertex, o.normal, o.texcoord, o.texcoord1, o.texcoord2);
//			//getvertexdata(o.id, o.vertex, o.normal);
//
//		}
//
//		void surf(input in, inout surfaceoutputstandard o)
//		{
//			o.albedo = _color.rgb + in.vertex;
//			o.metallic = _metallic;
//			o.smoothness = _glossiness;
//			o.alpha = _color.a;
//		}
//		ENDCG
	



	Pass
		{
			CGPROGRAM
			#pragma target 5.0
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct Vertex
			{
				float3 vPosition;
				float3 vNormal;
			};

			struct Triangle
			{
				Vertex v[3];
			};

			uniform StructuredBuffer<Triangle> triangles;
			uniform float4x4 model;

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float3 normal : NORMAL;
			};

			v2f vert(uint id : SV_VertexID)
			{
				uint pid = id / 3;
				uint vid = id % 3;

				v2f o;
				o.vertex = mul(UNITY_MATRIX_VP, mul(model, float4(triangles[pid].v[vid].vPosition, 1)));
				o.normal = mul(unity_ObjectToWorld, triangles[pid].v[vid].vNormal);
				return o;
			}


			float4 frag(v2f i) : SV_Target
			{
				float d = max(dot(normalize(_WorldSpaceLightPos0.xyz), i.normal), 0);
				return float4(d,d,d, 1);
				//return float4(1,0,0, 1);
			}
			ENDCG
		}
	}
}
