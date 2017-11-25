//
//  Created by ViXette on 24/11/2017.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	var bird = SKSpriteNode()
	var backgound = SKSpriteNode()
	
	
	override func didMove(to view: SKView) {
		_ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.makePipes), userInfo: nil, repeats: true)
		
		/// Background
		let backgroundTexture = SKTexture(imageNamed: "bg.png")
		
		let moveBackgroundAnimation = SKAction.move(by: CGVector(dx: -backgroundTexture.size().width, dy: 0), duration: 7)
		let shiftBackgroundAnimation = SKAction.move(by: CGVector(dx: backgroundTexture.size().width, dy: 0), duration: 0)

		for i in 0...2 {
			backgound = SKSpriteNode(texture: backgroundTexture)
			
			backgound.position = CGPoint(x: backgroundTexture.size().width * CGFloat(i), y: self.frame.midY)
			backgound.size.height = self.frame.height
			
			backgound.run(SKAction.repeatForever(SKAction.sequence([moveBackgroundAnimation, shiftBackgroundAnimation])))
	
			backgound.zPosition = -1
			
			addChild(backgound)
		}
		
		/// Bird
		let birdTexture = SKTexture(imageNamed: "flappy1.png")
		let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
		
		let animation = SKAction.animate(with: [birdTexture, birdTexture2], timePerFrame: 0.1)
		let makeBirdFlap = SKAction.repeatForever(animation)
		
		bird = SKSpriteNode(texture: birdTexture)

		bird.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
		
		bird.run(makeBirdFlap)
		
		self.addChild(bird)
		
		/// Ground
		let ground = SKNode()
		ground.position = CGPoint(x: self.frame.midX, y: -self.frame.height / 2)
		ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.width, height: 1))
		ground.physicsBody?.isDynamic = false
		
		self.addChild(ground)
	}
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let birdTexture = SKTexture(imageNamed: "flappy1.png")
		bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 2)
		
		bird.physicsBody?.isDynamic = true
		bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
		bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 75))
	}
	
	
	override func update(_ currentTime: TimeInterval) {
		
	}
	
	
	@objc func makePipes () {
		let movePipes = SKAction.move(by: CGVector(dx: -2 * self.frame.width, dy: 0), duration: TimeInterval(self.frame.width / 100))
		
		let gapHeight: CGFloat = bird.size.height * 10
		let movementAmoint = arc4random() % UInt32(self.frame.height / 2)
		let pipeOffset = CGFloat(movementAmoint) - self.frame.height / 4
		
		let pipe1Texture = SKTexture(imageNamed: "pipe1.png")
		let pipe1 = SKSpriteNode(texture: pipe1Texture)
		pipe1.position = CGPoint(x: self.frame.width / 2, y: self.frame.midY + pipe1Texture.size().height / 2 + gapHeight / 2 + pipeOffset)
		pipe1.run(movePipes)
		self.addChild(pipe1)
		
		let pipe2Texture = SKTexture(imageNamed: "pipe2.png")
		let pipe2 = SKSpriteNode(texture: pipe2Texture)
		pipe2.position = CGPoint(x: self.frame.width / 2, y: self.frame.midY - pipe2Texture.size().height / 2 - gapHeight / 2 + pipeOffset)
		pipe2.run(movePipes)
		self.addChild(pipe2)
	}
	
}
