//
//  FirstView.swift
//  G2
//
//  Created by maria gabriella sica on 14/12/23.
//

import SwiftUI
import SpriteKit
import GameplayKit

class GameMenuScene: SKScene {
    
    var firstBackground: SKSpriteNode!
    var playButton: SKSpriteNode!
    var playerButton: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        createMenu()
    }
    
    
    func createMenu() {
        
        firstBackground = SKSpriteNode(imageNamed: "bg")
        firstBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        firstBackground.zPosition = -1
        firstBackground.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        
        self.addChild(firstBackground)
        
        
        playButton = SKSpriteNode(imageNamed: "play")
        playButton.name = "playButton"
        playButton.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2 - 20)
        playButton.scale(to: CGSize(width: self.frame.width / 4, height: self.frame.height / 4))

        self.addChild(playButton)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "playButton" {
                let gameMainScene = GameScene(size: size)
                gameMainScene.scaleMode = scaleMode
                gameMainScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                view?.presentScene(gameMainScene, transition: .crossFade(withDuration: 0.5))
            }
            
            
        }
    }
}
