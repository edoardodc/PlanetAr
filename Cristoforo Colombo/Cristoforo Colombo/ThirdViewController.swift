import UIKit
import SAConfettiView

class ThirdViewController: UIViewController {
    
    //Place your instance variables here
    
    var allQuestion = QuestionBank()
    var answerPressed: Bool = false
    var questionNumber: Int = 0
    var score = 0
    var confettiView: SAConfettiView!
    var listaImmaginiQuiz = ["NewYork City", "Lincoln", "Peru", "Rio de Janeiro", "Orario", "Obama", "Commowealth", "Cittá del Messico", "Nilo", "Toronto", "Brasile", ""]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var buttonAvanti: UIButton!
    @IBOutlet weak var buttonVero: UIButton!
    @IBOutlet weak var buttonFalso: UIButton!
    @IBOutlet weak var quizView: UIView!
    @IBOutlet weak var qImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupBackgroundColor()
        scoreLabel.text = "Punti: \(score)"
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
        scoreLabel.text = "Punti: \(score)"
        progressLabel.animateBounce()
        buttonAvanti.animateBounce()
        self.confettiView.startConfetti()
    }
    
    
    func nextQuestion() {
        self.confettiView.stopConfetti()
        if questionNumber < 11 {
            questionNumber += 1
            questionLabel.text = allQuestion.list[questionNumber].questionText
            qImage.image = UIImage(named: listaImmaginiQuiz[questionNumber])
            print("Ciao")
            print(questionNumber)
        }
        
        if questionNumber == 11 {
            qImage.isHidden = true
            buttonVero.isHidden = true
            buttonFalso.isHidden = true

            questionLabel.text = "Complimenti hai completato il test! hai fatto \(score) punti!!"
            scoreLabel.animateBounceRepeat()
        }
    }
    
    
    func checkAnswer() {
        progressLabel.text = "Domanda numero \(questionNumber + 1)"
        if answerPressed == allQuestion.list[questionNumber].answer {
            updateUI()
            view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            scoreLabel.animateBounce()
            progressLabel.animateBounce()
            qImage.animateBounce()
        }else{
            quizView.shake()
            scoreLabel.shake()
            qImage.shake()
            progressLabel.shake()
            questionLabel.shake()
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
