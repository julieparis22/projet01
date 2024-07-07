//
//  TestLetterView.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//



import SwiftUI

struct GuessLetterView: View {
    @Binding var game: Game


    @State var indices: [Int] = []


    var body: some View {
        VStack {
            TextField("Entrez une lettre", text: $game.inputCharacter.letter)
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
                
           
                           
                 
            }
            .padding()
            
            Text("il vous reste : \(game.life - game.guess) vies")
            
            // Affichage des lettres correspondantes
            HStack {
                ForEach(game.matchingLetters.indices, id: \.self) { index in
                    Text("\(game.matchingLetters[index].isEmpty ? "" : game.matchingLetters[index])")
                }
            }
        }
    }
}

#Preview {
    //
    GuessLetterView(game: .constant(Game()))
}

