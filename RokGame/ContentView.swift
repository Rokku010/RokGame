//
//  ContentView.swift
//  RokGame
//
//  Created by Quốc Lộc on 24/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        Text("WelCome to RokGame")
                            .font(.system(size: 60,weight: .bold,design: .default))
                            .foregroundColor(.red.opacity(0.8))
                            .padding(30)
                        Spacer()
                    }
                    
                    VStack(spacing:15, content: {
                        NavigationLink(destination: Backgroud()){
                            HStack{
                                Image("MATHs")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius:20))
                                    .padding()
                                Text("**GAME1**")
                                    .font(.system(size: 40))
                            }
                            .offset(x: -60, y: 0)
                        }
                        Spacer()
                        
                        NavigationLink(destination: ViewGame2()){
                            HStack{
                                Image("MATHs")
                                    .resizable()
                                    .frame(width: 100,height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding()
                                    
                                Text("**GAME2**")
                                    .font(.system(size: 40))
                            }
                            .offset(x: -60, y: 0)
                        }
                      Spacer()
                        
                        NavigationLink(destination: ViewGame3()){
                            HStack{
                                Image("MATHs")
                                    .resizable()
                                    .frame(width: 100,height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding()
                                Text("**GAME3**")
                                    .font(.system(size: 40))
                            }
                            .offset(x: -60, y: 0)
                        }
                        Spacer()
                    })
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
