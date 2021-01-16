Shader "Custom/ProcSha"
{
	SubShader{
		LOD 200
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 5.0
			#include "UnityCG.cginc"

			struct Vertex
			{
				float3 vPosition;
				float3 vNormal;
			};

			StructuredBuffer<Vertex> _Buffer;
			float4x4 objMat;

			// vertex input: position, normal
			struct appdata {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

			struct v2f {
				float4 pos : SV_POSITION;
				fixed4 color : COLOR;
			};

			appdata GetVertData(appdata v, uint id)
			{
				//uint pid = id / 3;
				//uint vid = id % 3;
				Vertex vertice = _Buffer[id];

				//v.vertex = mul(UNITY_MATRIX_VP, mul(objMat, float4(_Buffer[pid].v[vid].vPosition, 1)));
				/*v.vertex = mul(objMat, float4(_Buffer[pid].v[vid].vPosition, 1));
				v.normal = normalize(mul((float3x3)objMat, _Buffer[pid].v[vid].vNormal));*/
				v.vertex = mul(objMat, float4(vertice.vPosition.xyz, 1));
				v.normal = normalize(mul((float3x3)objMat, vertice.vNormal));
				return v;
			}

			v2f vert(appdata v, uint id : SV_VertexID)
			{
				
				v = GetVertData(v, id);

				//uint pid = id / 3;
				//uint vid = id % 3;

				/*v.vertex = mul(UNITY_MATRIX_VP, mul(objMat, float4(_Buffer[pid].v[vid].vPosition, 1)));
				v.normal = mul(unity_ObjectToWorld, _Buffer[pid].v[vid].vNormal);*/

				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				//o.pos = v.vertex;
				o.color.xyz = v.normal * 0.5 + 0.5;
				o.color.w = 1.0;
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				return i.color;
			}
				ENDCG
		}
	}
}
