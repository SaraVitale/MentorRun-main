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
    var tryAgainButton: SKSpriteNode!
    var gameOver: SKSpriteNode!
    var goMenu: SKSpriteNode!
    
    //   var finalScore: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        self.setUp()
    }
    
    func setUp() {
        
        let gameOverSound = SKAudioNode(fileNamed: "gameover")
        gameOverSound.autoplayLooped = false
        self.addChild(gameOverSound)
        
        let playAction = SKAction.play()
        gameOverSound.run(playAction)
        
        background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = -1
        background.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        
        self.addChild(background)
        
        
        gameOver = SKSpriteNode(imageNamed: "gameover")
        gameOver.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2 + 100)
        gameOver.scale(to: CGSize(width: self.frame.width/4, height: self.frame.height/4))
        
        self.addChild(gameOver)
        
        tryAgainButton = SKSpriteNode(imageNamed: "restart")
        tryAgainButton.position = CGPoint(x: self.frame.size.width/2 - 120, y: self.frame.size.height/2 - 106)
        tryAgainButton.scale(to: CGSize(width: self.frame.width/4, height: self.frame.height/4))
        tryAgainButton.name = "tryAgainButton"
        
        self.addChild(tryAgainButton)
        
        goMenu = SKSpriteNode(imageNamed: "returnMenu")
        goMenu.position = CGPoint(x: self.frame.size.width / 2 + 120, y: self.frame.size.height / 2 - 100 )
        goMenu.zPosition = 50
        goMenu.scale(to: CGSize(width: self.frame.width / 4, height: self.frame.height / 4))
        goMenu.name = "ReturnToMenu"
        
        self.addChild(goMenu)
        
        let scoreLab = SKLabelNode(fontNamed: "AmericanTypewriter-Bold")
        scoreLab.text = "Final Score: \( UserDefaults.standard.value(forKey: "score") as? Int ?? 0)"
        scoreLab.fontSize = 40
        scoreLab.fontColor = SKColor.white
        scoreLab.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2 - 30)
        
        self.addChild(scoreLab)
        
    }
    
    var score: Int? = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if (touchedNode.name == "tryAgainButton") {
                restartGame()
            }
            
            if (touchedNode.name == "ReturnToMenu") {
                goToMenu()
            }
        }
    }
    
    func restartGame() {
       if let gameScene = GameScene(fileNamed: "GameScene") {
            gameScene.scaleMode = .resizeFill
            view?.presentScene(gameScene)
        }
    }

    func goToMenu() {
        let game = GameMenuScene()
        game.scaleMode = .resizeFill
        view?.presentScene(game)
    }
}



