//
//  ViewController.swift
//  Tic Tac Taco
//
//  Created by Ankita Satpathy on 09/10/16.
//  Copyright © 2016 Ankita Satpathy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var gameActive = true
    
    var gameState   = [0,0,0,0,0,0,0,0,0]
    let winningCombination  = [[0,1,2],[3,4,5] ,[6,7,8], [0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,8]]

    @IBOutlet weak var GameoverText: UILabel!

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState   = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1
        gameActive = true
        
        GameoverText.isHidden = true
        GameoverText.center = CGPoint(x: GameoverText.center.x - 500 , y: GameoverText.center.y)
        playAgainButton.isHidden = true
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500 , y: playAgainButton.center.y)
        var buttonToClear :UIButton
        for i in 0 ..< 9 {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, for: .normal)
        }
        
    }
      @IBAction func buttonPressed(_ sender: AnyObject) {
        
           if (gameState[sender.tag] == 0 && gameActive == true) {
            
              gameState[sender.tag] = activePlayer
                 if activePlayer == 1 {
    
                    sender.setImage(UIImage(named:"cross.png"), for: .normal)
                    activePlayer = 2
                 }
             else {
            
            sender.setImage(UIImage(named:"nought.png"), for: .normal)
            activePlayer = 1
           }
           
            for combination in winningCombination {
            
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
        
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        GameoverText.text = "cross wins"
                      }
                    else {
                         GameoverText.text = "nought wins"
                      }
                    
                    endGame()
                }
        
            }
            
        if gameActive == true {
               gameActive = false
            
            for buttonState in gameState {
                
                if buttonState == 0 {
                    gameActive = true
                }
            }
            if gameActive == false{
                GameoverText.text = "lol! Draw!"
                endGame()
               }
            }
    }
}
    
    
func endGame() {
    GameoverText.isHidden = false
    playAgainButton.isHidden = false
    UIView.animate(withDuration: 0.5, animations: {
    self.GameoverText.center = CGPoint(x: self.GameoverText.center.x + 500, y: self.GameoverText.center.y)
    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500 , y: self.playAgainButton.center.y)
    
    
       })
}
  override  func viewDidLoad() {
        super.viewDidLoad()
    
    GameoverText.isHidden = true
    GameoverText.center = CGPoint(x: GameoverText.center.x - 500 , y: GameoverText.center.y)
    playAgainButton.isHidden = true
    playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500 , y: playAgainButton.center.y)
    
    }

}

