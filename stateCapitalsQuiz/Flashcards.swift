//
//  Flashcards.swift
//  stateCapitalsQuiz
//
//  Created by iD Student on 7/18/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation
import GameKit

class Flashcard {
    var question : String
    var options: [String]
    var correctAnswer : String
    
    init( question: String, options: [String] ) {
        self.question = question
        self.options = options
    
        self.correctAnswer = options[0]
        
        self.options = shuffle(list: options)
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
        cards = [ Flashcard(question: "What is the capital of California?", options:["Sacramento", "Phoenix", "Dover", "Atlanta"]) ,
                  Flashcard(question: "What is the capital of Virginia?", options: ["Richmond", "Charleston", "Montpelier", "Cheyenne"]) ,
                  Flashcard(question: "What is the capital of Rhode Island?", options: ["Providence", "Hartford", "Columbus", "Madison"]) ,
                  Flashcard(question: "What is the capital of Illinois?", options: ["Springfield", "Tallahassee", "Lansing", "Carson City"]) ,
                  Flashcard(question: "What is the capital of Texas?", options: ["Austin", "Santa Fe", "Saint Paul", "Nashville"]) ,
                  Flashcard(question: "What is the capital of New Hampshire?", options: ["Concord", "Montpelier", "Albany", "Harrisburg"])
            ]
        
        currentIndex = 0
        
        cards = shuffle(list: cards)
    }
    
    
    public func nextQuestion() {
        currentIndex += 1
        if (currentIndex >= cards.count) {
            currentIndex = 0
            cards = shuffle(list: cards)

        }
        
         currentCard.options = shuffle( list: currentCard.options)
    }
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
        
    }

}


func shuffle<T>(list : [T]) -> [T] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as! [T]
}
