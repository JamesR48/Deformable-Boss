Shader "Custom/sha"
{
	Properties
	{
		_MainTex("Albedo (RGB)", 2D) = "white" {}
		_Cutoff("Cutoff", Range(0,1)) = 0.5
		_ColorTint("Tint", Color) = (1.0, 0.6, 0.6, 1.0)
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
	}
		SubShader
		{
			// 1. use alpha transparency in blend
			Blend One OneMinusSrcAlpha

			Tags { "RenderType" = "Opaque" }
			//Tags { "RenderType" = "TransparentCutout" }
			//Tags{"Queue" = "Transparent" "RenderType" = "Transparent"}
			LOD 200

			CGPROGRAM
			// Physically based Standard lighting model, and enable shadows on all light types
			#pragma surface surf Standard keepalpha addshadow alphatest:_Cutoff vertex:vert

			// Use shader model 3.0 target, to get nicer looking lighting
			#pragma target 3.0

			sampler2D _MainTex;

			int _Circles = 0;

			struct Input
			{
				half2 uv_MainTex;
				half3 worldPos;
				half3 worldNormal;
				fixed4 color;
			};

			half boundsY;
			half normalOffsetWeight;

			half _Glossiness;
			half _Metallic;
			//sampler2D ramp;
			fixed4 _ColorTint;
			void vert(inout appdata_full v, out Input o)
			{
				//v.normal = half3(0, 0, -1);
				UNITY_INITIALIZE_OUTPUT(Input, o);
				o.uv_MainTex = v.texcoord.xy;
				o.color = _ColorTint;
				o.worldNormal = v.normal;
			}

			void surf(Input IN, inout SurfaceOutputStandard o)
			{
				/*if (_Circles >= 0.5 && IN.uv_MainTex.x*IN.uv_MainTex.x + IN.uv_MainTex.y*IN.uv_MainTex.y > 1) {
					discard;
				}*/

				// Albedo comes from a texture tinted by color
				//half h = smoothstep(-boundsY / 2, boundsY / 2, IN.worldPos.y + IN.worldNormal.y * normalOffsetWeight);
				//half3 tex = tex2D(ramp, half2(h,.5));
				
				//clip(IN.uv_MainTex.x*IN.uv_MainTex.x + IN.uv_MainTex.y*IN.uv_MainTex.y > 1);

				fixed4 tex = tex2D(_MainTex, IN.uv_MainTex) * _ColorTint;
				//o.Albedo = tex.rgb * tex.a;
				o.Albedo = tex.rgb;
				//o.Albedo = half3 (IN.uv_MainTex, 0);
				o.Alpha = tex.a;

			}
			ENDCG
		}
			FallBack "Diffuse"
}
