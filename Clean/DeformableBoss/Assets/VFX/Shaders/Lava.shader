// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-5703-OUT,voffset-6794-OUT;n:type:ShaderForge.SFN_Time,id:2178,x:31409,y:32824,varname:node_2178,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7210,x:31682,y:32950,varname:node_7210,prsc:2|A-2178-T,B-7270-OUT;n:type:ShaderForge.SFN_Append,id:7270,x:31499,y:33035,varname:node_7270,prsc:2|A-2711-OUT,B-7420-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2711,x:31327,y:32985,ptovrint:False,ptlb:SpeedX,ptin:_SpeedX,varname:node_2711,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_ValueProperty,id:7420,x:31294,y:33097,ptovrint:False,ptlb:SpeedY,ptin:_SpeedY,varname:_SpeedX_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_TexCoord,id:8267,x:31561,y:32487,varname:node_8267,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:3004,x:31847,y:32824,varname:node_3004,prsc:2|A-8267-UVOUT,B-7210-OUT;n:type:ShaderForge.SFN_Tex2d,id:9165,x:32033,y:32555,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_9165,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8cec08eb48d85ff4cb69aba2c9e27798,ntxv:0,isnm:False|UVIN-3004-OUT;n:type:ShaderForge.SFN_Color,id:1620,x:32015,y:32824,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_1620,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9433962,c2:0.7366228,c3:0.3442232,c4:1;n:type:ShaderForge.SFN_Blend,id:5070,x:32292,y:32520,varname:node_5070,prsc:2,blmd:10,clmp:True|SRC-8564-RGB,DST-9165-RGB;n:type:ShaderForge.SFN_Tex2d,id:8564,x:32033,y:32309,ptovrint:False,ptlb:NoiseMask,ptin:_NoiseMask,varname:node_8564,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ee6dc1be456732d48b3c7bfa74fa6eb0,ntxv:2,isnm:False|UVIN-3004-OUT;n:type:ShaderForge.SFN_Multiply,id:488,x:32313,y:32811,varname:node_488,prsc:2|A-5070-OUT,B-1620-RGB;n:type:ShaderForge.SFN_Color,id:1862,x:32015,y:32995,ptovrint:False,ptlb:AdditiveColor,ptin:_AdditiveColor,varname:_MainColor_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9528302,c2:0.3513562,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:5703,x:32515,y:32876,varname:node_5703,prsc:2|A-488-OUT,B-1862-RGB;n:type:ShaderForge.SFN_Multiply,id:6794,x:32454,y:33226,varname:node_6794,prsc:2|A-8044-OUT,B-9096-OUT,C-1640-OUT;n:type:ShaderForge.SFN_NormalVector,id:8044,x:32246,y:33088,prsc:2,pt:False;n:type:ShaderForge.SFN_Clamp01,id:9096,x:32193,y:33264,varname:node_9096,prsc:2|IN-8564-RGB;n:type:ShaderForge.SFN_Slider,id:1640,x:32036,y:33429,ptovrint:False,ptlb:Relief,ptin:_Relief,varname:node_1640,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5091149,max:1;proporder:2711-7420-9165-1620-8564-1862-1640;pass:END;sub:END;*/

Shader "Shader Forge/Lava" {
    Properties {
        _SpeedX ("SpeedX", Float ) = 0.1
        _SpeedY ("SpeedY", Float ) = 0
        _MainTexture ("MainTexture", 2D) = "white" {}
        _MainColor ("MainColor", Color) = (0.9433962,0.7366228,0.3442232,1)
        _NoiseMask ("NoiseMask", 2D) = "black" {}
        _AdditiveColor ("AdditiveColor", Color) = (0.9528302,0.3513562,0,1)
        _Relief ("Relief", Range(0, 1)) = 0.5091149
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
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform sampler2D _NoiseMask; uniform float4 _NoiseMask_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpeedX)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpeedY)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _AdditiveColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Relief)
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
                float4 node_2178 = _Time;
                float _SpeedX_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpeedX );
                float _SpeedY_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpeedY );
                float2 node_3004 = (o.uv0+(node_2178.g*float2(_SpeedX_var,_SpeedY_var)));
                float4 _NoiseMask_var = tex2Dlod(_NoiseMask,float4(TRANSFORM_TEX(node_3004, _NoiseMask),0.0,0));
                float _Relief_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Relief );
                v.vertex.xyz += (v.normal*saturate(_NoiseMask_var.rgb)*_Relief_var);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_2178 = _Time;
                float _SpeedX_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpeedX );
                float _SpeedY_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpeedY );
                float2 node_3004 = (i.uv0+(node_2178.g*float2(_SpeedX_var,_SpeedY_var)));
                float4 _NoiseMask_var = tex2D(_NoiseMask,TRANSFORM_TEX(node_3004, _NoiseMask));
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(node_3004, _MainTexture));
                float4 _MainColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainColor );
                float4 _AdditiveColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _AdditiveColor );
                float3 emissive = ((saturate(( _MainTexture_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_MainTexture_var.rgb-0.5))*(1.0-_NoiseMask_var.rgb)) : (2.0*_MainTexture_var.rgb*_NoiseMask_var.rgb) ))*_MainColor_var.rgb)+_AdditiveColor_var.rgb);
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
            uniform sampler2D _NoiseMask; uniform float4 _NoiseMask_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpeedX)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpeedY)
                UNITY_DEFINE_INSTANCED_PROP( float, _Relief)
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
                float4 node_2178 = _Time;
                float _SpeedX_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpeedX );
                float _SpeedY_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpeedY );
                float2 node_3004 = (o.uv0+(node_2178.g*float2(_SpeedX_var,_SpeedY_var)));
                float4 _NoiseMask_var = tex2Dlod(_NoiseMask,float4(TRANSFORM_TEX(node_3004, _NoiseMask),0.0,0));
                float _Relief_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Relief );
                v.vertex.xyz += (v.normal*saturate(_NoiseMask_var.rgb)*_Relief_var);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
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
