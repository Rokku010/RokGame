//
//  AnswerButton.swift
//  RokGame
//
//  Created by Quốc Lộc on 25/05/2024.
//

import SwiftUI

struct AnswerButton: View {
    var number : Int
    
    var body: some View {
        Text("\(number)")
            .frame(width: 110,height: 110)
            .font(.system(size: 40,weight: .bold))
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding()
    }
}

#Preview {
    AnswerButton(number: 100)
}
