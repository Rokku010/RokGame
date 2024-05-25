//
//  Backgroud.swift
//  RokGame
//
//  Created by Quốc Lộc on 25/05/2024.
//

import SwiftUI

struct Backgroud: View {
    @State private var correctAnswers = 0
    @State private var choiceArray : [Int] = [0,1,2,3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var difficulty = 100
    @State private var score = 0
    
    var body: some View {
        VStack{
            Text("\(firstNumber) + \(secondNumber)")
                .font(.system(size: 50,weight: .bold,design: .default))
                .bold()
                .padding(50)
            HStack{
                ForEach(0..<2){ index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            HStack{
                ForEach(2..<4){ index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            Text("Score: \(score)")
                .font(.system(size: 40,weight: .bold,design: .default))
                
            Spacer()
            
            // button Reset
            Button(action:{
                self.score = 0
            }){
                VStack{
                    Text("Reset")
                        .font(.system(size: 50))
                        .bold()
                        .padding()
                        .background(Color.red.opacity(0.6))
                        .cornerRadius(12)
                }
                
            }
        }
        .onAppear(perform: {
            generateAnswers()
        })
    }
    
    func answerIsCorrect(answer: Int){
        let isCorrect = answer == correctAnswers ? true : false
        
        if isCorrect{
            self.score += 1
        }else{
            self.score -= 1
        }
    }
    
    func generateAnswers(){
        firstNumber = Int.random(in: 0...(difficulty/3))
        secondNumber = Int.random(in: 0...(difficulty/3))
        var answerList = [Int]()
        
        correctAnswers = firstNumber + secondNumber
        
        for _ in 0...4{
            answerList.append(Int.random(in: 0...difficulty))
        }
        
        answerList.append(correctAnswers)
        
        choiceArray = answerList.shuffled()
    }
}

#Preview {
    Backgroud()
}
