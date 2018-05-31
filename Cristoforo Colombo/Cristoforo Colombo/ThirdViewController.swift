//
//  SecondViewController.swift
//  Cristoforo Colombo
//
//  Created by Edoardo de Cal on 24/05/18.
//  Copyright © 2018 Edoardo de Cal. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var labelQuiz: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonA.setTitle("Risposta A", for: .normal)
        buttonB.setTitle("Risposta A", for: .normal)
        buttonC.setTitle("Risposta A", for: .normal)
    
        view.setupBackgroundColor()
        
        switch count {
        case 0:
            labelQuiz.text = "Chi è stato il primo presidente degli Stati Uniti?"
            buttonA.setTitle("Obama", for: .normal)
            buttonB.setTitle("Lincoln", for: .normal)
            buttonC.setTitle("Trump", for: .normal)
            

            
        break;
            
        default:
            break;
        }
        
    
        
    }
    
}


