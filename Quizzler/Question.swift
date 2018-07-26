//
//  File.swift
//  Quizzler
//
//  Created by Jawahar Tunuguntla on 16/06/2018.
//

import Foundation

class Question{
    
    let questionText: String
    let answer: Bool
    
    init(text:String, correctAnswer:Bool){
        questionText = text
        answer = correctAnswer
    }
}
