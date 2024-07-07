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

        @State var indices: [Int] = []

        var body: some View {
            VStack {
                Button("Tester la lettre") {
                    indices = game.testLetter(word: game.word, letter: character.letter)
                    
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
                        Text("Matching Letter Index test \(index): \(game.matchingLetters[index])")
                    }
                }
            }
        }
    }

    #Preview {
        GuessLetterView(game: .constant(Game()), character: .constant(InputCharacter()))
    }
/*        // Affichage des indices
 VStack {
     Text("Indices trouvés:")
     ForEach(indices, id: \.self) { index in
         Text("\(index)")
     }
 }

HStack {
ForEach(indices, id: \.self) { number in
 Button(action: {
     game.testedLetters[number] = game.word[number]
 }) {
     Label {
         VStack {
             Text("Lettre commune: \(game.word[number])")
             Text("Indice: \(number)")
         }
     } icon: {
         Image(systemName: "character")
     }
 }
 .buttonStyle(DefaultButtonStyle())
}
}**/
