Shader "ulsa/SLimpio"
{
  Properties
  {

  }
  SubShader{
    CGPROGRAM
    #pragma surface surf Lambert

    struct Input
    {
      float3 color;
    };
    void surf (Input IN, inout SurfaceOutput o)
    {
      o.Albedo = fixed4(1, 1, 1, 1);
  
    }
    ENDCG
  }
}
