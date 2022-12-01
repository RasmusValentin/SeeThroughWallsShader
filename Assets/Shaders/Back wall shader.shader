Shader "Unlit/Back wall shader"
{
    Properties
    {
        _Color ("Diffuse Material Color", Color) = (1,1,1,1)
    }
    SubShader 
    {
        Pass
        {
            Tags { "LightMode" = "ForwardBase" } // Shader pass tag

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            uniform float4 _LightColor0; // Color and intensity of incoming light, Unity-specific uniform parameter

            uniform float4 _Color; // Material color

            struct vertexInput 
            {
                float4 vertex : POSITION; // Object space position of vertex
                float3 normal : NORMAL; // Object space surface normal vector
            };
            struct vertexOutput 
            {
                float4 pos : SV_POSITION; // Output clip space position of vertex
                float4 col : COLOR; // Output color
            };

            vertexOutput vert(vertexInput input)
            {
                vertexOutput output;

                float3 lightDir = normalize(_WorldSpaceLightPos0.xyz); // Normalized light direction in world space

                float3 normDir = UnityObjectToWorldNormal(input.normal); // Normalized surface normal vector

                float3 diffRef = _LightColor0.rgb * _Color.rgb * max(0.0, dot(normDir, lightDir)); // Diffuse reflection intensity equation 

                output.col = float4(diffRef, 1.0); // Outputs the color of the vertex
                output.pos = UnityObjectToClipPos(input.vertex); // Outputs the clip space position of the vertex
                return output;
            }
            
            float4 frag(vertexOutput input) : COLOR
            {
                return input.col;
            }
            ENDCG
        }
    }
}
