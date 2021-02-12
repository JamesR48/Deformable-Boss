// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:30605,y:41648,varname:node_3138,prsc:2|emission-6826-OUT,alpha-6392-OUT,clip-6392-OUT;n:type:ShaderForge.SFN_Lerp,id:1790,x:29969,y:41641,varname:node_1790,prsc:2|A-4939-OUT,B-7479-RGB,T-7479-RGB;n:type:ShaderForge.SFN_Multiply,id:4939,x:29796,y:41327,varname:node_4939,prsc:2|A-2259-OUT,B-9893-RGB;n:type:ShaderForge.SFN_Color,id:9893,x:29504,y:41370,ptovrint:False,ptlb:MiddleColor,ptin:_MiddleColor,varname:_MiddleColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9528302,c2:0.6166066,c3:0.212831,c4:1;n:type:ShaderForge.SFN_Step,id:2259,x:29523,y:41204,varname:node_2259,prsc:2|A-6710-OUT,B-4776-OUT;n:type:ShaderForge.SFN_Color,id:7479,x:29546,y:41634,ptovrint:False,ptlb:BackColor,ptin:_BackColor,varname:_BackColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.1974918,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:4776,x:29235,y:41643,varname:node_4776,prsc:2|A-7587-OUT,B-8327-OUT;n:type:ShaderForge.SFN_Add,id:8327,x:29066,y:41797,varname:node_8327,prsc:2|A-1112-OUT,B-1912-OUT;n:type:ShaderForge.SFN_Multiply,id:7587,x:29050,y:41429,varname:node_7587,prsc:2|A-2795-V,B-1793-OUT;n:type:ShaderForge.SFN_Vector1,id:1793,x:28868,y:41481,varname:node_1793,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:1112,x:28896,y:41600,varname:node_1112,prsc:2|A-2795-V,B-2241-OUT;n:type:ShaderForge.SFN_Multiply,id:1912,x:28884,y:41862,varname:node_1912,prsc:2|A-5394-OUT,B-633-OUT;n:type:ShaderForge.SFN_Power,id:633,x:28713,y:41999,varname:node_633,prsc:2|VAL-5394-OUT,EXP-1304-OUT;n:type:ShaderForge.SFN_Blend,id:5394,x:28589,y:41794,varname:node_5394,prsc:2,blmd:10,clmp:True|SRC-4523-R,DST-2209-R;n:type:ShaderForge.SFN_Time,id:7388,x:27695,y:41756,varname:node_7388,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5360,x:27955,y:41841,varname:node_5360,prsc:2|A-7388-T,B-699-OUT;n:type:ShaderForge.SFN_TexCoord,id:3526,x:27855,y:41616,varname:node_3526,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:1842,x:28126,y:41727,varname:node_1842,prsc:2|A-3526-UVOUT,B-5360-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4991,x:27593,y:42034,ptovrint:False,ptlb:Speed,ptin:_Speed,varname:_Speed,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Vector1,id:9416,x:27593,y:41922,varname:node_9416,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:699,x:27778,y:41955,varname:node_699,prsc:2|A-9416-OUT,B-4991-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1304,x:28544,y:42102,ptovrint:False,ptlb:Power,ptin:_Power,varname:_Power,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:4523,x:28366,y:41751,ptovrint:False,ptlb:Voronoi1,ptin:_Voronoi1,varname:_Voronoi1,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:888427bee374dc34e9b604e845fe54f0,ntxv:0,isnm:False|UVIN-1842-OUT;n:type:ShaderForge.SFN_Tex2d,id:2209,x:28366,y:41986,ptovrint:False,ptlb:Voronoi2,ptin:_Voronoi2,varname:_Voronoi2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1b97fd71524683d48bf008be80cfd239,ntxv:0,isnm:False|UVIN-1842-OUT;n:type:ShaderForge.SFN_TexCoord,id:2795,x:28650,y:41390,varname:node_2795,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8503,x:29693,y:41902,varname:node_8503,prsc:2|A-1916-A,B-54-OUT;n:type:ShaderForge.SFN_Multiply,id:6392,x:29906,y:41902,varname:node_6392,prsc:2|A-8503-OUT,B-8207-OUT;n:type:ShaderForge.SFN_VertexColor,id:1916,x:29471,y:41814,varname:node_1916,prsc:2;n:type:ShaderForge.SFN_Step,id:54,x:29471,y:41989,varname:node_54,prsc:2|A-3810-OUT,B-4776-OUT;n:type:ShaderForge.SFN_Slider,id:8207,x:29604,y:42122,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:_Opacity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:3810,x:29066,y:42046,ptovrint:False,ptlb:StepBackColor,ptin:_StepBackColor,varname:_StepBackColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7,max:1;n:type:ShaderForge.SFN_ValueProperty,id:2241,x:28668,y:41634,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:_Mask,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:6710,x:29222,y:41262,ptovrint:False,ptlb:StepColor,ptin:_StepColor,varname:node_6710,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.9;n:type:ShaderForge.SFN_Lerp,id:6027,x:34308,y:46748,varname:node_6027,prsc:2|A-1033-OUT,B-2480-RGB,T-2480-RGB;n:type:ShaderForge.SFN_Multiply,id:1033,x:34101,y:46578,varname:node_1033,prsc:2|A-1148-OUT,B-5971-RGB;n:type:ShaderForge.SFN_Color,id:5971,x:33937,y:46666,ptovrint:False,ptlb:MiddleColor_copy_copy,ptin:_MiddleColor_copy_copy,varname:_MiddleColor_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5541121,c3:0,c4:1;n:type:ShaderForge.SFN_Step,id:1148,x:33937,y:46517,varname:node_1148,prsc:2|A-981-RGB,B-5012-OUT;n:type:ShaderForge.SFN_Color,id:981,x:33753,y:46411,ptovrint:False,ptlb:StepColor_copy_copy,ptin:_StepColor_copy_copy,varname:_StepColor_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6603774,c2:0.5294129,c3:0.3967057,c4:1;n:type:ShaderForge.SFN_Color,id:2480,x:34101,y:46779,ptovrint:False,ptlb:BackColor_copy_copy,ptin:_BackColor_copy_copy,varname:_BackColor_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.1974918,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:5012,x:33753,y:46588,varname:node_5012,prsc:2|A-2579-OUT,B-8580-OUT;n:type:ShaderForge.SFN_Add,id:8580,x:33584,y:46742,varname:node_8580,prsc:2|A-9632-OUT,B-1820-OUT;n:type:ShaderForge.SFN_Multiply,id:2579,x:33568,y:46374,varname:node_2579,prsc:2|A-1134-G,B-569-OUT;n:type:ShaderForge.SFN_Vector1,id:569,x:33386,y:46426,varname:node_569,prsc:2,v1:0.1;n:type:ShaderForge.SFN_VertexColor,id:1134,x:33185,y:46315,varname:node_1134,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9632,x:33426,y:46550,varname:node_9632,prsc:2|A-1134-G,B-7737-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7737,x:33202,y:46506,ptovrint:False,ptlb:node_9802_copy_copy,ptin:_node_9802_copy_copy,varname:_node_9802_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:1820,x:33402,y:46807,varname:node_1820,prsc:2|A-4333-OUT,B-7531-OUT;n:type:ShaderForge.SFN_Power,id:7531,x:33231,y:46944,varname:node_7531,prsc:2|VAL-4333-OUT,EXP-5345-OUT;n:type:ShaderForge.SFN_Blend,id:4333,x:33062,y:46846,varname:node_4333,prsc:2,blmd:10,clmp:True|SRC-8554-OUT,DST-6610-OUT;n:type:ShaderForge.SFN_Noise,id:8554,x:32894,y:46781,varname:node_8554,prsc:2;n:type:ShaderForge.SFN_Noise,id:6610,x:32861,y:46962,varname:node_6610,prsc:2;n:type:ShaderForge.SFN_Time,id:5579,x:32239,y:46695,varname:node_5579,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1332,x:32540,y:46818,varname:node_1332,prsc:2|A-5579-T,B-8478-OUT;n:type:ShaderForge.SFN_TexCoord,id:2066,x:32515,y:46616,varname:node_2066,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:8125,x:32714,y:46673,varname:node_8125,prsc:2|A-2066-UVOUT,B-1332-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5052,x:32111,y:46979,ptovrint:False,ptlb:Speed_copy_copy,ptin:_Speed_copy_copy,varname:_Speed_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Vector1,id:6538,x:32111,y:46867,varname:node_6538,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:8478,x:32347,y:46910,varname:node_8478,prsc:2|A-6538-OUT,B-5052-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5345,x:33062,y:47098,ptovrint:False,ptlb:Power_copy_copy,ptin:_Power_copy_copy,varname:_Power_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Lerp,id:606,x:34372,y:46812,varname:node_606,prsc:2|A-7049-OUT,B-6032-RGB,T-6032-RGB;n:type:ShaderForge.SFN_Multiply,id:7049,x:34165,y:46642,varname:node_7049,prsc:2|A-3878-OUT,B-3760-RGB;n:type:ShaderForge.SFN_Color,id:3760,x:34001,y:46730,ptovrint:False,ptlb:MiddleColor_copy_copy_copy,ptin:_MiddleColor_copy_copy_copy,varname:_MiddleColor_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5541121,c3:0,c4:1;n:type:ShaderForge.SFN_Step,id:3878,x:34001,y:46581,varname:node_3878,prsc:2|A-1726-RGB,B-2548-OUT;n:type:ShaderForge.SFN_Color,id:1726,x:33817,y:46475,ptovrint:False,ptlb:StepColor_copy_copy_copy,ptin:_StepColor_copy_copy_copy,varname:_StepColor_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6603774,c2:0.5294129,c3:0.3967057,c4:1;n:type:ShaderForge.SFN_Color,id:6032,x:34165,y:46843,ptovrint:False,ptlb:BackColor_copy_copy_copy,ptin:_BackColor_copy_copy_copy,varname:_BackColor_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.1974918,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:2548,x:33817,y:46652,varname:node_2548,prsc:2|A-5387-OUT,B-4381-OUT;n:type:ShaderForge.SFN_Add,id:4381,x:33648,y:46806,varname:node_4381,prsc:2|A-5337-OUT,B-1646-OUT;n:type:ShaderForge.SFN_Multiply,id:5387,x:33632,y:46438,varname:node_5387,prsc:2|A-7508-G,B-9539-OUT;n:type:ShaderForge.SFN_Vector1,id:9539,x:33450,y:46490,varname:node_9539,prsc:2,v1:0.1;n:type:ShaderForge.SFN_VertexColor,id:7508,x:33249,y:46379,varname:node_7508,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5337,x:33490,y:46614,varname:node_5337,prsc:2|A-7508-G,B-7769-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7769,x:33266,y:46570,ptovrint:False,ptlb:node_9802_copy_copy_copy,ptin:_node_9802_copy_copy_copy,varname:_node_9802_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:1646,x:33466,y:46871,varname:node_1646,prsc:2|A-643-OUT,B-5986-OUT;n:type:ShaderForge.SFN_Power,id:5986,x:33295,y:47008,varname:node_5986,prsc:2|VAL-643-OUT,EXP-8026-OUT;n:type:ShaderForge.SFN_Blend,id:643,x:33126,y:46910,varname:node_643,prsc:2,blmd:10,clmp:True|SRC-5864-OUT,DST-7880-OUT;n:type:ShaderForge.SFN_Noise,id:5864,x:32958,y:46845,varname:node_5864,prsc:2;n:type:ShaderForge.SFN_Noise,id:7880,x:32925,y:47026,varname:node_7880,prsc:2;n:type:ShaderForge.SFN_Time,id:3933,x:32303,y:46759,varname:node_3933,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6413,x:32604,y:46882,varname:node_6413,prsc:2|A-3933-T,B-2304-OUT;n:type:ShaderForge.SFN_TexCoord,id:2903,x:32579,y:46680,varname:node_2903,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:2557,x:32778,y:46737,varname:node_2557,prsc:2|A-2903-UVOUT,B-6413-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5750,x:32175,y:47043,ptovrint:False,ptlb:Speed_copy_copy_copy,ptin:_Speed_copy_copy_copy,varname:_Speed_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Vector1,id:5515,x:32175,y:46931,varname:node_5515,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:2304,x:32411,y:46974,varname:node_2304,prsc:2|A-5515-OUT,B-5750-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8026,x:33126,y:47162,ptovrint:False,ptlb:Power_copy_copy_copy,ptin:_Power_copy_copy_copy,varname:_Power_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Lerp,id:87,x:34372,y:46812,varname:node_87,prsc:2|A-8613-OUT,B-7539-RGB,T-7539-RGB;n:type:ShaderForge.SFN_Multiply,id:8613,x:34165,y:46642,varname:node_8613,prsc:2|A-2018-OUT,B-8975-RGB;n:type:ShaderForge.SFN_Color,id:8975,x:34001,y:46730,ptovrint:False,ptlb:MiddleColor_copy_copy_copy_copy,ptin:_MiddleColor_copy_copy_copy_copy,varname:_MiddleColor_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5541121,c3:0,c4:1;n:type:ShaderForge.SFN_Step,id:2018,x:34001,y:46581,varname:node_2018,prsc:2|A-4922-RGB,B-8067-OUT;n:type:ShaderForge.SFN_Color,id:4922,x:33817,y:46475,ptovrint:False,ptlb:StepColor_copy_copy_copy_copy,ptin:_StepColor_copy_copy_copy_copy,varname:_StepColor_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6603774,c2:0.5294129,c3:0.3967057,c4:1;n:type:ShaderForge.SFN_Color,id:7539,x:34165,y:46843,ptovrint:False,ptlb:BackColor_copy_copy_copy_copy,ptin:_BackColor_copy_copy_copy_copy,varname:_BackColor_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.1974918,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:8067,x:33817,y:46652,varname:node_8067,prsc:2|A-6856-OUT,B-3611-OUT;n:type:ShaderForge.SFN_Add,id:3611,x:33648,y:46806,varname:node_3611,prsc:2|A-5514-OUT,B-6191-OUT;n:type:ShaderForge.SFN_Multiply,id:6856,x:33632,y:46438,varname:node_6856,prsc:2|A-6505-G,B-6593-OUT;n:type:ShaderForge.SFN_Vector1,id:6593,x:33450,y:46490,varname:node_6593,prsc:2,v1:0.1;n:type:ShaderForge.SFN_VertexColor,id:6505,x:33249,y:46379,varname:node_6505,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5514,x:33490,y:46614,varname:node_5514,prsc:2|A-6505-G,B-7349-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7349,x:33266,y:46570,ptovrint:False,ptlb:node_9802_copy_copy_copy_copy,ptin:_node_9802_copy_copy_copy_copy,varname:_node_9802_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:6191,x:33466,y:46871,varname:node_6191,prsc:2|A-1999-OUT,B-7147-OUT;n:type:ShaderForge.SFN_Power,id:7147,x:33295,y:47008,varname:node_7147,prsc:2|VAL-1999-OUT,EXP-6431-OUT;n:type:ShaderForge.SFN_Blend,id:1999,x:33126,y:46910,varname:node_1999,prsc:2,blmd:10,clmp:True|SRC-8942-OUT,DST-3086-OUT;n:type:ShaderForge.SFN_Noise,id:8942,x:32958,y:46845,varname:node_8942,prsc:2;n:type:ShaderForge.SFN_Noise,id:3086,x:32925,y:47026,varname:node_3086,prsc:2;n:type:ShaderForge.SFN_Time,id:1732,x:32303,y:46759,varname:node_1732,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8720,x:32604,y:46882,varname:node_8720,prsc:2|A-1732-T,B-1665-OUT;n:type:ShaderForge.SFN_TexCoord,id:7788,x:32579,y:46680,varname:node_7788,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:68,x:32778,y:46737,varname:node_68,prsc:2|A-7788-UVOUT,B-8720-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6666,x:32175,y:47043,ptovrint:False,ptlb:Speed_copy_copy_copy_copy,ptin:_Speed_copy_copy_copy_copy,varname:_Speed_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Vector1,id:1459,x:32175,y:46931,varname:node_1459,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:1665,x:32411,y:46974,varname:node_1665,prsc:2|A-1459-OUT,B-6666-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6431,x:33126,y:47162,ptovrint:False,ptlb:Power_copy_copy_copy_copy,ptin:_Power_copy_copy_copy_copy,varname:_Power_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Lerp,id:3500,x:34436,y:46876,varname:node_3500,prsc:2|A-276-OUT,B-5391-RGB,T-5391-RGB;n:type:ShaderForge.SFN_Multiply,id:276,x:34229,y:46706,varname:node_276,prsc:2|A-186-OUT,B-2191-RGB;n:type:ShaderForge.SFN_Color,id:2191,x:34065,y:46794,ptovrint:False,ptlb:MiddleColor_copy_copy_copy_copy_copy,ptin:_MiddleColor_copy_copy_copy_copy_copy,varname:_MiddleColor_copy_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5541121,c3:0,c4:1;n:type:ShaderForge.SFN_Step,id:186,x:34065,y:46645,varname:node_186,prsc:2|A-1571-RGB,B-5305-OUT;n:type:ShaderForge.SFN_Color,id:1571,x:33881,y:46539,ptovrint:False,ptlb:StepColor_copy_copy_copy_copy_copy,ptin:_StepColor_copy_copy_copy_copy_copy,varname:_StepColor_copy_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6603774,c2:0.5294129,c3:0.3967057,c4:1;n:type:ShaderForge.SFN_Color,id:5391,x:34229,y:46907,ptovrint:False,ptlb:BackColor_copy_copy_copy_copy_copy,ptin:_BackColor_copy_copy_copy_copy_copy,varname:_BackColor_copy_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.1974918,c3:0,c4:1;n:type:ShaderForge.SFN_Add,id:5305,x:33881,y:46716,varname:node_5305,prsc:2|A-8959-OUT,B-2951-OUT;n:type:ShaderForge.SFN_Add,id:2951,x:33712,y:46870,varname:node_2951,prsc:2|A-3220-OUT,B-2067-OUT;n:type:ShaderForge.SFN_Multiply,id:8959,x:33696,y:46502,varname:node_8959,prsc:2|A-9735-G,B-9966-OUT;n:type:ShaderForge.SFN_Vector1,id:9966,x:33514,y:46554,varname:node_9966,prsc:2,v1:0.1;n:type:ShaderForge.SFN_VertexColor,id:9735,x:33313,y:46443,varname:node_9735,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3220,x:33554,y:46678,varname:node_3220,prsc:2|A-9735-G,B-6391-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6391,x:33330,y:46634,ptovrint:False,ptlb:node_9802_copy_copy_copy_copy_copy,ptin:_node_9802_copy_copy_copy_copy_copy,varname:_node_9802_copy_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:2067,x:33530,y:46935,varname:node_2067,prsc:2|A-8507-OUT,B-2967-OUT;n:type:ShaderForge.SFN_Power,id:2967,x:33359,y:47072,varname:node_2967,prsc:2|VAL-8507-OUT,EXP-9657-OUT;n:type:ShaderForge.SFN_Blend,id:8507,x:33190,y:46974,varname:node_8507,prsc:2,blmd:10,clmp:True|SRC-9371-OUT,DST-9554-OUT;n:type:ShaderForge.SFN_Noise,id:9371,x:33022,y:46909,varname:node_9371,prsc:2;n:type:ShaderForge.SFN_Noise,id:9554,x:32989,y:47090,varname:node_9554,prsc:2;n:type:ShaderForge.SFN_Time,id:436,x:32367,y:46823,varname:node_436,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2940,x:32668,y:46946,varname:node_2940,prsc:2|A-436-T,B-1146-OUT;n:type:ShaderForge.SFN_TexCoord,id:1772,x:32643,y:46744,varname:node_1772,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:7522,x:32842,y:46801,varname:node_7522,prsc:2|A-1772-UVOUT,B-2940-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6990,x:32239,y:47107,ptovrint:False,ptlb:Speed_copy_copy_copy_copy_copy,ptin:_Speed_copy_copy_copy_copy_copy,varname:_Speed_copy_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Vector1,id:8351,x:32239,y:46995,varname:node_8351,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:1146,x:32475,y:47038,varname:node_1146,prsc:2|A-8351-OUT,B-6990-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9657,x:33190,y:47226,ptovrint:False,ptlb:Power_copy_copy_copy_copy_copy,ptin:_Power_copy_copy_copy_copy_copy,varname:_Power_copy_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Time,id:483,x:30519,y:33172,varname:node_483,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1822,x:30779,y:33257,varname:node_1822,prsc:2|A-483-T,B-826-OUT;n:type:ShaderForge.SFN_TexCoord,id:4917,x:30679,y:33032,varname:node_4917,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:9245,x:30950,y:33143,varname:node_9245,prsc:2|A-4917-UVOUT,B-1822-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7919,x:30417,y:33450,ptovrint:False,ptlb:Speed_copy_copy_copy_copy_copy,ptin:_Speed_copy_copy_copy_copy_copy,varname:_Speed_copy_copy_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Vector1,id:8468,x:30417,y:33338,varname:node_8468,prsc:2,v1:0;n:type:ShaderForge.SFN_Append,id:826,x:30602,y:33371,varname:node_826,prsc:2|A-8468-OUT,B-7919-OUT;n:type:ShaderForge.SFN_Multiply,id:6826,x:30265,y:41524,varname:node_6826,prsc:2|A-1790-OUT,B-498-OUT;n:type:ShaderForge.SFN_Vector1,id:498,x:30084,y:41793,varname:node_498,prsc:2,v1:1;proporder:9893-7479-1304-4523-2209-4991-8207-3810-2241-6710;pass:END;sub:END;*/

Shader "Shader Forge/FireBall3" {
    Properties {
        _MiddleColor ("MiddleColor", Color) = (0.9528302,0.6166066,0.212831,1)
        _BackColor ("BackColor", Color) = (1,0.1974918,0,1)
        _Power ("Power", Float ) = 0.5
        _Voronoi1 ("Voronoi1", 2D) = "white" {}
        _Voronoi2 ("Voronoi2", 2D) = "white" {}
        _Speed ("Speed", Float ) = 2
        _Opacity ("Opacity", Range(0, 1)) = 1
        _StepBackColor ("StepBackColor", Range(0, 1)) = 0.7
        _Mask ("Mask", Float ) = 1
        _StepColor ("StepColor", Float ) = 0.9
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
            Blend One One
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
                UNITY_DEFINE_INSTANCED_PROP( float4, _BackColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Speed)
                UNITY_DEFINE_INSTANCED_PROP( float, _Power)
                UNITY_DEFINE_INSTANCED_PROP( float, _Opacity)
                UNITY_DEFINE_INSTANCED_PROP( float, _StepBackColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Mask)
                UNITY_DEFINE_INSTANCED_PROP( float, _StepColor)
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
                float _StepBackColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _StepBackColor );
                float _Mask_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Mask );
                float4 node_7388 = _Time;
                float _Speed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Speed );
                float2 node_1842 = (i.uv0+(node_7388.g*float2(0.0,_Speed_var)));
                float4 _Voronoi1_var = tex2D(_Voronoi1,TRANSFORM_TEX(node_1842, _Voronoi1));
                float4 _Voronoi2_var = tex2D(_Voronoi2,TRANSFORM_TEX(node_1842, _Voronoi2));
                float node_5394 = saturate(( _Voronoi2_var.r > 0.5 ? (1.0-(1.0-2.0*(_Voronoi2_var.r-0.5))*(1.0-_Voronoi1_var.r)) : (2.0*_Voronoi2_var.r*_Voronoi1_var.r) ));
                float _Power_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Power );
                float node_4776 = ((i.uv0.g*0.1)+((i.uv0.g*_Mask_var)+(node_5394*pow(node_5394,_Power_var))));
                float _Opacity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Opacity );
                float node_6392 = ((i.vertexColor.a*step(_StepBackColor_var,node_4776))*_Opacity_var);
                clip(node_6392 - 0.5);
////// Lighting:
////// Emissive:
                float _StepColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _StepColor );
                float4 _MiddleColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MiddleColor );
                float4 _BackColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BackColor );
                float3 emissive = (lerp((step(_StepColor_var,node_4776)*_MiddleColor_var.rgb),_BackColor_var.rgb,_BackColor_var.rgb)*1.0);
                float3 finalColor = emissive;
                return fixed4(finalColor,node_6392);
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
            uniform sampler2D _Voronoi1; uniform float4 _Voronoi1_ST;
            uniform sampler2D _Voronoi2; uniform float4 _Voronoi2_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
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
                V2F_SHADOW_CASTER;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float _StepBackColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _StepBackColor );
                float _Mask_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Mask );
                float4 node_7388 = _Time;
                float _Speed_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Speed );
                float2 node_1842 = (i.uv0+(node_7388.g*float2(0.0,_Speed_var)));
                float4 _Voronoi1_var = tex2D(_Voronoi1,TRANSFORM_TEX(node_1842, _Voronoi1));
                float4 _Voronoi2_var = tex2D(_Voronoi2,TRANSFORM_TEX(node_1842, _Voronoi2));
                float node_5394 = saturate(( _Voronoi2_var.r > 0.5 ? (1.0-(1.0-2.0*(_Voronoi2_var.r-0.5))*(1.0-_Voronoi1_var.r)) : (2.0*_Voronoi2_var.r*_Voronoi1_var.r) ));
                float _Power_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Power );
                float node_4776 = ((i.uv0.g*0.1)+((i.uv0.g*_Mask_var)+(node_5394*pow(node_5394,_Power_var))));
                float _Opacity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Opacity );
                float node_6392 = ((i.vertexColor.a*step(_StepBackColor_var,node_4776))*_Opacity_var);
                clip(node_6392 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
