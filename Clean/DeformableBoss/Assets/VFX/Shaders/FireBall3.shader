// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:30215,y:41616,varname:node_3138,prsc:2|emission-1790-OUT,alpha-6392-OUT;n:type:ShaderForge.SFN_Lerp,id:1790,x:29949,y:41667,varname:node_1790,prsc:2|A-4939-OUT,B-7479-RGB,T-7479-RGB;n:type:ShaderForge.SFN_Multiply,id:4939,x:29796,y:41327,varname:node_4939,prsc:2|A-2259-OUT,B-9893-RGB;n:type:ShaderForge.SFN_Color,id:9893,x:29501,y:41386,ptovrint:False,ptlb:MiddleColor,ptin:_MiddleColor,varname:_MiddleColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9528302,c2:0.6166066,c3:0.212831,c4:1;n:type:ShaderForge.SFN_Step,id:2259,x:29523,y:41204,varname:node_2259,prsc:2|A-9201-RGB,B-4776-OUT;n:type:ShaderForge.SFN_Color,id:9201,x:29260,y:41209,ptovrint:False,ptlb:StepColor,ptin:_StepColor,varname:_StepColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8679245,c2:0.8243393,c3:0.8243393,c4:1;n:type:ShaderForge.SFN_Color,id:7479,x:29693,y:41677,ptovrint:False,ptlb:BackColor,ptin:_BackColor,varname:_BackColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.1974918,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:4776,x:29235,y:41643,varname:node_4776,prsc:2|A-7587-OUT,B-8327-OUT;n:type:ShaderForge.SFN_Add,id:8327,x:29066,y:41797,varname:node_8327,prsc:2|A-1112-OUT,B-1912-OUT;n:type:ShaderForge.SFN_Multiply,id:7587,x:29050,y:41429,varname:node_7587,prsc:2|A-2795-V,B-1793-OUT;n:type:ShaderForge.SFN_Vector1,id:1793,x:28868,y:41481,varname:node_1793,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:1112,x:28896,y:41600,varname:node_1112,prsc:2|A-2795-V,B-2241-OUT;n:type:ShaderForge.SFN_Multiply,id:1912,x:28884,y:41862,varname:node_1912,prsc:2|A-5394-OUT,B-633-OUT;n:type:ShaderForge.SFN_Power,id:633,x:28713,y:41999,varname:node_633,prsc:2|VAL-5394-OUT,EXP-1304-OUT;n:type:ShaderForge.SFN_Blend,id:5394,x:28589,y:41794,varname:node_5394,prsc:2,blmd:10,clmp:True|SRC-4523-R,DST-2209-R;n:type:ShaderForge.SFN_Time,id:7388,x:27695,y:41756,varname:node_7388,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5360,x:27955,y:41841,varname:node_5360,prsc:2|A-7388-T,B-699-OUT;n:type:ShaderForge.SFN_TexCoord,id:3526,x:27855,y:41616,varname:node_3526,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:1842,x:28126,y:41727,varname:node_1842,prsc:2|A-3526-UVOUT,B-5360-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4991,x:27593,y:42034,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:_Speed,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Vector1,id:9416,x:27593,y:41922,varname:node_9416,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:699,x:27778,y:41955,varname:node_699,prsc:2|A-9416-OUT,B-4991-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1304,x:28544,y:42102,ptovrint:False,ptlb:Power,ptin:_Power,varname:_Power,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:4523,x:28366,y:41751,ptovrint:False,ptlb:Voronoi1,ptin:_Voronoi1,varname:_Voronoi1,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1641882d18f793240ad8441f54d3a53c,ntxv:0,isnm:False|UVIN-1842-OUT;n:type:ShaderForge.SFN_Tex2d,id:2209,x:28366,y:41986,ptovrint:False,ptlb:Voronoi2,ptin:_Voronoi2,varname:_Voronoi2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1b97fd71524683d48bf008be80cfd239,ntxv:0,isnm:False|UVIN-1842-OUT;n:type:ShaderForge.SFN_TexCoord,id:2795,x:28650,y:41390,varname:node_2795,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8503,x:29693,y:41902,varname:node_8503,prsc:2|A-1916-A,B-54-OUT;n:type:ShaderForge.SFN_Multiply,id:6392,x:29906,y:41902,varname:node_6392,prsc:2|A-8503-OUT,B-8207-OUT;n:type:ShaderForge.SFN_VertexColor,id:1916,x:29471,y:41814,varname:node_1916,prsc:2;n:type:ShaderForge.SFN_Step,id:54,x:29471,y:41989,varname:node_54,prsc:2|A-3810-OUT,B-4776-OUT;n:type:ShaderForge.SFN_Slider,id:8207,x:29604,y:42122,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:_Opacity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:3810,x:29066,y:42046,ptovrint:False,ptlb:StepBackColor,ptin:_StepBackColor,varname:_StepBackColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7,max:1;n:type:ShaderForge.SFN_ValueProperty,id:2241,x:28668,y:41634,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:_Mask,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:7248,x:29222,y:41020,ptovrint:False,ptlb:node_7248,ptin:_node_7248,varname:node_7248,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:89a16046b17f40d48b3d2d7ea17a29f6,ntxv:0,isnm:False|UVIN-1842-OUT;proporder:9893-9201-7479-1304-4523-2209-4991-8207-3810-2241-7248;pass:END;sub:END;*/

Shader "Shader Forge/FireBall3" {
    Properties {
        _MiddleColor ("MiddleColor", Color) = (0.9528302,0.6166066,0.212831,1)
        _StepColor ("StepColor", Color) = (0.8679245,0.8243393,0.8243393,1)
        _BackColor ("BackColor", Color) = (1,0.1974918,0,1)
        _Power ("Power", Float ) = 0.5
        _Voronoi1 ("Voronoi1", 2D) = "white" {}
        _Voronoi2 ("Voronoi2", 2D) = "white" {}
        _Speed ("Speed", Float ) = 2
        _Opacity ("Opacity", Range(0, 1)) = 1
        _StepBackColor ("StepBackColor", Range(0, 1)) = 0.7
        _Mask ("Mask", Float ) = 1
        _node_7248 ("node_7248", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 3.0
            uniform sampler2D _Voronoi1; uniform float4 _Voronoi1_ST;
            uniform sampler2D _Voronoi2; uniform float4 _Voronoi2_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _MiddleColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _StepColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BackColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Speed)
                UNITY_DEFINE_INSTANCED_PROP( float, _Power)
                UNITY_DEFINE_INSTANCED_PROP( float, _Opacity)
                UNITY_DEFINE_INSTANCED_PROP( float, _StepBackColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Mask)
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
                float4 _StepColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _StepColor );
                float _Mask_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Mask );
                float4 node_7388 = _Time;
                float _Speed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Speed );
                float2 node_1842 = (i.uv0+(node_7388.g*float2(0.0,_Speed_var)));
                float4 _Voronoi1_var = tex2D(_Voronoi1,TRANSFORM_TEX(node_1842, _Voronoi1));
                float4 _Voronoi2_var = tex2D(_Voronoi2,TRANSFORM_TEX(node_1842, _Voronoi2));
                float node_5394 = saturate(( _Voronoi2_var.r > 0.5 ? (1.0-(1.0-2.0*(_Voronoi2_var.r-0.5))*(1.0-_Voronoi1_var.r)) : (2.0*_Voronoi2_var.r*_Voronoi1_var.r) ));
                float _Power_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Power );
                float node_4776 = ((i.uv0.g*0.1)+((i.uv0.g*_Mask_var)+(node_5394*pow(node_5394,_Power_var))));
                float4 _MiddleColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MiddleColor );
                float4 _BackColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BackColor );
                float3 emissive = lerp((step(_StepColor_var.rgb,node_4776)*_MiddleColor_var.rgb),_BackColor_var.rgb,_BackColor_var.rgb);
                float3 finalColor = emissive;
                float _StepBackColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _StepBackColor );
                float _Opacity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Opacity );
                return fixed4(finalColor,((i.vertexColor.a*step(_StepBackColor_var,node_4776))*_Opacity_var));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
