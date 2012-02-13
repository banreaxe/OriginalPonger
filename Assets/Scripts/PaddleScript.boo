import UnityEngine

class PaddleScript (MonoBehaviour): 
	
	public moveSpeed as single = 50
	public maxSpeed as single = 50

	def Start ():
		pass
	
	def Update ():
		#Debug.Log("magnitude: $(rigidbody.velocity.magnitude)")
		pass
		
	def FixedUpdate():
		axis = Input.GetAxisRaw("Vertical")
		force = axis * moveSpeed
		
		if axis != 0:
			rigidbody.AddForce(Vector3(0, force, 0))
		
		speedDiff = rigidbody.velocity.magnitude - maxSpeed
		if speedDiff > 0:
			rigidbody.AddForce(Vector3(0, speedDiff, 0))
		