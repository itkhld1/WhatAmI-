//
//  GameTime.swift
//  WhatAmI?
//
//  Created by itkhld on 26.01.2025.
//

import SwiftUI

struct GameTimeView: View {
    
    @State var seconds: Int = 15
    @State private var isBackgroundAnimating = false
    @Environment(\.dismiss) private var dismiss
    
    let durations = [15, 30, 45, 60, 75, 90, 105, 120]

    let categoryImageName: Category
    let selectedWord: String
    
    var body: some View {
        NavigationView {
            ZStack {
                //Color("BackgroundColor").ignoresSafeArea()
                LinearGradient(gradient: Gradient(colors: isBackgroundAnimating ? [Color("q1"), Color("q2"), Color("q3"), Color("q4")] : [Color("q4"), Color("q3"), Color("q2"), Color("q1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .animation(Animation.linear(duration: 5).repeatForever(autoreverses: true), value: isBackgroundAnimating)
                    .onAppear {
                        isBackgroundAnimating = true
                    }

                
                VStack(spacing: 10) {
                    ZStack {
                        Image(categoryImageName.imageName)
                            .resizable()
                            .frame(width: 190, height: 250)
                            .cornerRadius(20)
                            .opacity(0.9)
                        
                        Rectangle(
                        )
                        .fill(Color.black)
                        .frame(width: 190, height: 35)
                        .opacity(0.4)
                        
                        Text(categoryImageName.name)
                            .font(.custom("Sabien", size: 25))
                            .foregroundColor(.white)
                            .shadow(color: .purple, radius: 1, y: 3)
                            .shadow(color: .black, radius: 1, y: 4)
                    }
                    .shadow(radius: 10)
                    
                    Text(categoryImageName.description)
                        .font(.custom("Sabien", size: 20))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 350, height: 70)
                        .shadow(color: .purple, radius: 1, y: 3)
                        .shadow(color: .black, radius: 1, y: 4)

                }
                .padding(.bottom, 300)
                
                VStack(spacing: 30) {
                    
                    Text("Game Time")
                        .font(.custom("Sabien", size: 30))
                        .foregroundColor(.white)
                        .shadow(color: .purple, radius: 1, y: 3)
                        .shadow(color: .black, radius: 1, y: 4)
                        .padding(.top, 300)
                    
                    Picker("", selection: $seconds) {
                        ForEach(durations, id: \.self) { i in
                            Text("\(i) sec").tag(i)
                                .font(.custom("Sabien", size: 25))
                                .foregroundColor(.white)
                                .shadow(color: .purple, radius: 1, y: 3)
                                .shadow(color: .black, radius: 1, y: 4)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 90)
                    
                    NavigationLink(destination: GetReadyView(selectedWord: selectedWord, gameTime: seconds)
                        .onAppear {
                            SoundManagerWav.shared.playSound(named: "click2")
                        }
                        .navigationBarBackButtonHidden(true)) {
                        Text("Continue")
                            .font(.custom("Sabien", size: 30))
                            .padding()
                            .background(Color("q1"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: .purple, radius: 1, y: 3)
                            .shadow(color: .black, radius: 1, y: 4)
                    }
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                        SoundManagerWav.shared.playSound(named: "click2")
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .font(.custom("Sabien", size: 15))
                        .foregroundColor(.white)
                        .shadow(color: .purple, radius: 1, y: 3)
                        .shadow(color: .black, radius: 1, y: 4)
                    })
                }
            }
        }
    }
}

//#Preview {
//    GameTimeView(categoryImageName: Category.init(name: "food", imageName: "food", description: "11"), selectedWord: "")
//}
