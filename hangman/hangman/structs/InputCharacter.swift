//
//  InputCharacter.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import Foundation
struct InputCharacter {
    var inputLetter: String = ""
        
        var letter: String {
            get {
                
                return inputLetter
            }
            set {
                inputLetter = String(newValue.prefix(1))
            }
        }
        

    mutating func resetLetter() {
          self.inputLetter = ""
         self.letter = ""
      }
    
    
    
    mutating func changeLetter(newLetter : String) -> String {
     
        self.letter = newLetter
        
        return self.letter
        
    }
    
}
