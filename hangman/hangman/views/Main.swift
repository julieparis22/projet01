//
//  Main.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import SwiftUI

struct Main: View {
    @State var game = Game()
    @State var character = InputCharacter()
    @State var enteredLetter: String = ""
    @State private var showingAlert = false

    var body: some View {
        VStack {
            ChooseLetterView(game: $game, character: $character, enteredLetter: $enteredLetter)
          
            GuessLetterView(game: $game, character: $character)
            
            NewWordGameView(game: $game)
            
       
        }
        .padding()
    }
}

#Preview {
    Main()
}

/*     Button(action: {
 showingAlert = true
}) {
 Text("Vérifier les valeurs de matchingLetters")
}
.alert(isPresented: $showingAlert) {
 Alert(
     title: Text("Valeurs de matchingLetters"),
     message: Text(game.matchingLetters.joined(separator: ", ")),
     dismissButton: .default(Text("OK"))
 )
}**/
