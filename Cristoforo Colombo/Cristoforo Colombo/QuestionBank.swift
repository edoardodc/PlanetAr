//
//  QuestionBank.swift
//  Cristoforo Colombo
//
//  Created by Owner on 07/06/18.
//  Copyright © 2018 Edoardo de Cal. All rights reserved.
//

import Foundation

class QuestionBank {
    var list  = [Question]()
    
    init() {
        
    
        
        
        list.append(Question(questionText: "A slug\'s blood is green.", answer: true))
        
        list.append(Question(questionText: "Approximately one quarter of human bones are in the feet.", answer: true))
        
        list.append(Question(questionText: "The total surface area of two human lungs is approximately 70 square metres.", answer: true))
        
        list.append(Question(questionText: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: true))
        
        list.append(Question(questionText: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: false))
        
        
        
        
    }
    
}
