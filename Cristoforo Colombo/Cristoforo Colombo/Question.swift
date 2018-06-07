//
//  Question.swift
//  Cristoforo Colombo
//
//  Created by Owner on 07/06/18.
//  Copyright © 2018 Edoardo de Cal. All rights reserved.
//

import Foundation

class Question {
    var questionText: String
    var answer: Bool
    
    
    init(questionText: String, answer: Bool) {
        self.questionText = questionText
        self.answer = answer
    }
    
}
