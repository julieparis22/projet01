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
    @State var showAlert = false
    
    let sizeGuessArray = Game().guessArray.count



    var body: some View {
        VStack {

            
          GuessLetterView(game: $game, showAlert: $showAlert)
       
            NewWordGameView(game: $game)
                
            }   .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Jeu Terminé"),
                    message: Text(" Voulez-vous recommencer ?"),
                    primaryButton: .default(Text("Oui")) {
                        game.refresh()
                    },
                    secondaryButton: .cancel() // Pas de bouton "Non"
                )
            }
        
        
    }
}

#Preview {
    Main()
}

