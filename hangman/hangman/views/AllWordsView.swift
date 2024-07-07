//
//  AllWordsView.swift
//  hangman
//
//  Created by julie ryan on 07/07/2024.
//

import SwiftUI

struct AllWordsView: View {
    var body: some View {
       
        ScrollView {
            VStack() {
                ForEach(words, id: \.self) { word in
                        Text(word)
                    }
                }
        }
    }
}

#Preview {
    AllWordsView()
}
