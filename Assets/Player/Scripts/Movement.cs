using System;
using Unity.Mathematics;
using UnityEngine;

public class Movement : MonoBehaviour
{
    private GameObject _player;
    private Rigidbody2D _rigidbodyReference;
    private float normalizedAngle;
    
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
            FaceMouse();

            _rigidbodyReference.AddForce(transform.right * thrust);
            
        }
    }

    float CalculateAngleDifference(Vector3 endPoint)
    {
        var angle = Mathf.Atan2(endPoint.x - transform.position.x, endPoint.y - transform.position.y) * 180/ Mathf.PI; //Get mouse angle and parse it

        return angle;
    }

    void ApplyPerpendicularForce(float targetAngle)
    {

        if (targetAngle > 0)
        {
            //turning right
            //force direction is transform.down

            Debug.LogWarning("Turning right");
            
            _rigidbodyReference.AddForce(-transform.up * (_rigidbodyReference.velocity * (Mathf.Abs(_rigidbodyReference.angularVelocity) * .1f)));

            Debug.Log("(_rigidbodyReference.angularVelocity * .1f) = " + Mathf.Abs(_rigidbodyReference.angularVelocity * .1f));
            
        }
        else if (targetAngle < 0)
        {
            //else turning left
            //force direction is transform.up
            
            Debug.LogWarning("Turning left");
            
            _rigidbodyReference.AddForce(transform.up * (_rigidbodyReference.velocity * (Mathf.Abs(_rigidbodyReference.angularVelocity) * .1f)));
            
            Debug.Log("(_rigidbodyReference.angularVelocity * .1f) = " + Mathf.Abs(_rigidbodyReference.angularVelocity * .1f));
        }


    }

    void FaceMouse()
    {
        
        Vector3 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);

        var angle = CalculateAngleDifference(mousePosition);

        angle -= 90; //account for sprite rotated to right by default
        
        _rigidbodyReference.rotation %= 360; //normalize rigidbody rotation
        
        
        angle = (angle + _rigidbodyReference.rotation); // Summate rigidbody and mouse angle
        
        
        if (angle < 0)
        {
            normalizedAngle = 360.0f + angle;
        }
        else
        {
            normalizedAngle = 360.0f - angle; // calculates current angle
        }
        

        if (Mathf.Abs(angle) > Mathf.Abs(normalizedAngle) && angle < 0)
        {
            angle = normalizedAngle;  
        }
        if (Mathf.Abs(angle) > Mathf.Abs(normalizedAngle) && angle > 0)
        {
            angle = normalizedAngle * -1; // from my testing (stolen) i found out that by writing these ifs rigid body stops doing awkward 360 spins
        }

        _rigidbodyReference.AddTorque(-angle / 180 * turnSpeed);
        ApplyPerpendicularForce(angle);
    }
}
