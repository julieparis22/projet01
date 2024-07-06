//
//  Game.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import Foundation
struct Game : Identifiable{
    
    
    var id = UUID()
    
    // commencer le jeux
    var guess : Int = 0
    
    var inputCharacter = InputCharacter()
    
    var word :  [String] = HangmanWord().wordInArray
    var hangmanWord = HangmanWord()
    
    
    mutating func refresh(){
        self.word = hangmanWord.refreshWord()
    }
    
    
    //   //   var indices = word.indices.filter { word[$0] == letter}
    
    
    
    
    
}
