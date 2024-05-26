//
//  GameViewModel.swift
//  RokGame
//
//  Created by Quốc Lộc on 26/05/2024.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject{
    let boardSize = 3
    @Published public var board: [[Player?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    
    @Published private var currentPlayer: Player = .naught
    
    @Published var computerWins = 0
    @Published var PlayerWins = 0
    
    func makeMove(row: Int, column: Int){
        guard board[row][column] == nil else { return}
        
        board[row][column] = currentPlayer
        
        if checkWin(player: currentPlayer){
            if currentPlayer == .cross {
                computerWins += 1
            } else{
                PlayerWins += 1
            }
            
            let winner = currentPlayer.rawValue
            let message =  "\(winner) wins"
            
            DispatchQueue.main.async {
                //create an alert
                self.showAlert(title: "Game over", message: message )
            }
        }else if checkDraw(){
            DispatchQueue.main.async {
                self.showAlert(title: "Game Over", message: "It`s a draw")
            }
        } else{
            currentPlayer = (currentPlayer == .naught) ? .cross : .naught
            if currentPlayer == .cross {
                makeComputerMove()
            }
        }
    }
    
    private func findWinningMove(player: Player)-> (row: Int, column: Int)?{
        for row in 0..<boardSize{
            var count = 0
            var emtyColumn: Int?
            for column in 0..<boardSize{
                if board[row][column] == player{
                    count += 1
                }else if board[row][column] == nil {
                    emtyColumn = column
                }
            }
            
            if count == boardSize - 1, let column = emtyColumn{
                return (row,column)
            }
        }
        
        for column in 0..<boardSize{
            var count = 0
            var emptyRow: Int?
            for row in 0..<boardSize{
                if board[row][column] == player{
                    count += 1
                } else if board[row][column] == nil {
                    emptyRow = row
                }
            }
            
            if count == boardSize - 1, let row = emptyRow{
                return (row ,column)
            }
        }
         
        var count = 0
        var emptyRow: Int?
        var emptyColumn: Int?
        for i in 0..<boardSize{
            if board[i][i] == player{
                count += 1
            }else if board[i][i] == nil{
                emptyRow = i
                emptyColumn = i
            }
        }
        
        if count == boardSize - 1, let row = emptyRow, let column = emptyColumn{
            return (row,column)
        }
        
        count = 0
        emptyRow = nil
        emptyColumn = nil
        for i in 0..<boardSize{
            if board[i][boardSize - 1 - i] == player{
                count += 1
            }else if board[i][boardSize - 1 - i] == nil{
                emptyRow = i
                emptyColumn = boardSize - 1 - i
            }
        }
        
        if count == boardSize - 1, let row = emptyRow, let column = emptyColumn{
            return (row,column)
        }
        return nil
    }
    
    func makeComputerMove(){
        if let winningMove = findWinningMove(player: .cross) {
            makeMove(row: winningMove.row, column: winningMove.column)
            return
        }
        
        if let blockingMove = findWinningMove(player: .naught){
            makeMove(row: blockingMove.row, column: blockingMove.column)
            return
        }
        
        var avaliableSpots:[(Int,Int)] = []

        for row in 0..<boardSize{
            for column in 0..<boardSize{
                if board[row][column] == nil{
                    avaliableSpots.append((row,column))
                   
                }
            }
        }
        if let randomSpot = avaliableSpots.randomElement(){
            makeMove(row: randomSpot.0, column: randomSpot.1)
        }
    }
    
    private func checkDraw() -> Bool{
        for row in 0..<boardSize {
            for column in 0..<boardSize{
                if board[row][column]  == nil {
                    return false
                }
            }
        }
        return true
    }
    
    public func resetGame(){
        board = Array(repeating: Array(repeating: nil, count: 3), count: 3)
        currentPlayer = .naught
    }
    
    private func showAlert(title: String, message: String){
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else{
            return
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { _ in
            // add resetGame functionality later
        }  ))
        
        window.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func checkWin(player: Player)-> Bool{
        for i in 0..<boardSize{
            if board[i][0] == player && board[i][1] == player && board[i][2] == player {
                return true
            }
            if board[0][i] == player && board[1][i] == player && board[2][i] == player{
                return true
            }
        }
            
            if board[0][0] == player && board[1][1] == player && board[2][2] == player{
                return true
            }
            
            if board[2][0] == player && board[1][1] == player && board[0][2] == player {
                return true
            }
            return false
        }
    
}
