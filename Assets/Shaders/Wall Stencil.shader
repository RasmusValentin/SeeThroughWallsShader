Shader "Unlit/Wall Stencil"
{
    Properties
    {
        _Color ("Diffuse Material Color", Color) = (1,1,1,1) // Creates a color property for the material
    }
    SubShader 
    {
        Stencil { // This stencil block ensures that the wall gameObject is only visible where it is not covered by the Outline stencil.
                Ref 1 // Reference for the Stencil, used for comparison in the stencil buffer.
                Comp NotEqual // Comparison for pixel's value in the stencil buffer. This value is only passed if the pixel value is not equal to the reference (1).
                // No specified pass or fail command, as this stencil block is purely for reading the stencil buffer.
            }

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
