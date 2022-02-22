Shader "ulsa/SColorTextura"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white"{}
        _Albedo("Albedo", Color) = (1, 1, 1, 1)
    }
    SubShader 
    {
        CGPROGRAM 
        #pragma surface surf Lambert

        fixed4 _Albedo;
        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float4 color : COLOR;
        };

    void surf (Input IN, inout SurfaceOutput o)
    {
        o.Albedo=tex2D(_MainTex, IN.uv_MainTex).rgb* _Albedo.rgb;
    }
    ENDCG
    }
}   