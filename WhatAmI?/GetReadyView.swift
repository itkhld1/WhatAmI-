//
//  preView.swift
//  WhatAmI?
//
//  Created by itkhld on 27.01.2025.
//

import SwiftUI
import AVFoundation

struct GetReadyView: View {
    
    let selectedWord: String
    let gameTime: Int
    
    @State private var showMainView = false
    @State private var showInstruction = true
    @State private var showCountdown = false
    @State private var CurrentStep = 0
    @State private var fadeIn = false
      
    let countDownMessage = [
        "GET READY",
        "3",
        "2",
        "1",
    ]
    
    var body: some View {
        if showMainView {
            WordsView(selectedWord: selectedWord, gameTime: gameTime, category: Category.init(name: "", imageName: "", description: ""), categoryWords: ["" : [""]])
        } else if showInstruction {
            InstructionView {
                withAnimation {
                    showInstruction = false
                    showCountdown = true
                }
            }
        } else if showCountdown {
            ZStack {
                Color("q1").ignoresSafeArea()
                Text(countDownMessage[CurrentStep])
                    .font(.custom("Sabien", size: 60))
                    .foregroundColor(.white)
                    .frame(maxHeight: .infinity)
                    .multilineTextAlignment(.center)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
                    .rotationEffect(.degrees(90))
                    .opacity(fadeIn ? 1 : 0)
                    .animation(.easeInOut(duration: 0.8), value: fadeIn)
                    .padding()
            }
            .onAppear(perform: startCountDown) 
        }
    }
    
    private func startCountDown() {
        for index in countDownMessage.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1.0) {
                CurrentStep = index
                fadeIn = false
                
                if countDownMessage[index] == "3" {
                    SoundManager.shared.playSound(named: "countdown") // Play sound

                }
                
                if countDownMessage[index] == "3" || countDownMessage[index] == "2" || countDownMessage[index] == "1" {
                    triggerHapticFeedback()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    fadeIn = true
                }
                
                if index == countDownMessage.count - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        showMainView = true
                    }
                }
            }
        }
    }
    
    private func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
}

struct InstructionView: View {
    var onComplete: () -> Void
    
    var body: some View {
        ZStack {
            Color("q1").ignoresSafeArea()
            HStack {
                Text("Rotate & put the phone on your forehead")
                    .font(.custom("Sabien", size: 40))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
                    .rotationEffect(.degrees(90))
                    .padding()
            }
            .padding()
            
            Spacer()
            
            ZStack {
                Image(systemName: "rectangle.portrait.rotate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
            }
            .padding(.leading, 250)
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                onComplete()
            }
        }
    }
}

#Preview {
    GetReadyView(selectedWord: "", gameTime: 0)
}

