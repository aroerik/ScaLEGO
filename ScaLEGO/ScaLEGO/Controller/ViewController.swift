//
//  ViewController.swift
//  ScaLEGO
//
//  Created by Erik on 3/28/20.
//  Copyright © 2020 Erik Aro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var legoScale: UIButton!
    @IBOutlet weak var humanScale: UIButton!
    @IBOutlet weak var heightButton: UIButton!
    @IBOutlet weak var lengthButton: UIButton!
    @IBOutlet weak var scaledOutput: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var whatScalingLabel: UILabel!
    
    var finalResult = "0.0"
    var theInput = "0.0"
    var heightScale = 0.45
    var lengthScale = 0.25
    var theScale = 1 / 0.45
    var setScale = 0.45
    var theOutput = 0.0
    var bricksOrStuds = "bricks"
    var humanOrLego = "LEGO"
    var heightOrLength = "Height"
    var rounding = "%.0f"
    
    func outputUpdater() {
        if humanScale.isSelected == true {
            bricksOrStuds = "meters"
        } else {
            if heightOrLength == "Height" {
                bricksOrStuds = "bricks"
            } else {
                bricksOrStuds = "studs"
            }
        }
        finalResult = String(format: "\(rounding)", theOutput)
        scaledOutput.text = "Output: \(finalResult) \(bricksOrStuds)"
    }
    
    func calculation() {
        if heightOrLength == "Height"{
            setScale = heightScale
        } else {
            setScale = lengthScale
        }
        if humanOrLego == "LEGO" {
            theScale = 1 / setScale
            rounding = "%.0f"
        } else {
            theScale = setScale
            rounding = "%.1f"
        }
        let theInput = textInput.text!
        theOutput = theScale * Double(theInput)!
    }
    
    @IBAction func scalorChange(_ sender: UIButton) {
        textInput.endEditing(true)
        heightButton.isSelected = true
        lengthButton.isSelected = false
        sender.isSelected = true
        
        if sender.currentTitle == "Height" {
            bricksOrStuds = "studs"
            heightButton.isSelected = true
            lengthButton.isSelected = false
            heightOrLength = sender.currentTitle!
            if humanOrLego == "Human" {
                whatScalingLabel.text = "Bricks:"
            }
        } else if sender.currentTitle == "Length" {
            bricksOrStuds = "bricks"
            lengthButton.isSelected = true
            heightButton.isSelected = false
            heightOrLength = sender.currentTitle!
            if humanOrLego == "Human" {
                whatScalingLabel.text = "Studs:"
            }
        }
    }
    
    @IBAction func scaleChange(_ sender: UIButton) {
        textInput.endEditing(true)
        legoScale.isSelected = true
        humanScale.isSelected = false
        sender.isSelected = true
        
        if sender.currentTitle == "LEGO" {
            legoScale.isSelected = true
            humanScale.isSelected = false
            humanOrLego = sender.currentTitle!
            whatScalingLabel.text = "Meters:"
        } else if sender.currentTitle == "Human" {
            humanScale.isSelected = true
            legoScale.isSelected = false
            humanOrLego = sender.currentTitle!
            if bricksOrStuds == "bricks" {
                whatScalingLabel.text = "Bricks:"
            } else if bricksOrStuds == "studs" {
                whatScalingLabel.text = "Studs:"
            }
        }
        
    }
    
    @IBAction func calculateIt(_ sender: UIButton) {
        calculation()
        outputUpdater()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

