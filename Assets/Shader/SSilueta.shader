Shader "ulsa/SSilueta"
{
    Properties
    {
        _Albedo("Albedo", Color)= (1,1,1,1)

        [HDR] _RimColor("RimColor", Color) = (1,1,1,1)
        _RimStrenght("Rim Strenght", Range (.1,8)) = 1

    }
    SubShader
    {
        Tags {"RenderType" = "Opaque"}

        CGPROGRAM
        #pragma surface surf BlinnPhong

        fixed4 _Albedo;
        fixed4 _RimColor;
        float _RimStrenght;

        struct Input
        {
            float2 uv_MainTex;
            float4 color : COLOR;
            float3 viewDir;
        };
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Albedo.rgb;

            half rim = 1 - saturate(dot(IN.viewDir, o.Normal));
            o.Emission = _RimColor.rgb * pow(rim, _RimStrenght);
        }
        ENDCG
    }
}