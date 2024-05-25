//
//  Onboarding.swift
//  RokGame
//
//  Created by Quốc Lộc on 24/05/2024.
//

import SwiftUI

struct Onboarding: View {
    @State private var isActive = false
    
    @State private var isExpanded = false
    
    @State private var offset = CGSize.zero
    
    var body: some View {
        if isActive{
            ContentView()
        }else{
            ZStack{
                VStack{
                    Spacer()
                    Circle()
                        .fill(
                            RadialGradient(colors: [.blue,.clear,.clear,.clear], center: .center, startRadius: 0, endRadius: UIScreen.main.bounds.width)
                        )
                        .scaleEffect(isExpanded ? 20 : 2)
                        .padding(.bottom, -(UIScreen.main.bounds.width / 1.3))
                }
                .frame(maxHeight: .infinity)
                .zIndex(isExpanded ? 2 : 0)
                
                VStack(spacing: 15, content: {
                    
                    Spacer()
                    VStack{
                        Text("**WelCome**")
                            .font(.system(size: 70,weight: .bold,design: .default))
                            .foregroundColor(.blue)
                            .padding(25)
                        Spacer()
                    }
                    VStack{
                        Text("**RokGame**")
                            .font(.system(size: 80,weight: .bold,design: .default))
                            .foregroundColor(Color.orange.opacity(1))
                            .padding(.top,-50)
                        Spacer()
                    }
                    VStack{
                        Image(systemName: "chevron.up")
                        Text("**Start**")
                            .font(.system(size: 50))
                            .padding(.top)
                            
                    }
                    .fontWeight(.medium)
                })
                
                .opacity(isExpanded ? 0 : 1)
                .offset(offset)
            }
            
            // scrolll up
            .gesture(DragGesture()
                .onEnded{ value in
                    if value.translation.height < 50 {
                        withAnimation(.easeInOut(duration: 1)){
                            offset = value.translation
                            isExpanded = true
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            isActive = true
                        }
                    }
                })
            .padding()
            .frame(maxWidth: .infinity)
            .background(
            Image("bg")
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fit)
                .scaledToFill()
                .ignoresSafeArea()
                .preferredColorScheme(.light)
                     )
        }
    }
}
    #Preview {
        Onboarding()
    }
