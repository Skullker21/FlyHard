using System;
using Unity.Mathematics;
using UnityEngine;

public class Movement : MonoBehaviour
{
    private GameObject _player;
    private Rigidbody2D _rigidbodyReference;
    private float angle1;
    
    public float thrust = 2.5f;
    public bool hasControl = true;
    public float turnSpeed = 2f;
    

    // Start is called before the first frame update
    void Start()
    {
        _player = GetComponent<GameObject>();
        _rigidbodyReference = GetComponent<Rigidbody2D>();
    }
    
    // Update is called once per frame
    void Update()
    {
        
    }

    private void FixedUpdate()
    {
        if (hasControl)
        {
            faceMouse();
            
            _rigidbodyReference.AddForce(transform.right * thrust);
        }
    }
    
    void faceMouse()
    {
        Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);    
        
        var angle = Mathf.Atan2(mousePosition.x - transform.position.x, mousePosition.y - transform.position.y) * 180/ Mathf.PI; //Get mouse angle and parse it

        angle -= 90; //account for sprite rotated to right by default
        
        _rigidbodyReference.rotation %= 360; //normalize rigidbody rotation
        
        angle = (angle + _rigidbodyReference.rotation); // Summate rigidbody and mouse angle
        if (angle < 0)
        {
            angle1 = 360.0f + angle;
        }
        else
        {
            angle1 = 360.0f - angle; // calculates negative angle
        }

        if (Mathf.Abs(angle) > Mathf.Abs(angle1) && angle < 0)
        {
            angle = angle1;  
        }
        if (Mathf.Abs(angle) > Mathf.Abs(angle1) && angle > 0)
        {
            angle = angle1 * -1; // from my testing (stolen) i found out that by writing these ifs rigid body stops doing awkward 360 spins
        }
        _rigidbodyReference.AddTorque(-angle / 180 * turnSpeed);
    }
}
