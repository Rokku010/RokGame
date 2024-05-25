//
//  Splash.swift
//  RokGame
//
//  Created by Quốc Lộc on 24/05/2024.
//

import SwiftUI

struct Splash: View {
    @State private var isActive = false
    var body: some View {
        VStack{
            if isActive{
                Onboarding()
            }else{
                ZStack{
                    Image("bg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("**WelCome**")
                            .font(.system(size: 80,weight: .bold,design: .default))
                            .foregroundColor(.blue)
                            .padding(70)
                        Spacer()
                    }
                    VStack{
                        Text("**RokGame**")
                            .font(.system(size: 80,weight: .bold,design: .default))
                            .foregroundColor(Color.orange.opacity(1))
                       
                    }
                }
            }
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                withAnimation{isActive = true}
            }
        }
    }
}

#Preview {
    Splash()
}
