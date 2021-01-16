			
#include "UnityCG.cginc" // for UnityObjectToWorldNormal
			#include "UnityLightingCommon.cginc" // for _LightColor0
			#include "Lighting.cginc"
			#include "AutoLight.cginc"

			fixed4 _Color;
			sampler2D _MainTex;

			struct VertexInput
			{
				half4 pos : POSITION;
				half4 color : COLOR;
			};

			struct VertexMiddle {
				half4 pos : SV_POSITION;
				half4 color : COLOR;
				half4 R : NORMAL0;
				half4 U : NORMAL1;
#if RECEIVE_SHADOWS
				SHADOW_COORDS(1) // put shadows data into TEXCOORD1
#endif
			};

			struct VertexOutput
			{
				half4 pos : SV_POSITION;
				half4 color : COLOR0;
				half2 uv : TEXCOORD0;
#if RECEIVE_SHADOWS
				SHADOW_COORDS(1) // put shadows data into TEXCOORD1
#endif
			};

			half _PointSize = 1;
			int _Circles = 0;

			sampler2D ramp;
			half boundsY;
			half normalOffsetWeight;

			VertexMiddle vert(VertexInput v) {
				VertexMiddle o;
				o.pos = v.pos;
				o.color = v.color;
				//o.color = _Color;
				half3 view = normalize(UNITY_MATRIX_IT_MV[2].xyz);
				half3 upvec = normalize(UNITY_MATRIX_IT_MV[1].xyz);
				half3 R = normalize(cross(view, upvec));
				o.U = half4(upvec * _PointSize, 0);
				o.R = half4(R * _PointSize, 0);
#if RECEIVE_SHADOWS
				TRANSFER_SHADOW(o)
#endif
				return o;
			}

			half3 triangleCentroid(half3 vert0, half3 vert1, half3 vert2) {
				half cx = (vert0.x + vert1.x + vert2.x)/3;
				half cy = (vert0.y + vert1.y + vert2.y) / 3;
				half cz = (vert0.z + vert1.z + vert2.z) / 3;
				return half3(cx,cy,cz);
			}

			//[maxvertexcount(4)] //making a quad (4 vertices)
			[maxvertexcount(4)]
			void geom(triangle VertexMiddle input[3], inout TriangleStream<VertexOutput> outputStream) {

				half4 pcenter = half4(triangleCentroid(input[0].pos, input[1].pos, input[2].pos),0);
				half4 rcenter = half4(triangleCentroid(input[0].R, input[1].R, input[2].R),0);
				half4 ucenter = half4(triangleCentroid(input[0].U, input[1].U, input[2].U),0);

				half4 worldpos = mul(unity_ObjectToWorld, pcenter);

				half h = smoothstep(-boundsY / 2, boundsY / 2, worldpos.y + (rcenter.y + ucenter.y) * normalOffsetWeight);
				half4 tex = tex2Dlod(ramp, half4(h, .5,1,1));

				//////////////////////////
				half3 normal = normalize(cross(input[0].pos.xyz - input[1].pos.xyz, input[1].pos.xyz - input[2].pos.xyz));
				half3 worldNormal = UnityObjectToWorldNormal(normal);
				half3 lightPosition = _WorldSpaceLightPos0.xyz;
				half lightStrength = max(0, dot(worldNormal, lightPosition));

				VertexOutput out1;
				//out1.pos = input[0].pos;
				out1.pos = pcenter;
				//out1.color = input[0].color;
				out1.color = tex * lightStrength * _LightColor0;
				out1.color.rgb += ShadeSH9(half4(worldNormal, 1));
				out1.uv = half2(-1.0f, 1.0f);
				//out1.pos += (-input[0].R + input[0].U);
				out1.pos += (-rcenter + ucenter);
				out1.pos = UnityObjectToClipPos(out1.pos);
				
				///////

				VertexOutput out2;
				//out2.pos = input[0].pos;
				out2.pos = pcenter;
				//out2.color = input[0].color;
				out2.color = tex * lightStrength * _LightColor0;
				out2.color.rgb += ShadeSH9(half4(worldNormal, 1));
				out2.uv = half2(1.0f, 1.0f);
				//out2.pos += (input[0].R + input[0].U);
				out2.pos += (rcenter + ucenter);
				out2.pos = UnityObjectToClipPos(out2.pos);

				///////

				VertexOutput out3;
				//out3.pos = input[0].pos;
				out3.pos = pcenter;
				//out3.color = input[0].color;
				out3.color = tex * lightStrength * _LightColor0;
				out3.color.rgb += ShadeSH9(half4(worldNormal, 1));
				out3.uv = half2(1.0f, -1.0f);
				//out3.pos += (input[0].R - input[0].U);
				out3.pos += (rcenter - ucenter);
				out3.pos = UnityObjectToClipPos(out3.pos);

				///////

				VertexOutput out4;
				//out4.pos = input[0].pos;
				out4.pos = pcenter;
				//out4.color = input[0].color;
				out4.color = tex * lightStrength * _LightColor0;
				out4.color.rgb += ShadeSH9(half4(worldNormal, 1));
				out4.uv = half2(-1.0f, -1.0f);
				//out4.pos += (-input[0].R - input[0].U);
				out4.pos += (-rcenter - ucenter);
				out4.pos = UnityObjectToClipPos(out4.pos);

#if RECEIVE_SHADOWS
				TRANSFER_SHADOW(out1)
				TRANSFER_SHADOW(out2)
				TRANSFER_SHADOW(out3)
				TRANSFER_SHADOW(out4)
#endif

				///////

				outputStream.Append(out1);
				outputStream.Append(out2);
				outputStream.Append(out4);
				outputStream.Append(out3);
			}

			half3 frag(VertexOutput o) : COLOR{
				if (_Circles >= 0.5 && o.uv.x*o.uv.x + o.uv.y*o.uv.y > 1) {
					discard;
				}
				
#if RECEIVE_SHADOWS

				// compute shadow attenuation (1.0 = fully lit, 0.0 = fully shadowed)
				half shadow = SHADOW_ATTENUATION(o);
				
				return o.color * shadow;
#else
			return o.color;
#endif
			}