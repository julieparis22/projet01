//
//  HangmanWord.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import Foundation
struct HangmanWord {
    
    var word : String =  words[ Int.random(in: 0..<words.count)]
    
    var wordInArray : [String]
    
    
    init (){
        
        self.wordInArray = word.map { String($0) }
        
    }
    
    
    mutating func refreshWord()-> [String]{
        var res : [String] = []
        
      word =  words[ Int.random(in: 0..<words.count)]
      wordInArray = word.map { String($0) }
        res = word.map { String($0) }
        
        return res
      
        
    }
    
    
    
 
}
