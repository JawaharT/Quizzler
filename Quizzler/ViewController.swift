//
//  ViewController.swift
//  Quizzler
//
//  Created by Jawahar Tunuguntla
//

import UIKit

class ViewController: UIViewController {

    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var questionNumber:Int = 0
    var score:Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }else{
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    func updateUI() {
        progressLabel.text = String(questionNumber+1) + "/\(allQuestions.list.count)"
        scoreLabel.text = "Score: " + String(score)
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber+1)
    }
    
    func nextQuestion() {
        if questionNumber >= (allQuestions.list.count-1){
            let alert = UIAlertController(title: "All Questions completed.", message: "You got \(score/100)/\(allQuestions.list.count) correct with a final score of \(score). Want to start over?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(yesAction)
            present(alert, animated: true, completion: nil)
        }else{
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        updateUI()
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            ProgressHUD.showSuccess("Correct!")
            score += 100
        }else{
            ProgressHUD.showError("Wrong!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
    }
}
