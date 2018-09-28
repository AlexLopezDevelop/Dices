//
//  ViewController.swift
//  Dices
//
//  Created by Alex Lopez on 20/09/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    let diceImages : [String]
    let imagesDices : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        self.diceImages = ["Dice1", "Dice2", "Dice3", "Dice4", "Dice5", "Dice6"]
        self.imagesDices = UInt32(diceImages.count)
        super.init(coder: aDecoder)
    }
    
    var leftIndexRandomDice : Int = 0
    var rightIndexRandomDice : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        self.generateRandomDice()
    }
    
    //Custom functions
    func generateRandomDice(){
        
        self.leftIndexRandomDice = Int(arc4random_uniform(self.imagesDices))
        self.rightIndexRandomDice = Int(arc4random_uniform(self.imagesDices))
        
        UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {

            self.leftDiceImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -150, y: 150))
            
            self.rightDiceImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 150, y: -150))
            
            self.leftDiceImageView.alpha = 0.0
            self.rightDiceImageView.alpha = 0.0
            
        }) { (completed) in
            
            self.leftDiceImageView.transform = CGAffineTransform.identity
            self.rightDiceImageView.transform = CGAffineTransform.identity
            
            self.leftDiceImageView.alpha = 1.0
            self.rightDiceImageView.alpha = 1.0
            
            self.leftDiceImageView.image = UIImage(named: self.diceImages[self.leftIndexRandomDice])
            self.rightDiceImageView.image = UIImage(named: self.diceImages[self.rightIndexRandomDice])
            
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generateRandomDice()
        }
    }
    
}

