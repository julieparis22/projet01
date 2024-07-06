//
//  DeleteAtTheEnd.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import SwiftUI

struct DeleteAtTheEnd: View {
    
    @State var game = Game()
    @State private var character = InputCharacter()
    @State private var enteredLetter: String = ""
    
    var body: some View {
        Text("TestView1DELETE_AT_END")
        
        TextField("Entrez une lettre", text: $character.letter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Envoyer") {
                enteredLetter = character.letter
                character.letter = "" // Réinitialise l'entrée après envoi
            }
            .padding()
            
            Text("Lettre entrée : \(enteredLetter)")
        
        
        ForEach(game.word, id: \.self) { letter in
                 Text(letter)
                     .padding()
             }
        
        Button("test bouton refresh") {
            game.refresh()
        }

        
        
        
    }
}

#Preview {
    DeleteAtTheEnd()
}
