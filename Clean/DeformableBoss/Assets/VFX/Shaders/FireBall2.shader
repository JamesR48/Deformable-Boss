// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7241-RGB,voffset-8712-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32439,y:32755,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Add,id:8712,x:32499,y:33058,varname:node_8712,prsc:2|A-4974-XYZ,B-3530-OUT;n:type:ShaderForge.SFN_ObjectPosition,id:4974,x:32233,y:32904,varname:node_4974,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7161,x:31995,y:33189,varname:node_7161,prsc:2|A-3137-OUT,B-5256-OUT;n:type:ShaderForge.SFN_NormalVector,id:3137,x:31827,y:33057,prsc:2,pt:False;n:type:ShaderForge.SFN_Noise,id:5256,x:31840,y:33277,varname:node_5256,prsc:2|XY-7833-OUT;n:type:ShaderForge.SFN_TexCoord,id:1599,x:31517,y:33154,varname:node_1599,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:7995,x:32187,y:33202,varname:node_7995,prsc:2|A-7161-OUT,B-3055-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3055,x:32019,y:33351,ptovrint:False,ptlb:Distortion,ptin:_Distortion,varname:node_3055,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:3530,x:32386,y:33260,varname:node_3530,prsc:2|A-7995-OUT,B-9596-OUT;n:type:ShaderForge.SFN_Vector3,id:9596,x:32229,y:33365,varname:node_9596,prsc:2,v1:0.1,v2:0.1,v3:0.1;n:type:ShaderForge.SFN_Time,id:8652,x:31322,y:33264,varname:node_8652,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9158,x:31507,y:33342,varname:node_9158,prsc:2|A-8652-T,B-4408-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5849,x:31184,y:33411,ptovrint:False,ptlb:DistortionSpeed,ptin:_DistortionSpeed,varname:node_5849,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:7833,x:31682,y:33303,varname:node_7833,prsc:2|A-1599-UVOUT,B-9158-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9174,x:31184,y:33509,ptovrint:False,ptlb:DistortionSpeed_copy,ptin:_DistortionSpeed_copy,varname:_DistortionSpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.02;n:type:ShaderForge.SFN_Append,id:4408,x:31353,y:33465,varname:node_4408,prsc:2|A-5849-OUT,B-9174-OUT;proporder:7241-3055-5849-9174;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _Distortion ("Distortion", Float ) = 0.5
        _DistortionSpeed ("DistortionSpeed", Float ) = 0
        _DistortionSpeed_copy ("DistortionSpeed_copy", Float ) = 0.02
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _Color)
                UNITY_DEFINE_INSTANCED_PROP( float, _Distortion)
                UNITY_DEFINE_INSTANCED_PROP( float, _DistortionSpeed)
                UNITY_DEFINE_INSTANCED_PROP( float, _DistortionSpeed_copy)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float4 node_8652 = _Time;
                float _DistortionSpeed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DistortionSpeed );
                float _DistortionSpeed_copy_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DistortionSpeed_copy );
                float2 node_7833 = (o.uv0+(node_8652.g*float2(_DistortionSpeed_var,_DistortionSpeed_copy_var)));
                float2 node_5256_skew = node_7833 + 0.2127+node_7833.x*0.3713*node_7833.y;
                float2 node_5256_rnd = 4.789*sin(489.123*(node_5256_skew));
                float node_5256 = frac(node_5256_rnd.x*node_5256_rnd.y*(1+node_5256_skew.x));
                float _Distortion_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Distortion );
                v.vertex.xyz += (objPos.rgb+(((v.normal*node_5256)*_Distortion_var)*float3(0.1,0.1,0.1)));
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _Color_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Color );
                float3 emissive = _Color_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _Distortion)
                UNITY_DEFINE_INSTANCED_PROP( float, _DistortionSpeed)
                UNITY_DEFINE_INSTANCED_PROP( float, _DistortionSpeed_copy)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float4 node_8652 = _Time;
                float _DistortionSpeed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DistortionSpeed );
                float _DistortionSpeed_copy_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DistortionSpeed_copy );
                float2 node_7833 = (o.uv0+(node_8652.g*float2(_DistortionSpeed_var,_DistortionSpeed_copy_var)));
                float2 node_5256_skew = node_7833 + 0.2127+node_7833.x*0.3713*node_7833.y;
                float2 node_5256_rnd = 4.789*sin(489.123*(node_5256_skew));
                float node_5256 = frac(node_5256_rnd.x*node_5256_rnd.y*(1+node_5256_skew.x));
                float _Distortion_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Distortion );
                v.vertex.xyz += (objPos.rgb+(((v.normal*node_5256)*_Distortion_var)*float3(0.1,0.1,0.1)));
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
