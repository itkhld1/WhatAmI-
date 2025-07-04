//
//  PlayAgain.swift
//  WhatAmI?
//
//  Created by itkhld on 28.01.2025.
//

import SwiftUI

struct PlayAgain: View {
    
    @State private var isBackgroundAnimating = false
    
    let previousWord: String
    //let onPlayAgain: () -> Void
    let onSelectNewCategory: () -> Void
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: isBackgroundAnimating ? [Color("q1"), Color("q2"), Color("q3"), Color("q4")] : [Color("q4"), Color("q3"), Color("q2"), Color("q1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: true), value: isBackgroundAnimating)
                .onAppear {
                    isBackgroundAnimating = true
                }
            
            VStack {
                ZStack {
                    
                    Color("q1")
                        .frame(width: 230, height: 300)
                        .cornerRadius(20)
                        .opacity(0.9)
                    
                    Image("star1")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .shadow(color: .black, radius: 10)
                        .opacity(0.9)
                }
                .shadow(radius: 20)
                .padding(.bottom, 100)
                
                VStack(spacing: 50) {
                    Button(action: {
                        onSelectNewCategory()
                        SoundManagerWav.shared.playSound(named: "click2")
                    }, label:  {
                        Text("Play Again")
                            .font(.custom("Sabien", size: 20))
                            .padding()
                            .background(Color("q1"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: .purple, radius: 1, y: 3)
                            .shadow(color: .black, radius: 1, y: 4)
                    })

                    Button(action: {
                        dismissToRoot()
                        SoundManagerWav.shared.playSound(named: "click2")
                    }, label: {
                        Text("Select New Category")
                            .font(.custom("Sabien", size: 20))
                            .padding()
                            .background(Color("q1"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: .purple, radius: 1, y: 3)
                            .shadow(color: .black, radius: 1, y: 4)
                    })
                }
            }
        }
    }
    private func dismissToRoot() {
        // This will dismiss all views back to root
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: MainView())
        }
    }
}


#Preview {
    PlayAgain(previousWord: "", onSelectNewCategory: {})
}

