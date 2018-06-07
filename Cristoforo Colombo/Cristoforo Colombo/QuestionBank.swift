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
        
    
        
        
        list.append(Question(questionText: "I taxi a NewYork City sono verdi", answer: false))
        
        list.append(Question(questionText: "Il primo presidente degli Stati Uniti è stato Lincoln", answer: false))
        
        list.append(Question(questionText: "Questa bandiera è del Perú", answer: true))
        
        list.append(Question(questionText: "La capitale del Brasile è Rio de Janeiro", answer: false))
        
        list.append(Question(questionText: "Da Milano a NewYork ci sono 6 ore di differenza", answer: true))
        
        list.append(Question(questionText: "Obama è stato il presidente del Cile nel 2008", answer: false))
        
        list.append(Question(questionText: "Il Canada fa parte del Commonwealth", answer: true))
        
        list.append(Question(questionText: "La capitale del Messico è Città del Messico", answer: true))
        
        list.append(Question(questionText: "Il fiume più lungo dell'America è il Nilo", answer: true))
        
        list.append(Question(questionText: "La capitale del Canada è Toronto", answer: true))
        
        list.append(Question(questionText: "Il Brasile è il più vasto dell'America", answer: true))
        }
    
}
