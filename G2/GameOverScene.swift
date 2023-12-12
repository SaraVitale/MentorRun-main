//
//  GameOverScene.swift
//  G2
//
//  Created by Pietro Carnevale on 12/12/23.
//

import SpriteKit
import GameplayKit
import SwiftUI

class GameOverScene: SKScene {
    
    var background: SKSpriteNode!
    var restart: SKSpriteNode!
    var gameOver: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        self.setUp()
        
    }
    
    func setUp() {
        
        background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        background.zPosition = -1
        background.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        
        self.addChild(background)
        
        gameOver = SKSpriteNode(imageNamed: "gameover")
        gameOver.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2 + 100)
        gameOver.scale(to: CGSize(width: self.frame.width/4, height: self.frame.height/4))
        
        self.addChild(gameOver)
        
        restart = SKSpriteNode(imageNamed: "restart")
        restart.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        restart.scale(to: CGSize(width: self.frame.width/4, height: self.frame.height/4))
        
        self.addChild(restart)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)

                if restart.frame.contains(location) {
                    let newScene = GameScene(size: self.size)
                    newScene.scaleMode = self.scaleMode

                    self.view?.presentScene(newScene, transition: SKTransition.crossFade(withDuration: 1.0))
                }
            }
        }
    
}
