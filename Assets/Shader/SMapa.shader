Shader "ulsa/SMapa"
{
    Properties
    {
       _MainTex("Main Texture",2D)="white"{}
        _NormalTex("Normal Map", 2D)="bump"{}
        _Albedo("Albedo", Color)= (1,1,1,1)
        _NormalStrength("Normal value", Range(-4,4)) = 1
      


    }
    SubShader {

      CGPROGRAM
      #pragma surface surf BlinnPhong

      fixed4 _Albedo;
     sampler2D _MainTex;
     sampler2D _NormalTex;
      float _NormalStrength;
    

      struct Input 
      {
          float2 uv_MainTex;
          float4 color : COLOR;
         
      };
      void surf (Input IN, inout SurfaceOutput o) {
        
          o.Albedo= _Albedo.rgb;
          o.Normal=UnpackNormal(tex2D(_NormalTex,IN.uv_MainTex ));
          o.Normal.z/= _NormalStrength;
   

			   
      }
      ENDCG
    }
    
  }