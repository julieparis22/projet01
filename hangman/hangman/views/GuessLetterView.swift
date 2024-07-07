//
//  TestLetterView.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import SwiftUI

struct GuessLetterView: View {
    @Binding var game: Game
    @Binding  var character : InputCharacter
    var body: some View {
        HStack {
            ForEach( game.testLetter(word: game.word , letter: character.letter), id: \.self) { number in
                Text(" test boucle \(game.word[number])") .onTapGesture {
                    // Mise à jour de testedLetters avec character.letter à l'indice number
                    game.testedLetters[number] = character.letter
                }
            //    game.testedLetters.append(number)
                
              //  Text(" test boucle \(game.word[number])")
                
            }
        }
    }
}

#Preview {
    GuessLetterView(game: .constant(Game()), character: .constant(InputCharacter()))
}
