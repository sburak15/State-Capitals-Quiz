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
        cards = [ Flashcard(question: "What is the capital of California?", options: ["Sacramento", "Phoenix", "Dover", "Atlanta"]) ,
                  Flashcard(question: "What is the capital of Virginia?", options: ["Richmond", "Charleston", "Montpelier", "Cheyenne"]) ,
                  Flashcard(question: "What is the capital of Rhode Island?", options: ["Providence", "Hartford", "Columbus", "Madison"]) ,
                  Flashcard(question: "What is the capital of Illinois?", options: ["Springfield", "Tallahassee", "Lansing", "Carson City"]) ,
                  Flashcard(question: "What is the capital of Texas?", options: ["Austin", "Santa Fe", "Saint Paul", "Nashville"]) ,
                  Flashcard(question: "What is the capital of New Hampshire?", options: ["Concord", "Montpelier", "Albany", "Harrisburg"]),
                  Flashcard(question: "What is the capital of Vermont?", options: ["Montpelier", "Olympia", "Boston", "Jackson"]),
                  Flashcard(question: "What is the capital of Louisiana?", options: ["Baton Rouge", "Denver", "Boise", "Frankfort"]),
                  Flashcard(question: "What is the capital of Tennessee?", options: ["Nashville", "Pierre", "Columbia", "Topeka"]),
                  Flashcard(question: "What is the capital of New Jersey?", options: ["Trenton", "Raleigh", "Columbus", "Lincoln"]),
                  Flashcard(question: "What is the capital of Arkansas?", options: ["Little Rock", "Indianapolis", "Jefferson City", "Annapolis"]),
                  Flashcard(question: "What is the capital of Missouri?", options: ["Jefferson City", "Helena", "Honolulu", "Bismarck"]),
                  Flashcard(question: "What is the capital of South Carolina?", options: ["Columbia", "Salem", "Augusta", "Dover"]),
                  Flashcard(question: "What is the capital of New Mexico?", options: ["Santa Fe", "Des Moines", "Tallahassee", "Atlanta"]),
                  Flashcard(question: "What is the capital of Michigan?", options: ["Lansing", "Montgomery", "Pierre", "Madison"]),
                  Flashcard(question: "What is the capital of Massachusetts?", options: ["Boston", "Carson City", "Saint Paul", "Sacramento"]),
                  Flashcard(question: "What is the capital of Montana?", options: ["Helena", "Trenton", "Richmond", "Cheyenne"]),
                  Flashcard(question: "What is the capital of Alaska?", options: ["Juneau", "Charleston", "Albany", "Hartford"]),
                  Flashcard(question: "What is the capital of Indiana?", options: ["Indianapolis", "Springfield", "Montgomery", "Topeka"]),
                  Flashcard(question: "What is the capital of Oklahoma?", options: ["Oklahoma City", "Salem", "Columbus", "Lincoln"]),
                  Flashcard(question: "What is the capital of Oregon?", options: ["Salem", "Trenton", "Raleigh", "Bismarck"]),
                  Flashcard(question: "What is the capital of West Virginia?", options: ["Charleston", "Jackson", "Lansing", "Saint Paul"]),
                  Flashcard(question: "What is the capital of Ohio?", options: ["Columbus", "Columbia", "Jefferson City", "Atlanta"]),
                  Flashcard(question: "What is the capital of Alabama?", options: ["Montgomery", "Nashville", "Madison", "Cheyenne"]),
                  Flashcard(question: "What is the capital of Arizona?", options: ["Phoenix", "Austin", "Sacramento", "Charleston"]),
                  Flashcard(question: "What is the capital of Colorado?", options: ["Denver", "Hartford", "Harrisburg", "Pierre"]),
                  Flashcard(question: "What is the capital of Connecticut?", options: ["Hartford", "Baton Rouge", "Santa Fe", "Concord"]),
                  Flashcard(question: "What is the capital of Delaware?", options: ["Dover", "Salt Lake City", "Olympia", "Annapolis"]),
                  Flashcard(question: "What is the capital of Florida?", options: ["Tallahassee", "Helena", "Montpelier", "Augusta"]),
                  Flashcard(question: "What is the capital of Georgia?", options: ["Atlanta", "Des Moines", "Little Rock", "Phoenix"]),
                  Flashcard(question: "What is the capital of Hawaii?", options: ["Honolulu", "Providence", "Richmond", "Carson City"]),
                  Flashcard(question: "What is the capital of Idaho?", options: ["Boise", "Springfield", "Saint Paul", "Olympia"]),
                  Flashcard(question: "What is the capital of Iowa?", options: ["Des Moines", "Madison", "Nashville", "Austin"]),
                  Flashcard(question: "What is the capital of Kansas?", options: ["Topeka", "Carson City", "Montpelier", "Salem"]),
                  Flashcard(question: "What is the capital of Kentucky?", options: ["Frankfort", "Charleston", "Boston", "Montgomery"]),
                  Flashcard(question: "What is the capital of Maine?", options: ["Augusta", "Annapolis", "Trenton", "Concord"]),
                  Flashcard(question: "What is the capital of Maryland?", options: ["Annapolis", "Madison", "Salt Lake City", "Pierre"]),
                  Flashcard(question: "What is the capital of Minnesota?", options: ["Saint Paul", "Jackson", "Helena", "Providence"]),
                  Flashcard(question: "What is the capital of Mississippi?", options: ["Jackson", "Albany", "Trenton", "Lansing"]),
                  Flashcard(question: "What is the capital of Nebraska?", options: ["Lincoln", "Austin", "Juneau", "Dover"]),
                  Flashcard(question: "What is the capital of Nevada?", options: ["Carson City", "Pierre", "Cheyenne", "Tallahassee"]),
                  Flashcard(question: "What is the capital of New York?", options: ["Albany", "Columbia", "Richmond", "Columbus"]),
                  Flashcard(question: "What is the capital of North Carolina?", options: ["Raleigh", "Columbus", "Nashville", "Sacramento"]),
                  Flashcard(question: "What is the capital of North Dakota?", options: ["Bismarck", "Springfield", "Indianapolis", "Des Moines"]),
                  Flashcard(question: "What is the capital of Pennsylvania?", options: ["Harrisburg", "Salem", "Lansing", "Augusta"]),
                  Flashcard(question: "What is the capital of South Dakota?", options: ["Pierre", "Phoenix", "Little Rock", "Hartford"]),
                  Flashcard(question: "What is the capital of Utah?", options: ["Salt Lake City", "Trenton", "Topeka", "Frankfort"]),
                  Flashcard(question: "What is the capital of Washington?", options: ["Olympia", "Charleston", "Madison", "Cheyenne"]),
                  Flashcard(question: "What is the capital of Wisconsin?", options: ["Madison", "Santa Fe", "Concord", "Saint Paul"]),
                  Flashcard(question: "What is the capital of Wyoming?", options: ["Cheyenne", "Dover", "Boise", "Honolulu"]),
                  
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
