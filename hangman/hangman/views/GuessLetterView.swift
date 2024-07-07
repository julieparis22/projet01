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
            
            
            
            TextField("Entrez une lettre", text: $character.letter)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                
        
            
            
            Button("Tester la lettre") {
                
                if !character.letter.isEmpty {
                    game.letter = character.letter
                    character.letter = ""
                    character = InputCharacter(inputLetter: "")
                }
                // Utiliser game.letter plutôt que character.letter
                indices = game.testLetter(word: game.word, letter: game.letter)
                
                for index in indices {
                    game.matchingLetters[index] = game.word[index]
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

/**   VStack {
 Text("Indices trouvés:")
 ForEach(indices, id: \.self) { index in
     Text("Indice: \(index) - Lettre: \(game.word[index])")
 }
}*/
