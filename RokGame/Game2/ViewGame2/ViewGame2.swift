//
//  ViewGame2.swift
//  RokGame
//
//  Created by Quốc Lộc on 25/05/2024.
//

import SwiftUI

struct ViewGame2: View {
    @StateObject private var viewModel = GameViewModel()
    var body: some View {
        VStack{
            Text("SOLO CARO AI")
                .font(.system(size: 50,weight: .bold))
                .padding()
            
            VStack(spacing: 0){
                ForEach(0..<viewModel.boardSize,id: \.self){
                    row in
                    HStack{
                        ForEach(0..<viewModel.boardSize, id: \.self){ column in
                                Button(action: {
                                    // create a button for each cell on the board
                                    // Handle button tap by calling makeMove
                                    viewModel.makeMove(row: row, column: column)
                                    
                                }) {
                                    Text(viewModel.board[row][column]?.rawValue ?? "")
                                        .font(.system(size: 60,weight: .bold))
                                        .foregroundColor(viewModel.board[row][column] == .naught ? .red : .blue)
                                        .frame(width: 100,height: 100)
                                        .background(Color.gray.opacity(0.1))
                                        .border(Color.black)
                                }
                            }
                    }
                }
            }
            .padding()
            
            HStack{
                Spacer()
                
                VStack{
                    Text("AI Wins")
                        .font(.system(size: 30,weight: .bold))
                    Text("\(viewModel.computerWins)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer()
                VStack{
                    Text("Player Wins")
                        .font(.system(size: 30,weight: .bold))
                    Text("\(viewModel.PlayerWins)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding()
        }
        VStack{
            Button(action: {
                // Handel button tap calling the resetGame method
                viewModel.resetGame()
            }) {
                Text("reset")
                    .font(.system(size: 40,weight: .bold))
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
            }
            .padding()
        }
    }
}

#Preview {
    ViewGame2()
}
