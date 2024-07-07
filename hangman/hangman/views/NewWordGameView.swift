//
//  NewWordGameView.swift
//  hangman
//
//  Created by julie ryan on 06/07/2024.
//

import SwiftUI

struct NewWordGameView: View {
    @Binding var game: Game
    var body: some View {
        
        HStack {
            ForEach(game.word, id: \.self) { letter in
                     Text(letter)
                    .padding().multilineTextAlignment(.leading)
            }
        }
        
        Button("Nouveau mot") {
            game.refresh()
        }
    }
}

#Preview {
    NewWordGameView(game: .constant(Game()))
}




//@State private var character = InputCharacter()
//@State private var enteredLetter : String = ""
