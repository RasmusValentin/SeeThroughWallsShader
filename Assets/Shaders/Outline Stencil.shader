Shader "Unlit/Outline Stencil" {
    Properties {
        _Thickness ("Thickness", Float) = 5.0 // Creates a outline thickness property
    }

    SubShader
    {
        ColorMask 0 // Ensures that no color is rendered, making the outline a "hole"

        Stencil { // Creates a stencil test
                Ref 1 // Sets the stencil reference value to "1"
                Comp Always // A comparison that always passes, ensuring the outline is never discarded
                Pass Replace // All pixel values in stencil buffer are replaced by reference value
            }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            uniform float _Thickness;

            // This vertex shader enlarges the "Outline" object by moving its vertices along their surface normal vectors
            float4 vert(float4 vertex : POSITION, float3 normal : NORMAL) : SV_POSITION { // Converting surface normal vector into float4
                return UnityObjectToClipPos(vertex + normal * _Thickness); // Converting from object coordinates to clip coordinates and multiplying by a user-specified "_Thickness"-value
            }

            float4 frag(void) : COLOR {
                return float4(0,0,0,0); // Simply returns the color of the sphere, but gets overwritten by the ColorMask 0 in line 8
            }
            ENDCG
        }
    }
}

