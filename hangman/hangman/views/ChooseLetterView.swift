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
                      print("TextField réinitialisé à: \(character.letter)") 
                  }
              }
              .padding()
      
             
         Text("Lettre entrée : \(game.letter)")
        }
    }


#Preview {
    ChooseLetterView(game: .constant(Game()), character: .constant(InputCharacter()), enteredLetter: .constant(""))
}

/**        .onChange(of: character.letter) { newValue in
 if newValue.count > 1 {
     self.character.letter = String(newValue.prefix(1))
 }
}*/




      
/*
 
 TextField("Entrez une lettre", text: $character.letter)
              .padding()
              .onChange(of: character.letter) { newValue in
                            // Vérifier si le nouveau texte a plus d'une lettre et le réduire à une seule lettre si nécessaire
                            if newValue.count > 1 {
                                character.letter = String(newValue.prefix(1))
                            }
                        }
 
 **/
