using System.Collections;
using System.Collections.Generic;
using TreeEditor;
using UnityEngine;

public class Movement : MonoBehaviour
{
    private GameObject player;
    private Rigidbody2D _rigidbodyReference;
    public float thrust = 2.5f;
    
    // Start is called before the first frame update
    void Start()
    {
        player = GetComponent<GameObject>();
        _rigidbodyReference = GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {
        var dir = Input.mousePosition - Camera.main.WorldToScreenPoint(transform.position);
        var angle = Mathf.Atan2(dir.y, dir.x) * Mathf.Rad2Deg;
        Debug.Log(angle);
        transform.rotation = Quaternion.AngleAxis(angle, Vector3.forward);
        
        _rigidbodyReference.AddForce(transform.right * thrust);
    }
}
