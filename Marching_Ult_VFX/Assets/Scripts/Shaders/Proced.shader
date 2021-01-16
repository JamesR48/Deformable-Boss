Shader "Custom/Proced"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_ColorInner("ColorInner", Color) = (1,1,1,1)
		_MainTex("Texture", 2D) = "white" {}
		_InnerTex("InnerTexture", 2D) = "white" {}
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
		Distance("Distance", Range(-20,20)) = 0.0
	}

	SubShader
	{
		Tags { "RenderType" = "Opaque" }
		
		LOD 200

		CGPROGRAM

		//#pragma surface surf Standard vertex:vert fullforwardshadows addshadow
			#pragma surface surf Standard vertex:vert fullforwardshadows addshadow
		#pragma target 5.0
		#include "UnityCG.cginc"

		struct Vertex
		{
			float3 position;
			float3 normal;
			float3 color;
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

#ifdef SHADER_API_D3D11
		StructuredBuffer<Vertex> _Buffer;
		float4x4 objMat;
#endif

		//float boundsY;
		//float normalOffsetWeight;
		//sampler2D ramp;
		
		void GetVertexData(in uint id, inout float4 position, inout float3 normal, inout float4 uv0, inout float4 uv1, inout float4 color)
		{
#ifdef SHADER_API_D3D11
			Vertex vert = _Buffer[id];
			//position.xyz = vert.position.xyz;
			position = float4(vert.position.xyz, 1.0);
			//position = vert.position;
			normal = vert.normal;

			//position = mul(objMat, float4(position.xyz, 1.0));
			position = mul(objMat, position);
			normal = normalize(mul((float3x3)objMat, normal));

			//color.xyz = vert.color;
			//color.w = 1.0;
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
			float2 uv_MainTex;
			float3 worldPos;
			float3 worldNormal;
			float4 vertColor;
		};

		void vert(inout appdata v, out Input o)
		//void vert(inout appdata v)
		{
			GetVertexData(v.vid, v.vertex, v.normal, v.texcoord, v.texcoord1, v.color);
			UNITY_INITIALIZE_OUTPUT(Input, o);
			
			//o.worldPos = v.vertex.xyz;

			//o.vertColor = v.color;
		}

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			// Albedo comes from a texture tinted by color
			//float h = smoothstep(-boundsY / 2, boundsY / 2, IN.worldPos.y + IN.worldNormal.y * normalOffsetWeight);
			//float3 tex = tex2D(ramp, float2(h, .5));
			//fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * (_Color);
			//o.Albedo = tex;
			//o.Albedo = c.rgb + IN.vertColor.rgb;

			//To correctly project the texture regardless of the direction that the geometry's normal is facing
			//Project the texture 3 times from the 3 axis and blend the result
			//weight each direction to know how much to blend
			/*float3 pWeight = abs(IN.worldNormal);
			pWeight /= pWeight.x + pWeight.y + pWeight.z;
			float3 xp;
			float3 yp;
			float3 zp;*/
			//float4 objectOrigin = mul(unity_ObjectToWorld, float4(0.0, 0.0, 0.0, 1.0));
			//float4 objectOrigin = unity_ObjectToWorld[3];

			//if( (distance(skelePos, IN.worldPos.xyz) < 2.85) 
			//	|| (distance(skeleTail, IN.worldPos.xyz) < 3.85)
			//	|| (distance(skeleSkull, IN.worldPos.xyz) < 1.85)
			//	)
			//{
			//	xp = tex2D(_InnerTex, IN.worldPos.yz) * pWeight.x *2;//x projection
			//	yp = tex2D(_InnerTex, IN.worldPos.xz) * pWeight.y *2;//y projection
			//	zp = tex2D(_InnerTex, IN.worldPos.xy) * pWeight.z*2;//z projection
			//}
			//else
			//{
			//	xp = tex2D(_MainTex, IN.worldPos.yz) * pWeight.x;//x projection
			//	yp = tex2D(_MainTex, IN.worldPos.xz) * pWeight.y;//y projection
			//	zp = tex2D(_MainTex, IN.worldPos.xy) * pWeight.z;//z projection
			//}

			

			//float3 xp = tex2D(_MainTex, IN.worldPos.yz) * pWeight.x;//x projection
			//float3 yp = tex2D(_MainTex, IN.worldPos.xz) * pWeight.y;//y projection
			//float3 zp = tex2D(_MainTex, IN.worldPos.xy) * pWeight.z;//z projection

			//o.Albedo = tex2D(_MainTex, IN.worldPos.xy).rgb;
			//o.Albedo = xp + yp + zp;
			//o.Albedo = tex2D(_MainTex, IN.worldPos.xy).rgb * IN.vertColor.rgb;
			
			//Distance handle
			//o.Albedo = lerp(tex2D(_MainTex, IN.worldPos.xy).rgb, tex2D(_InnerTex, IN.worldPos.xy).rgb, Distance); //distance(skeleSkull, IN.worldPos.xyz)
			//Distance from center obj - radius
			//o.Albedo = lerp(tex2D(_InnerTex, IN.worldPos.xy).rgb, tex2D(_MainTex, IN.worldPos.xy).rgb, distance(skeleSkull, IN.worldPos.xyz) - Distance);
			//Inverse Lerp Distance from center obj - radius
			//o.Albedo = lerp(tex2D(_InnerTex, IN.worldPos.xy).rgb, tex2D(_MainTex, IN.worldPos.xy).rgb, smoothstep(float3(0,0,0), skeleScale, distance(skeleSkull, IN.worldPos.xyz)-1.2) );

			float skullDist= distance(skeleSkull, IN.worldPos.xyz) - 1.2;
			float tailDist = distance(skeleTail, IN.worldPos.xyz) - 3.5;
			float chestDist= distance(skeleChest, IN.worldPos.xyz) - 2.6;
			float mouthDist = distance(skeleMouth, IN.worldPos.xyz) - 0.3;

			float densUnion = regularUnion(regularUnion(skullDist, mouthDist), regularUnion(tailDist, chestDist) );

			//float3 value = lerp(tex2D(_InnerTex, IN.worldPos.xy).rgb, tex2D(_MainTex, IN.worldPos.xy).rgb, densUnion); //lerp textures
			fixed4 value = lerp(_ColorInner, _Color, densUnion); //lerp colors

			//o.Albedo = value; // lerp textures
			o.Albedo = value.rgb; // lerp colors

			if (distance(bullet.xyz, IN.worldPos.xyz) < 2.1)
			{
				o.Albedo += float3(0, 0, 1);
				o.Emission = float3(0.5, 1, 1);
			}

			//float3 xp = tex2D(_MainTex, IN.worldPos.yz) * pWeight.x;//x projection
			//float3 yp = tex2D(_MainTex, IN.worldPos.xz) * pWeight.y;//y projection
			//float3 zp = tex2D(_MainTex, IN.worldPos.xy) * pWeight.z;//z projection

			//float3 xp2 = tex2D(_InnerTex, IN.worldPos.yz) * pWeight.x;//x projection
			//float3 yp2 = tex2D(_InnerTex, IN.worldPos.xz) * pWeight.y;//y projection
			//float3 zp2 = tex2D(_InnerTex, IN.worldPos.xy) * pWeight.z;//z projection

			//o.Albedo = lerp(xp + yp + zp, xp2 + yp2 + zp2, distance(skelePos.xyz, IN.worldPos.xyz)/2 );

			//float3 xp = tex2D(_MainTex, IN.worldPos.xyz);
			//float3 xp2 = tex2D(_InnerTex, IN.worldPos.xyz);
			//float f = distance(skelePos.xyz, IN.worldPos.xyz)/5; //Con Raycast funciona????
			//
			//o.Albedo = lerp(xp2, xp, f);

			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			//o.Alpha = c.a;
		}
		ENDCG
	}
		FallBack "Diffuse"
}
