//
//  SwiftUIView.swift
//  G2
//
//  Created by maria gabriella sica on 15/12/23.
//

import SpriteKit
import GameplayKit
import SwiftUI

class Tutorial: SKScene {
    
    var background: SKSpriteNode!
    var candy: SKSpriteNode!
    var cacchina: SKSpriteNode!
    var student: SKSpriteNode!
    
    let animation = SKAction.fadeIn(withDuration: 2.0)
    let waitDJ = SKAction.wait(forDuration: 1)
    let waitScary = SKAction.wait(forDuration: 2)
    let waitCandies = SKAction.wait(forDuration: 3)
    
    
    override func didMove(to view: SKView) {
        tutorial()
    }
    
    func tutorial(){
        
        background = SKSpriteNode(imageNamed: "tutorialBG")
        background.zPosition = -2
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        
        self.addChild(background)
        
        let jump = SKLabelNode(fontNamed: "AmericanTypewriter")
        jump.text = "Tap to jump"
        jump.fontSize = 40
        jump.fontColor = SKColor.white
        jump.position = CGPoint(x: self.frame.size.width / 2 - 200, y: self.frame.size.height / 2 + 100)
        jump.alpha = 0
        jump.run(animation)
        
        self.addChild(jump)
        
        let doubleJump = SKLabelNode(fontNamed: "AmericanTypewriter")
        doubleJump.text = "Tap twice to\ndouble jump"
        doubleJump.numberOfLines = 2
        doubleJump.fontSize = 40
        doubleJump.fontColor = SKColor.white
        doubleJump.position = CGPoint(x: self.frame.size.width / 2 + 200, y: self.frame.size.height / 2 + 10)
        doubleJump.alpha = 0
        doubleJump.run(SKAction.sequence([waitDJ, animation]))
        
        self.addChild(doubleJump)
        
        let candies = SKLabelNode(fontNamed: "AmericanTypewriter")
        candies.text = "Collect candies"
        candies.fontSize = 40
        candies.fontColor = SKColor.white
        candies.position = CGPoint(x: self.frame.size.width / 2 + 200, y: self.frame.size.height / 2 - 120)
        candies.alpha = 0
        candies.run(SKAction.sequence([waitCandies, animation]))
        
        self.addChild(candies)
        
        let scary = SKLabelNode(fontNamed: "AmericanTypewriter")
        scary.text = "Avoid the poops\nand the students"
        scary.numberOfLines = 2
        scary.fontSize = 40
        scary.fontColor = SKColor.white
        scary.position = CGPoint(x: self.frame.size.width / 2 - 180, y: self.frame.size.height / 2 - 80)
        scary.alpha = 0
        scary.run(SKAction.sequence([waitScary, animation]))
        
        self.addChild(scary)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            let destination = GameMenuScene(size: size)
            destination.scaleMode = scaleMode
            destination.anchorPoint = CGPoint(x: 0, y: 0)
            view?.presentScene(destination, transition: .crossFade(withDuration: 0.9))
        }
    }
}
