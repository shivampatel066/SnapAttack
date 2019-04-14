//
//  ViewController.swift
//  SnapAttack
//
//  Created by Shivam on 15/04/19.
//  Copyright © 2019 Shivam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var secondCard: UIImageView!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    var cardTimer = Timer()
    
    var timerInt = 20
    var scoreInt = 0
    var gameMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func startGame(_ sender: Any) {
        
        if timerInt == 20 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            cardTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCards), userInfo: nil, repeats: true)
            
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.25
            startGameButton.setTitle("Snap", for: UIControl.State.normal)
            
        }
        if gameMode == 1 {
            
            if firstCard.image == secondCard.image {
                
                scoreInt += 1
                scoreLabel.text = String("Score: \(scoreInt)")
                
                
            } else {
                scoreInt -= 1
                scoreLabel.text = String("Score: \(scoreInt)")
                
            }
            
            
        }
        if (timerInt == 0) {
            
            timerInt = 20
            scoreInt = 0
            
            timeLabel.text = String("Time: \(timerInt)")
            scoreLabel.text = String("Time: \(scoreInt)")
            
            startGameButton.setTitle("Start", for: UIControl.State.normal)
            
            firstCard.image = UIImage(named: "red_cover")
            secondCard.image = UIImage(named: "red_cover")
            
            
        }
        
    }
    
    @objc func updateTimer() {
        
        timerInt -= 1
        timeLabel.text = String("Time: \(timerInt)")
        
        gameMode = 1
        
        startGameButton.isEnabled = true
        startGameButton.alpha = 1
        
        
        if timerInt == 0 {
            timer.invalidate()
            cardTimer.invalidate()
            
            gameMode = 0
            
            startGameButton.setTitle("Restart", for: UIControl.State.normal)
            
        }
        
        
    }
    
    @objc func updateCards() {
        
        let cardList = ["ace_of_hearts",
                        "2_of_hearts",
                        "3_of_hearts",
                        "4_of_hearts",
                        "5_of_hearts",
                        "6_of_hearts",
                        "7_of_hearts",
                        "8_of_hearts",
                        "9_of_hearts",
                        "10_of_hearts"]
        
        firstCard.image = UIImage(named: cardList.randomElement()!)
        secondCard.image = UIImage(named: cardList.randomElement()!)
        
        
        
        
        
    }
    
    
}

