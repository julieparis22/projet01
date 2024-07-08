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
    @Binding var showImageLoose : Bool
    @Binding var showImageWin : Bool
    let sizeImage : CGFloat = UIScreen.main.bounds.height / 8
    
    @State var enteredLetter: String = ""


    var body: some View {
        Text("Entrer votre lettre ")
        VStack {
            //TextField("_", text: $game.inputCharacter.letter)
            
            TextField("_", text: $enteredLetter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(width: 60)
                .font(.system(size: 20))
                .onChange(of: enteredLetter) { oldValue, newValue in
                    if newValue.count > 1 {
                        enteredLetter = String(newValue.prefix(1)).uppercased()
                    } else {
                        enteredLetter = newValue.uppercased()
                    }
                }
                     
                
            Text("Etes vous sur de votre choix ?")
            
            Button("Oui") {
                
                if enteredLetter.isEmpty {
                                  return // Ne rien faire si aucune lettre n'est saisie
                              }
                
                game.letter = enteredLetter
                game.inputCharacter.resetLetter()
                enteredLetter = ""
                
                
                
            
                
                           
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
                
           
                           
                 
            }.foregroundStyle(.colorButton).font(.largeTitle)
            .padding()
            
           

            HStack {
                ForEach(game.matchingLetters.indices, id: \.self) { index in
                    Text("\(game.matchingLetters[index].isEmpty ? "" : game.matchingLetters[index])")
                }
            }
            
            Text("il vous reste : \(game.life - game.guess) vies").multilineTextAlignment(.center)
          
            if showImageLoose {
                Image("man0").resizable().scaledToFit().padding().frame(height: sizeImage)
            } else if (showImageWin == true && showImageLoose == false) {
                Image("coupe").resizable().scaledToFit().padding().frame(height: sizeImage)
            }
            else {
                Image("man\(game.life - game.guess)").resizable().scaledToFit().padding().frame(height: sizeImage)
            }
            
            
            
        }
    }
}

#Preview {
    //
    GuessLetterView(game: .constant(Game()), showAlert: .constant(false), win: .constant(false), showImageLoose: .constant(false), showImageWin: .constant(false))
}


/* lien image <a href="https://www.flaticon.com/fr/icones-gratuites/jeu-du-pendu" title="jeu du pendu icônes">Jeu du pendu icônes créées par Icongeek26 - Flaticon</a>**/

/*      TextField("_", text: Binding(
 get: {
     game.inputCharacter.letter.prefix(1).uppercased()
 },
 set: { newValue in
     game.inputCharacter.letter = String(newValue.prefix(1)).uppercased()
 }
)) {
 game.inputCharacter.letter
}
.textFieldStyle(RoundedBorderTextFieldStyle())
.padding()
.frame(width: 60)
.font(.system(size: 20))
 **/
