using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Raycast : MonoBehaviour
{
    public GameObject camera;
    public GameObject target;
    public LayerMask mylayermask;
    public GameObject Outline;
    Material outlineMaterial;

    void Awake()
    {
        outlineMaterial = Outline.GetComponent<Renderer>().material; // Accessing the material of the Outline gameObject
    }

    void Update()
    {
        // Debug.Log(outlineMaterial.name);
        
        RaycastHit hit;                                                                  // Casts a ray from the camera to target gameObject

        if (Physics.Raycast(camera.transform.position,
            (target.transform.position - camera.transform.position).normalized,
            out hit, Mathf.Infinity, mylayermask))
        {
            if (hit.collider.gameObject.tag == "ObjectOutline")                            // If the target gameObject has the ObjectOutline tag
            {
                outlineMaterial.SetFloat("_Thickness", 0f);                               // Sets the _Thickness property of the shader material on the Outline gameObject to 0f
                // Debug.Log("HIT");
            }

            else
            {
                outlineMaterial.SetFloat("_Thickness", 5f);                                 // Sets the _Thickness property of the shader material on the Outline gameObject to 5f
                // Debug.Log("NOT HIT");
            }
        }
    }
}
