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
    @State private var showingAlert = false
    
    let sizeGuessArray = Game().guessArray.count



    var body: some View {
        VStack {

          GuessLetterView(game: $game)
       
            NewWordGameView(game: $game)
                
            }
        
        
    }
}

#Preview {
    Main()
}

