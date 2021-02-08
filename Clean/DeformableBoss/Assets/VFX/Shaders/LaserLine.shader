// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.2415798,fgcg:0.2830189,fgcb:0.2394364,fgca:1,fgde:0.08,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:32837,y:32608,varname:node_4795,prsc:2|emission-2393-OUT;n:type:ShaderForge.SFN_Multiply,id:2393,x:32572,y:32707,varname:node_2393,prsc:2|A-854-OUT,B-2053-RGB,C-797-RGB,D-9248-OUT,E-8715-OUT;n:type:ShaderForge.SFN_VertexColor,id:2053,x:32188,y:32842,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:797,x:32144,y:33089,ptovrint:True,ptlb:Color,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Vector1,id:9248,x:32144,y:32972,varname:node_9248,prsc:2,v1:2;n:type:ShaderForge.SFN_Time,id:7886,x:31378,y:32641,varname:node_7886,prsc:2;n:type:ShaderForge.SFN_Append,id:777,x:31433,y:32821,varname:node_777,prsc:2|A-2295-OUT,B-2591-OUT;n:type:ShaderForge.SFN_Multiply,id:8571,x:31615,y:32776,varname:node_8571,prsc:2|A-7886-T,B-777-OUT;n:type:ShaderForge.SFN_TexCoord,id:3650,x:31548,y:32546,varname:node_3650,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:9159,x:31779,y:32667,varname:node_9159,prsc:2|A-3650-UVOUT,B-8571-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2295,x:31215,y:32755,ptovrint:False,ptlb:XSpeed,ptin:_XSpeed,varname:node_2295,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:2591,x:31226,y:32894,ptovrint:False,ptlb:YSpeed,ptin:_YSpeed,varname:node_2591,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:5979,x:31989,y:31934,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_5979,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8e6bf65ff75772d4ca9a8501850a36ea,ntxv:0,isnm:False|UVIN-9159-OUT;n:type:ShaderForge.SFN_Tex2d,id:9494,x:32156,y:32361,ptovrint:False,ptlb:Trail,ptin:_Trail,varname:_Mask_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:37a05c6532148314287efbc4c82c775a,ntxv:0,isnm:False|UVIN-9159-OUT;n:type:ShaderForge.SFN_Multiply,id:8715,x:32549,y:33021,varname:node_8715,prsc:2|A-1487-A,B-797-A,C-2053-A;n:type:ShaderForge.SFN_Tex2d,id:1487,x:32173,y:32671,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2deb6a87ed22ce74885d98f80e14154d,ntxv:0,isnm:False|UVIN-9159-OUT;n:type:ShaderForge.SFN_Add,id:854,x:32633,y:32280,varname:node_854,prsc:2|A-9823-OUT,B-9494-RGB;n:type:ShaderForge.SFN_Blend,id:9823,x:32403,y:32108,varname:node_9823,prsc:2,blmd:10,clmp:True|SRC-9631-OUT,DST-1487-RGB;n:type:ShaderForge.SFN_Tex2d,id:1604,x:32113,y:32100,ptovrint:False,ptlb:Mask2,ptin:_Mask2,varname:node_1604,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4ee798823cddcac4f983ec579b304bd9,ntxv:0,isnm:False|UVIN-9159-OUT;n:type:ShaderForge.SFN_Blend,id:9631,x:32260,y:31895,varname:node_9631,prsc:2,blmd:10,clmp:True|SRC-5979-RGB,DST-1604-RGB;proporder:797-2295-2591-5979-9494-1487-1604;pass:END;sub:END;*/

Shader "Shader Forge/LaserLine" {
    Properties {
        _TintColor ("Color", Color) = (1,1,1,1)
        _XSpeed ("XSpeed", Float ) = 2
        _YSpeed ("YSpeed", Float ) = 0
        _Mask ("Mask", 2D) = "white" {}
        _Trail ("Trail", 2D) = "white" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _Mask2 ("Mask2", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
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
            uniform sampler2D _Mask; uniform float4 _Mask_ST;
            uniform sampler2D _Trail; uniform float4 _Trail_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Mask2; uniform float4 _Mask2_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _TintColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _XSpeed)
                UNITY_DEFINE_INSTANCED_PROP( float, _YSpeed)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
////// Lighting:
////// Emissive:
                float4 node_7886 = _Time;
                float _XSpeed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _XSpeed );
                float _YSpeed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _YSpeed );
                float2 node_9159 = (i.uv0+(node_7886.g*float2(_XSpeed_var,_YSpeed_var)));
                float4 _Mask_var = tex2D(_Mask,TRANSFORM_TEX(node_9159, _Mask));
                float4 _Mask2_var = tex2D(_Mask2,TRANSFORM_TEX(node_9159, _Mask2));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_9159, _MainTex));
                float4 _Trail_var = tex2D(_Trail,TRANSFORM_TEX(node_9159, _Trail));
                float4 _TintColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TintColor );
                float3 emissive = ((saturate(( _MainTex_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_MainTex_var.rgb-0.5))*(1.0-saturate(( _Mask2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Mask2_var.rgb-0.5))*(1.0-_Mask_var.rgb)) : (2.0*_Mask2_var.rgb*_Mask_var.rgb) )))) : (2.0*_MainTex_var.rgb*saturate(( _Mask2_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Mask2_var.rgb-0.5))*(1.0-_Mask_var.rgb)) : (2.0*_Mask2_var.rgb*_Mask_var.rgb) ))) ))+_Trail_var.rgb)*i.vertexColor.rgb*_TintColor_var.rgb*2.0*(_MainTex_var.a*_TintColor_var.a*i.vertexColor.a));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
