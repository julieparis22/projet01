//
//  TestLetterView.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//



import SwiftUI

struct GuessLetterView: View {
    @Binding var game: Game
    var limite : Int = 20


    @Binding var showAlert : Bool
    @State var indices: [Int] = []
    @Binding var win : Bool


    var body: some View {
        Text("Entrer votre lettre ")
        VStack {
            TextField("_", text: $game.inputCharacter.letter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(width: 60)
                .font(.system(size: 20))
                
            Text("Etes vous sur de votre choix ?")
            
            Button("Oui") {
                if !game.inputCharacter.letter.isEmpty {
                    game.letter = game.inputCharacter.letter
                    game.inputCharacter.resetLetter()
                }
                           
                indices = game.testLetter(word: game.word, letter: game.letter)
                           
                for index in indices {
                    game.matchingLetters[index] = game.word[index]
                }
                           
                game.updateGuessArray(with: indices)
                let result = game.testArray()
                game.updateGuess(testArray: result)
                
                win = !game.matchingLetters.contains("_")
                
                if game.guess >= game.life {
                    game.refresh()
                    showAlert = true 
                }
                
           
                           
                 
            }
            .padding()
            
           

            HStack {
                ForEach(game.matchingLetters.indices, id: \.self) { index in
                    Text("\(game.matchingLetters[index].isEmpty ? "" : game.matchingLetters[index])")
                }
            }
            
            Text("il vous reste : \(game.life - game.guess) vies").multilineTextAlignment(.center)
            Image("man\(game.life - game.guess)").resizable().scaledToFit().padding()
            
            
            
        }
    }
}

#Preview {
    //
    GuessLetterView(game: .constant(Game()), showAlert: .constant(false), win: .constant(false))
}


/* lien image <a href="https://www.flaticon.com/fr/icones-gratuites/jeu-du-pendu" title="jeu du pendu icônes">Jeu du pendu icônes créées par Icongeek26 - Flaticon</a>**/
