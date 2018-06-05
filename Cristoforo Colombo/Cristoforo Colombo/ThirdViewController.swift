//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import SAConfettiView

class ThirdViewController: UIViewController {
    
    //Place your instance variables here
    
    var allQuestion = QuestionBank()
    var answerPressed: Bool = false
    var questionNumber: Int = 0
    var score = 0
    var confettiView: SAConfettiView!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var buttonAvanti: UIButton!
    @IBOutlet weak var buttonVero: UIButton!
    @IBOutlet weak var buttonFalso: UIButton!
    @IBOutlet weak var qImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupBackgroundColor()
        scoreLabel.text = "Punteggio: \(score)"
        progressLabel.text = "Domanda numero \(questionNumber + 1)"
        questionLabel.text = allQuestion.list[questionNumber].questionText
        buttonAvanti.isHidden = true
        
        self.confettiView = SAConfettiView(frame: self.view.frame)
        self.confettiView.type = .confetti
        self.view.addSubview(confettiView)
        confettiView.isUserInteractionEnabled = false

    }
    
    @IBAction func nextButton(_ sender: Any) {
        buttonAvanti.isHidden = true
        buttonVero.isHidden = false
        buttonFalso.isHidden = false
        nextQuestion()
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            answerPressed = true
        }else if sender.tag == 2 {
            answerPressed = false
        }
        buttonVero.isHidden = true
        buttonFalso.isHidden = true
        buttonAvanti.isHidden = false
        checkAnswer()
    }
    
    
    func updateUI() {
        score += 1
        scoreLabel.text = "Punteggio: \(score)"
        progressLabel.animateBounce()
        buttonAvanti.animateBounce()
        self.confettiView.startConfetti()
    }
    
    
    func nextQuestion() {
        self.confettiView.stopConfetti()
        if questionNumber < 12 {
            questionNumber += 1
            questionLabel.text = allQuestion.list[questionNumber].questionText
            print("Ciao")
            print(questionNumber)
        }else{
            startOver()
        }
    }
    
    
    func checkAnswer() {
        progressLabel.text = "Domanda numero \(questionNumber + 1)"
        if answerPressed == allQuestion.list[questionNumber].answer {
            updateUI()
            view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            ProgressHUD.showSuccess("Risposta giusta!!")
        }else{
            view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            ProgressHUD.showError("Ahia! Risposta sbagliata mi spiace!")
        }
    }
    
    
    func startOver() {
        questionLabel.text = "Quiz is over"
        questionNumber = 0
        score = 0
        progressLabel.text = "\(questionNumber)/13"
        scoreLabel.text = "\(score)"
        questionLabel.text = allQuestion.list[questionNumber].questionText
        
    }
    
    
    
}
