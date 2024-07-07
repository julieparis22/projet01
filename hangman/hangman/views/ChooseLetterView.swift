//
//  ChooseLetterView.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import SwiftUI

struct ChooseLetterView: View {
    @Binding var game: Game
    @Binding  var character : InputCharacter
    @Binding var enteredLetter : String

    var body: some View {
        
        TextField("Entrez une lettre", text: $character.letter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            
        Button("Envoyer") {
                  if !character.letter.isEmpty {
                      game.letter = character.letter
                      character.letter = ""
                      character = InputCharacter(inputLetter: "")
                  }
              }
              .padding()
      
             
         Text("Lettre entrée : \(game.letter)")
        }
    }


#Preview {
    ChooseLetterView(game: .constant(Game()), character: .constant(InputCharacter()), enteredLetter: .constant(""))
}

