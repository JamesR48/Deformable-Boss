// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,2415798,fgcg:0,2830189,fgcb:0,2394364,fgca:1,fgde:0,08,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33082,y:32735,varname:node_3138,prsc:2|emission-5791-OUT,voffset-9462-OUT;n:type:ShaderForge.SFN_Lerp,id:7424,x:32340,y:32791,varname:node_7424,prsc:2|A-5247-OUT,B-3334-RGB,T-3334-RGB;n:type:ShaderForge.SFN_Multiply,id:5247,x:32133,y:32621,varname:node_5247,prsc:2|A-613-OUT,B-9231-RGB;n:type:ShaderForge.SFN_Color,id:9231,x:31969,y:32709,ptovrint:False,ptlb:MiddleColor,ptin:_MiddleColor,varname:node_9231,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,5541121,c3:0,c4:1;n:type:ShaderForge.SFN_Step,id:613,x:31969,y:32560,varname:node_613,prsc:2|A-7052-RGB,B-1810-OUT;n:type:ShaderForge.SFN_Color,id:7052,x:31620,y:32548,ptovrint:False,ptlb:StepColor,ptin:_StepColor,varname:node_7052,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,6037736,c2:0,4065755,c3:0,203215,c4:1;n:type:ShaderForge.SFN_Color,id:3334,x:32133,y:32804,ptovrint:False,ptlb:BackColor,ptin:_BackColor,varname:node_3334,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,1960784,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:1810,x:31620,y:32731,varname:node_1810,prsc:2|A-1180-OUT,B-1210-OUT;n:type:ShaderForge.SFN_Add,id:1210,x:31391,y:32822,varname:node_1210,prsc:2|A-5077-OUT,B-7706-OUT;n:type:ShaderForge.SFN_Multiply,id:1180,x:31435,y:32511,varname:node_1180,prsc:2|A-6304-G,B-34-OUT;n:type:ShaderForge.SFN_Vector1,id:34,x:31136,y:32548,varname:node_34,prsc:2,v1:0,1;n:type:ShaderForge.SFN_VertexColor,id:5724,x:31788,y:33025,varname:node_5724,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5077,x:31176,y:32672,varname:node_5077,prsc:2|A-6304-G,B-6568-RGB;n:type:ShaderForge.SFN_Multiply,id:7706,x:31152,y:32929,varname:node_7706,prsc:2|A-387-OUT,B-3926-OUT;n:type:ShaderForge.SFN_Power,id:3926,x:30981,y:33066,varname:node_3926,prsc:2|VAL-387-OUT,EXP-746-OUT;n:type:ShaderForge.SFN_Blend,id:387,x:30812,y:32968,varname:node_387,prsc:2,blmd:10,clmp:True|SRC-6815-RGB,DST-1926-RGB;n:type:ShaderForge.SFN_Time,id:7726,x:29989,y:32817,varname:node_7726,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9034,x:30268,y:32921,varname:node_9034,prsc:2|A-7726-T,B-5728-OUT;n:type:ShaderForge.SFN_TexCoord,id:826,x:29959,y:32608,varname:node_826,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:8618,x:30414,y:32762,varname:node_8618,prsc:2|A-826-UVOUT,B-9034-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7269,x:29861,y:33101,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:_XSpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:7307,x:29861,y:32977,varname:node_7307,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:5728,x:30097,y:33032,varname:node_5728,prsc:2|A-7307-OUT,B-7269-OUT;n:type:ShaderForge.SFN_ValueProperty,id:746,x:30812,y:33220,ptovrint:False,ptlb:Power,ptin:_Power,varname:node_746,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1,5;n:type:ShaderForge.SFN_Tex2d,id:6815,x:30615,y:32854,ptovrint:False,ptlb:Noise1,ptin:_Noise1,varname:node_6815,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1641882d18f793240ad8441f54d3a53c,ntxv:0,isnm:False|UVIN-8618-OUT;n:type:ShaderForge.SFN_Tex2d,id:1926,x:30601,y:33076,ptovrint:False,ptlb:Noise2,ptin:_Noise2,varname:_Noise2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8feba77eb7dedec4d951c208facd00f9,ntxv:0,isnm:False|UVIN-8618-OUT;n:type:ShaderForge.SFN_Tex2d,id:6568,x:30864,y:32626,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_6568,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0aa4de709927def4999aeed242005eca,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:9767,x:32376,y:33244,varname:node_9767,prsc:2|A-2063-OUT,B-7883-OUT,C-438-A;n:type:ShaderForge.SFN_Multiply,id:2063,x:31977,y:33158,varname:node_2063,prsc:2|A-5724-A,B-6808-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7883,x:32092,y:33313,ptovrint:False,ptlb:ClipTreshold,ptin:_ClipTreshold,varname:_Power_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_VertexColor,id:6304,x:30841,y:32444,varname:node_6304,prsc:2;n:type:ShaderForge.SFN_Step,id:6808,x:31732,y:33176,varname:node_6808,prsc:2|A-4382-OUT,B-1810-OUT;n:type:ShaderForge.SFN_Slider,id:4382,x:31348,y:33207,ptovrint:False,ptlb:TresholdValue,ptin:_TresholdValue,varname:node_4382,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,3,max:1;n:type:ShaderForge.SFN_Multiply,id:5791,x:32604,y:32955,varname:node_5791,prsc:2|A-7424-OUT,B-9767-OUT,C-438-RGB,D-1092-RGB;n:type:ShaderForge.SFN_Color,id:438,x:32167,y:33000,ptovrint:False,ptlb:Tint,ptin:_Tint,varname:node_438,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_VertexColor,id:1092,x:32365,y:33051,varname:node_1092,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9462,x:32665,y:33418,varname:node_9462,prsc:2|A-1240-OUT,B-1408-OUT;n:type:ShaderForge.SFN_Multiply,id:1408,x:32465,y:33550,varname:node_1408,prsc:2|A-7193-OUT,B-7822-OUT;n:type:ShaderForge.SFN_NormalVector,id:7193,x:32107,y:33424,prsc:2,pt:False;n:type:ShaderForge.SFN_Noise,id:1394,x:32216,y:33660,varname:node_1394,prsc:2|XY-7541-OUT;n:type:ShaderForge.SFN_ObjectPosition,id:5704,x:31770,y:33508,varname:node_5704,prsc:2;n:type:ShaderForge.SFN_Add,id:7541,x:32009,y:33585,varname:node_7541,prsc:2|A-5775-OUT,B-5398-OUT;n:type:ShaderForge.SFN_Time,id:8212,x:31636,y:33628,varname:node_8212,prsc:2;n:type:ShaderForge.SFN_Slider,id:1240,x:32330,y:33418,ptovrint:False,ptlb:VertexDistortion,ptin:_VertexDistortion,varname:node_1240,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,3384261,max:1;n:type:ShaderForge.SFN_ValueProperty,id:1285,x:31654,y:33827,ptovrint:False,ptlb:DistortionSpeed,ptin:_DistortionSpeed,varname:node_1285,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:5398,x:31827,y:33723,varname:node_5398,prsc:2|A-8212-T,B-1285-OUT;n:type:ShaderForge.SFN_Multiply,id:7822,x:32406,y:33744,varname:node_7822,prsc:2|A-1394-OUT,B-1285-OUT;n:type:ShaderForge.SFN_Append,id:5775,x:32045,y:33751,varname:node_5775,prsc:2|A-5704-X,B-5704-Y;proporder:9231-7052-3334-7269-746-6815-1926-6568-7883-4382-438-1240-1285;pass:END;sub:END;*/

Shader "Shader Forge/FireBall" {
	Properties{
		_MiddleColor("MiddleColor", Color) = (1,0.5541121,0,1)
		_StepColor("StepColor", Color) = (0.6037736,0.4065755,0.203215,1)
		_BackColor("BackColor", Color) = (1,0.1960784,0,1)
		_Speed("Speed", Float) = 1
		_Power("Power", Float) = 1.5
		_Noise1("Noise1", 2D) = "white" {}
		_Noise2("Noise2", 2D) = "white" {}
		_Mask("Mask", 2D) = "white" {}
		_ClipTreshold("ClipTreshold", Float) = 1
		_TresholdValue("TresholdValue", Range(0, 1)) = 0.3
		_Tint("Tint", Color) = (1,1,1,1)
		_VertexDistortion("VertexDistortion", Range(0, 1)) = 0.3384261
		_DistortionSpeed("DistortionSpeed", Float) = 0
	}
		SubShader{
			Tags {
				"RenderType" = "Opaque"
			}
			Pass {
				Name "FORWARD"
				Tags {
					"LightMode" = "ForwardBase"
				}
				Blend One One
				ZWrite Off

				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_instancing
				#include "UnityCG.cginc"
				#pragma multi_compile_fwdbase
				#pragma target 3.0
				uniform sampler2D _Noise1; uniform float4 _Noise1_ST;
				uniform sampler2D _Noise2; uniform float4 _Noise2_ST;
				uniform sampler2D _Mask; uniform float4 _Mask_ST;
				UNITY_INSTANCING_BUFFER_START(Props)
					UNITY_DEFINE_INSTANCED_PROP(float4, _MiddleColor)
					UNITY_DEFINE_INSTANCED_PROP(float4, _StepColor)
					UNITY_DEFINE_INSTANCED_PROP(float4, _BackColor)
					UNITY_DEFINE_INSTANCED_PROP(float, _Speed)
					UNITY_DEFINE_INSTANCED_PROP(float, _Power)
					UNITY_DEFINE_INSTANCED_PROP(float, _ClipTreshold)
					UNITY_DEFINE_INSTANCED_PROP(float, _TresholdValue)
					UNITY_DEFINE_INSTANCED_PROP(float4, _Tint)
					UNITY_DEFINE_INSTANCED_PROP(float, _VertexDistortion)
					UNITY_DEFINE_INSTANCED_PROP(float, _DistortionSpeed)
				UNITY_INSTANCING_BUFFER_END(Props)
				struct VertexInput {
					UNITY_VERTEX_INPUT_INSTANCE_ID
					float4 vertex : POSITION;
					float3 normal : NORMAL;
					float2 texcoord0 : TEXCOORD0;
					float4 vertexColor : COLOR;
				};
				struct VertexOutput {
					float4 pos : SV_POSITION;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					float2 uv0 : TEXCOORD0;
					float3 normalDir : TEXCOORD1;
					float4 vertexColor : COLOR;
				};
				VertexOutput vert(VertexInput v) {
					VertexOutput o = (VertexOutput)0;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_TRANSFER_INSTANCE_ID(v, o);
					o.uv0 = v.texcoord0;
					o.vertexColor = v.vertexColor;
					o.normalDir = UnityObjectToWorldNormal(v.normal);
					float4 objPos = mul(unity_ObjectToWorld, float4(0,0,0,1));
					float _VertexDistortion_var = UNITY_ACCESS_INSTANCED_PROP(Props, _VertexDistortion);
					float4 node_8212 = _Time;
					float _DistortionSpeed_var = UNITY_ACCESS_INSTANCED_PROP(Props, _DistortionSpeed);
					float2 node_7541 = (float2(objPos.r,objPos.g) + (node_8212.g*_DistortionSpeed_var));
					float2 node_1394_skew = node_7541 + 0.2127 + node_7541.x*0.3713*node_7541.y;
					float2 node_1394_rnd = 4.789*sin(489.123*(node_1394_skew));
					float node_1394 = frac(node_1394_rnd.x*node_1394_rnd.y*(1 + node_1394_skew.x));
					v.vertex.xyz += (_VertexDistortion_var*(v.normal*(node_1394*_DistortionSpeed_var)));
					o.pos = UnityObjectToClipPos(v.vertex);
					return o;
				}
				float4 frag(VertexOutput i) : COLOR {
					UNITY_SETUP_INSTANCE_ID(i);
					float4 objPos = mul(unity_ObjectToWorld, float4(0,0,0,1));
					i.normalDir = normalize(i.normalDir);
					float3 normalDirection = i.normalDir;
					////// Lighting:
					////// Emissive:
									float4 _StepColor_var = UNITY_ACCESS_INSTANCED_PROP(Props, _StepColor);
									float4 _Mask_var = tex2D(_Mask,TRANSFORM_TEX(i.uv0, _Mask));
									float4 node_7726 = _Time;
									float _Speed_var = UNITY_ACCESS_INSTANCED_PROP(Props, _Speed);
									float2 node_8618 = (i.uv0 + (node_7726.g*float2(0.0,_Speed_var)));
									float4 _Noise1_var = tex2D(_Noise1,TRANSFORM_TEX(node_8618, _Noise1));
									float4 _Noise2_var = tex2D(_Noise2,TRANSFORM_TEX(node_8618, _Noise2));
									float3 node_387 = saturate((_Noise2_var.rgb > 0.5 ? (1.0 - (1.0 - 2.0*(_Noise2_var.rgb - 0.5))*(1.0 - _Noise1_var.rgb)) : (2.0*_Noise2_var.rgb*_Noise1_var.rgb)));
									float _Power_var = UNITY_ACCESS_INSTANCED_PROP(Props, _Power);
									float3 node_1810 = ((i.vertexColor.g * 0.1) + ((i.vertexColor.g*_Mask_var.rgb) + (node_387*pow(node_387,_Power_var))));
									float4 _MiddleColor_var = UNITY_ACCESS_INSTANCED_PROP(Props, _MiddleColor);
									float4 _BackColor_var = UNITY_ACCESS_INSTANCED_PROP(Props, _BackColor);
									float _TresholdValue_var = UNITY_ACCESS_INSTANCED_PROP(Props, _TresholdValue);
									float _ClipTreshold_var = UNITY_ACCESS_INSTANCED_PROP(Props, _ClipTreshold);
									float4 _Tint_var = UNITY_ACCESS_INSTANCED_PROP(Props, _Tint);
									float3 emissive = (lerp((step(_StepColor_var.rgb,node_1810)*_MiddleColor_var.rgb),_BackColor_var.rgb,_BackColor_var.rgb)*((i.vertexColor.a*step(_TresholdValue_var,node_1810))*_ClipTreshold_var*_Tint_var.a)*_Tint_var.rgb*i.vertexColor.rgb);
									float3 finalColor = emissive;
									return fixed4(finalColor,1);
				}
								ENDCG
			}
		}
		FallBack "Diffuse"
		CustomEditor "ShaderForgeMaterialInspector"
}
