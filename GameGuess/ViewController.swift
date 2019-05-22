//
//  ViewController.swift
//  GameGuess
//
//  Created by Denis Andreev on 5/7/19.
//  Copyright © 2019 353. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var currentValue : Int = 0
    var targetValue : Int = 0
    var score : Int = 0
    var levelCount = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    
    override func viewDidLoad() {
        startNewRound()
        let thumbImage = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImage, for: .normal)
        
        let thumbImagehiglighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImagehiglighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let track  = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLefft  = track.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLefft , for: .normal)
        
        let track1  = #imageLiteral(resourceName: "SmallButton")
        let trackLefft1  = track1.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLefft1, for: .normal) 
    }
    
    @IBAction func hitButton(_ sender: UIButton) {
        let difference: Int =  abs(currentValue - targetValue)
        var points : Int = 100 - difference
        
        
        
        var  title : String  = ""
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }
        }
        
        score +=  points
        
        if  levelCount < 10 {
            
            if difference > 10{
                let alert = UIAlertController(title: title, message: "The value is \(currentValue). DEFEAT", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okey", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
                levelCount = 0
                score = 0
                startNewRound()
            }
            else {
                
                let alert = UIAlertController(title: title, message: "The value is \(currentValue). You scored \(points) points", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okey", style: .default, handler: {
                    action in
                    self.startNewRound()
                })
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        } else {
            if difference > 5{
                let alert = UIAlertController(title: title, message: "The value is \(currentValue). DEFEAT", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okey", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
                levelCount = 0
                score = 0
                startNewRound()
            }
            else {
                
                let alert = UIAlertController(title: title, message: "The value is \(currentValue). You scored \(points) points", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okey", style: .default, handler: {
                    action in
                    self.startNewRound()
                })
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
        }
    }
}
    
    @IBAction func resetButton(_ sender: UIButton) {
        levelCount = 0
        score = 0
        startNewRound()
    }
    
    @IBAction func sloderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        levelCount += 1
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels(){
        scoreLabel.text = String(score)
        level.text = String(levelCount)
        targetLabel.text  = String(targetValue)
        
    }
    
}

