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
    
    @State var win: Bool = false
    @State private var showWinAlert = false
    @State var showImageAlert = false

    var body: some View {
        VStack {
            
            AllWordsView()
           
            GuessLetterView(game: $game, showAlert: $showAlert, win: $win)
            NewWordGameView(game: $game)

        }
        .alert(isPresented: Binding<Bool>(
                 get: {
                     showAlert || win
                 },
                 set: { _ in
                     showAlert = false
                     win = false
                 }
             )) {
                 if showAlert {
                     return Alert(
                         title: Text("Jeu Terminé"),
                         message: Text("Vous avez perdu. Voulez-vous recommencer ?"),
                         primaryButton: .default(Text("Oui")) {
                             game.refresh()
                         },
                         secondaryButton: .cancel(Text("Non"))
                     )
                 } else if win {
                     return Alert(
                         title: Text("Vous avez gagné !"),
                         message: Text("Félicitations ! Voulez-vous jouer encore ?"),
                         primaryButton: .default(Text("Oui")) {
                             game.refresh()
                         },
                         secondaryButton: .cancel(Text("Non"))
                     )
                 } else {
                     // Par défaut, retourner une alerte vide
                     return Alert(title: Text(""))
                 }
             }
    }
}



#Preview {
    Main()
}
/*

 **/
/**      //      NewWordGameView(game: $game)
 
 Button("Simuler la perte du jeu") {
     showAlert = true
 }
 .padding()
 
 Button("Simuler la victoire") {
     win = true
 }
 .padding()*/
