//
//  TitleView.swift
//  hangman
//
//  Created by julie ryan on 08/07/2024.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Trouver le mot mystère sélectionné dans la liste de gauche.").padding().foregroundStyle(.colorText)
        }
    }
}

#Preview {
    TitleView()
}
