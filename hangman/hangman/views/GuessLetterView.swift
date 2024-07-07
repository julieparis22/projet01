//
//  TestLetterView.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//



import SwiftUI

struct GuessLetterView: View {
    @Binding var game: Game
    @Binding var character: InputCharacter

    @State private var indices: [Int] = []

    var body: some View {
        VStack {
            Button("Tester la lettre") {
                // Utiliser game.letter plutôt que character.letter
                indices = game.testLetter(word: game.word, letter: game.letter)
                
                for index in indices {
                    game.matchingLetters[index] = game.word[index]
                }
            }
            
            // Affichage des indices
            VStack {
                Text("Indices trouvés:")
                ForEach(indices, id: \.self) { index in
                    Text("Indice: \(index) - Lettre: \(game.word[index])")
                }
            }
            
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
    GuessLetterView(game: .constant(Game()), character: .constant(InputCharacter()))
}

