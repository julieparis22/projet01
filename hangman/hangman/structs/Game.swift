//
//  Game.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import Foundation
struct Game : Identifiable{
    


   
    var id = UUID()
    
    var hangmanWord = HangmanWord()
    var word :  [String] = HangmanWord().wordInArray

    var matchingLetters: [String] = Array(repeating: "_", count: HangmanWord().wordInArray.count)
    var inputCharacter: InputCharacter = InputCharacter()
    
    
    var guess : Int = 0
    var guessArray: [Bool] = Array(repeating: true, count: HangmanWord().wordInArray.count) // true
    let life : Int = 10


    var letter = InputCharacter().letter
    
    mutating func refresh(){
        inputCharacter.resetLetter()
        self.word = hangmanWord.refreshWord()
        self.matchingLetters = Array(repeating: "_", count: word.count)
        self.guess = 0
        self.inputCharacter = InputCharacter()
        self.guessArray = Array(repeating: true, count: HangmanWord().wordInArray.count)
        inputCharacter.resetLetter()
        letter = ""
        }
    
 

    mutating func changeLetter(characterLetter : String){
        self.letter = characterLetter
       }
    
    func testLetter(word: [String], letter: String) -> [Int] {
        
        return word.indices.filter { word[$0] == letter }
       
       }
    
    mutating func updateGuessArray(with indices: [Int]) {
          for i in 0 ..< guessArray.count {
              if indices.contains(i) {
                  guessArray[i] = true
              } else {
                  guessArray[i] = false
              }
          }
      }
    
    func testArray() -> Int {
         for index in 0..<guessArray.count {
             if guessArray[index] {
                 return 0 // Retourne 0 si au moins un élément est true
             }
         }
         return 1 // Retourne 1 si aucun élément n'est true
     }
    
    mutating func updateGuess(testArray : Int) {
        guess = guess + testArray
        
    }
 
    
 
    
}


