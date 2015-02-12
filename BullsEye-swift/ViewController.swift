//
//  ViewController.swift
//  BullsEye-swift
//
//  Created by Michael Henry on 2/11/15.
//  Copyright (c) 2015 Digital Javelina, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        var title: String
        if difference == 0 {
            title = "Perfect! You get 100 Bonus Points!"
            score += 100
        } else if difference < 2 {
            title = "So close! You get 50 Bonus Points!"
            score += 50
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close!"
        }
        
        let message = "You moved the slider to \(currentValue)." + "\nYou scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.startNewRound()
            self.updateLabels()
            })
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
}

