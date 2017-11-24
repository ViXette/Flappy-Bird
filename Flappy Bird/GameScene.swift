//
//  Created by ViXette on 24/11/2017.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	var bird = SKSpriteNode()
	
	
	override func didMove(to view: SKView) {
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
