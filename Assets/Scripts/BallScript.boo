import UnityEngine

class BallScript (MonoBehaviour): 
	
	#public startForce as single = 100
	public maxSpeed as single = 10
	public minSpeed as single = 2
	public scoreKeeper as ScoreKeeperScript
	public ballServer as BallServerScript
	
	def Start ():
		#rigidbody.AddForce(Vector3(startForce, startForce, 0))
		pass
	
	def Update ():
		pass
	
	def FixedUpdate():
		// Enforce Speed Limits
		#TODO Debug These
		overSpeedDiff = rigidbody.velocity.magnitude - maxSpeed
		if overSpeedDiff > 0:
			#Debug.Log("Over:$(rigidbody.velocity.magnitude)")
			rigidbody.AddForce((rigidbody.velocity.x * overSpeedDiff) * -1.0, (rigidbody.velocity.y * overSpeedDiff) * -1.0, rigidbody.velocity.x)
		
		underSpeedDiff = minSpeed - rigidbody.velocity.magnitude
		if underSpeedDiff > 0 :
			#Debug.Log("Under:$(rigidbody.velocity.magnitude)")
			rigidbody.AddForce(rigidbody.velocity.x * underSpeedDiff, rigidbody.velocity.y * underSpeedDiff, rigidbody.velocity.x)
	
	def OnTriggerEnter(collider as Collider):
		if collider.tag == "Wall":
			rigidbody.velocity.y = -1.0 * (rigidbody.velocity.y)
		elif collider.tag == "Paddle":
			paddleSpeed = collider.rigidbody.velocity.magnitude
			rigidbody.velocity.x = -1.0 * (paddleSpeed  / 2.0) * (rigidbody.velocity.x)
		
	
		if collider.tag == "GoalZoneLeft":
			sk = GameObject.Find("ScoreKeeper").GetComponent[of ScoreKeeperScript]()
			sk.PointRight()
			
			bs = GameObject.Find("BallServer").GetComponent[of BallServerScript]()
			bs.ballInPlay = false
			bs.SetDirectionRight()
			Destroy(gameObject)
			
		elif collider.tag == "GoalZoneRight":
			sk = GameObject.Find("ScoreKeeper").GetComponent[of ScoreKeeperScript]()
			sk.PointLeft()
			
			bs = GameObject.Find("BallServer").GetComponent[of BallServerScript]()
			bs.ballInPlay = false
			bs.SetDirectionLeft()
			Destroy(gameObject)