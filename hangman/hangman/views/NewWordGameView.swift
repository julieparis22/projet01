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
        
        // supprimer ce HSTACK a terme
        
        
        
        // FIN HSTACK test
        
        Button("Nouvelle partie") {
            game.refresh()
        }
    }
}

#Preview {
    NewWordGameView(game: .constant(Game()))
}




/*HStack {
 ForEach(game.word, id: \.self) { letter in
          Text(letter)
         .padding().multilineTextAlignment(.leading)
 }
}*/
