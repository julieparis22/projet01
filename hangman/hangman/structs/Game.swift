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
    
    var hangmanWord = HangmanWord()
    var word :  [String] = HangmanWord().wordInArray
    var testedLetters : [String] = ["","","","","",]
    var matchingLetters: [String] = Array(repeating: "", count: HangmanWord().wordInArray.count)
  
    //   var matchingLetters : [String] = ["","","","","",]
  
 //   var enteredLetter: String = ""
    var letter = InputCharacter().letter
    
    mutating func refresh(){
        self.word = hangmanWord.refreshWord()
        self.testedLetters =  ["","","","","",]
        self.guess = 0
        self.inputCharacter = InputCharacter()
        }
    //        TextField("Entrez une lettre", text: $character.letter)
    // enteredLetter = character.letter
    //  character.letter = ""
    mutating func changeLetter(characterLetter : String){
        self.letter = characterLetter
       }
    
    func testLetter(word: [String], letter: String) -> [Int] {
        
        return word.indices.filter { word[$0] == letter }
       
       }
  
    
    
}


