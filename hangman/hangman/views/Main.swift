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
        ZStack {
            Color.colorScreen.ignoresSafeArea(.all)
            VStack {
                NewSpacerView()
                TitleView()
                Spacer()
                HStack{
                    VStack {
                        GuessLetterView(game: $game, showAlert: $showAlert, win: $win)
                 
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        AllWordsView()
                    }
                }.padding()
                
                NewWordGameView(game: $game)
                NewSpacerView()
            }
            
            if showImageAlert {
                            Image("man10")
                             .resizable()
                             .scaledToFit()
                             .foregroundColor(.red)
                             .transition(.scale)
                             .zIndex(1) // S'assurer que l'image est au-dessus des autres vues
                     }
       
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
                         primaryButton: .default(Text("Oui bien sur")) {
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
        .onChange(of: showAlert) { newValue in
            if newValue {
                showImageAlert = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showImageAlert = false
                }
            }
        }
    }
}
