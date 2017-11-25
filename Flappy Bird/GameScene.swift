//
//  Created by ViXette on 24/11/2017.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	var bird = SKSpriteNode()
	var backgound = SKSpriteNode()
	
	
	override func didMove(to view: SKView) {
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
	}
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
	}
	
	
	override func update(_ currentTime: TimeInterval) {
		
	}
	
}
