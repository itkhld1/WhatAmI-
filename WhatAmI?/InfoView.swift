//
//  InfoView.swift
//  WhatAmI?
//
//  Created by itkhld on 25.01.2025.
//

import SwiftUI

struct InfoView: View {
    
    @State private var isBackgroundAnimating = false
    
    @State private var tabSelection = 1
    
    var body: some View {
        ZStack {
            Color("q1").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 140) {
                    Info1()
                    Info2()
                    Info3()
                }
                .padding(.top, 10)
            }
            
//            TabView(selection: $tabSelection,
//                    content:  {
//                Info1()
//                Info2()
//                Info3()
//            })
//            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct Info1: View {
    var body: some View {
        ZStack {
            Color("q1")
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Image("6anime")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(60)
                    .shadow(color: .purple, radius: 10)
                    .padding(.bottom, 300)
                
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
                    .padding(.leading, 300)
                    .padding(.top, 700)
            }
            
            VStack(spacing: 50) {
                Text("Welcome!")
                    .font(.custom("Sabien", size: 50))
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
                
                Text("Guess the word your team describes, acts out or explains.")
                    .font(.custom("Sabien", size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
            }
            .padding()
            .padding(.top, 300)
        }
    }
}

struct Info2: View {
    var body: some View {
        ZStack {
            Color("q1")
                .ignoresSafeArea()
            
            ZStack {
                Image("3anime")
                    .resizable()
                    .frame(width: 170, height: 250)
                    .shadow(color: .purple, radius: 10)
                    .padding(.bottom, 300)
            }
            
            VStack(spacing: 50) {
                Text("How to Play!")
                    .font(.custom("Sabien", size: 50))
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
                
                Text("Place the phone on your head, guess the words.")
                    .font(.custom("Sabien", size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
                
                Text("Tilt forward for correct answers, or backward to pass.")
                    .font(.custom("Sabien", size: 20))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
            }
            .padding()
            .padding(.top, 300)
        }
    }
}

struct Info3: View {
    
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("q1")
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Image("friendsAnime")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(60)
                    .shadow(color: .purple, radius: 10)
                    .padding(.bottom, 400)
            }
            
            VStack(spacing: 50) {
                Text("Let's Start!")
                    .font(.custom("Sabien", size: 50))
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
                
                Text("Decide teams, select a category, and enjoy the fun!")
                    .font(.custom("Sabien", size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 1, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
                
                Button(action: {
                    dismiss()
                    SoundManagerWav.shared.playSound(named: "click2")
                }, label: {
                    Text("Continue")
                        .font(.custom("Sabien", size: 20))
                        .padding()
                        .background(Color("q2"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(color: .purple, radius: 1, y: 3)
                        .shadow(color: .black, radius: 1, y: 4)
                })
            }
            .padding()
            .padding(.top, 200)
            
            ZStack {
                HStack {
                    Text("***Made With ❤︎ By***")
                    Text("***[Khaled Samim](https://github.com/itkhld1)***")
                        .accentColor(.purple)
                }
                .foregroundColor(.gray)
                .font(.caption2)
            }
            .padding(.top, 650)
        }
    }
}

#Preview {
    InfoView()
}
