//
//  Flashcards.swift
//  stateCapitalsQuiz
//
//  Created by iD Student on 7/18/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    var options: [String]
    var correctAnswer : String
    
    init( question: String, options: [String] ) {
        self.question = question
        self.options = options
    
        self.correctAnswer = options[0]
    }
}



class CardCollection {
    
    public static var instance : CardCollection = CardCollection()
    
    public private(set) var cards : [Flashcard]
    
    public private(set) var currentIndex : Int
    
    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    
    private init() {
        cards = [ Flashcard(question: "What is the capital of California?", options: ["Phoenix", "Dover", "Sacramento", "Atlanta"]) ,
                  Flashcard(question: "What is the capital of Virginia?", options: ["Charleston", "Montpelier", "Cheyenne", "Richmond"]) ,
                  Flashcard(question: "What is the capital of Rhode Island?", options: ["Providence", "Hartford", "Columbus", "Madison"]) ,
                  Flashcard(question: "What is the capital of Illinois?", options: ["Tallahassee", "Springfield", "Lansing", "Carson City"]) ,
                  Flashcard(question: "What is the capital of Texas?", options: ["Austin", "Santa Fe", "Saint Paul", "Nashville"]) ,
                  Flashcard(question: "What is the capital of New Hampshire?", options: ["Montpelier", "Albany", "Harrisburg", "Concord"])
            ]
        
        currentIndex = 0
    }
    
    
    public func nextQuestion() {
        currentIndex += 1
        if (currentIndex >= cards.count) {
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
        
    }

}
