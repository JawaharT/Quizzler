//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Jawahar Tunuguntla on 16/06/2018.
//

import Foundation
import UIKit

class QuestionBank{
    var list = [Question]()
    
    func add(question:String, answerToQuestion:Bool){
        list.append(Question(text: question, correctAnswer: answerToQuestion))
    }
    
    init(){
        add(question:"Valentine\'s day is banned in Saudi Arabia.", answerToQuestion:true)
        
        add(question:"A slug\'s blood is green.", answerToQuestion:true)
        
        add(question:"Approximately one quarter of human bones are in the feet.", answerToQuestion:true)
        
        add(question:"The total surface area of two human lungs is approximately 70 square metres.", answerToQuestion:true)
        
        add(question:"In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answerToQuestion:true)
        
        add(question:"In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answerToQuestion: false)
        
        add(question: "It is illegal to pee in the Ocean in Portugal.", answerToQuestion: true)
        
        add(question: "You can lead a cow down stairs but not up stairs.", answerToQuestion: false)
        
        add(question: "Google was originally called \"Backrub\".", answerToQuestion: true)
        
        add(question: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", answerToQuestion: true)
        
        add(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answerToQuestion: false)
        
        add(question: "No piece of square dry paper can be folded in half more than 7 times.", answerToQuestion: false)
        
        add(question: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", answerToQuestion: true)
        
        list = list.shuffled()
    }
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
