//
//  SplashScreen.swift
//  hangman
//
//  Created by julie ryan on 08/07/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State var showSplashcreen = true
    var body: some View {
        if showSplashcreen {
            ZStack {
                Color.colorScreen.ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Text("HANGMAN").foregroundStyle(.colorText).font(.title).padding()
                    Spacer()
                    Image("splash").resizable().scaledToFill().padding()
                    Spacer()
                    Text("Découvriras-tu le mot mystère ?").foregroundStyle(.colorText).padding()
                    Spacer()
                    Button("Je ne veux plus attendre") {
                        showSplashcreen = false
                    }.foregroundStyle(.colorButton).padding()
                    Spacer()
                }
            }
         
         .onAppear {
                          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                              showSplashcreen = false
                          }
                      }

        }else {
            Main()
        }
    }
}

#Preview {
    SplashScreen()
}
