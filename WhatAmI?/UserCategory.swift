//
//  UserCategory.swift
//  WhatAmI?
//
//  Created by itkhld on 31.01.2025.
//

import SwiftUI

struct UserCategory: View {
    @Environment(\.dismiss) private var dismiss
    @State private var word: String = ""
    @State private var isBackgroundAnimating = false
    private let userCategoryKey = "userCategoryWords"
    
    @Binding var userWord: String  // Binding to the word entered in MainView
    @State private var wordInput: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: isBackgroundAnimating ? [Color("q1"), Color("q2"), Color("q3"), Color("q4")] : [Color("q4"), Color("q3"), Color("q2"), Color("q1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .animation(Animation.linear(duration: 5).repeatForever(autoreverses: true), value: isBackgroundAnimating)
                    .onAppear {
                        isBackgroundAnimating = true
                    }
                
                VStack(spacing: 40) {
                    VStack(spacing: 30) {
                        Text("Add New Words")
                            .font(.custom("Sabien", size: 30))
                        Text("Everything you add goes to Your Category")
                            .font(.custom("Sabien", size: 15))
                    }
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(color: .purple, radius: 2, y: 3)
                    .shadow(color: .black, radius: 1, y: 4)
                        
//                        TextField("write here...", text: $word)
//                            .font(.custom("Sabien", size: 20))
//                            .padding()
//                            .background(Color("q4"))
//                            .foregroundColor(.white)
//                            .cornerRadius(50)
//                            .shadow(color: .purple, radius: 1, y: 3)
//                            .shadow(color: .black, radius: 1, y: 4)
                    
                    TextField("write here...", text: $wordInput)
                        .font(.custom("Sabien", size: 20))
                        .padding()
                        .background(Color("q4"))
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .shadow(color: .purple, radius: 1, y: 3)
                        .shadow(color: .black, radius: 1, y: 4)
                    
                    VStack {
                        
                        Button(action: {
                            userWord = wordInput  // Update the userWord in MainView
                            UserDefaults.standard.set([userWord], forKey: "userCategoryWords")
                            dismiss()
                            SoundManagerWav.shared.playSound(named: "click2")
                        }, label: {
                            Text("Save")
                                .font(.custom("Sabien", size: 20))
                                .padding()
                                .background(Color("q1"))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(color: .purple, radius: 1, y: 3)
                                .shadow(color: .black, radius: 1, y: 4)
                        })
                        
//                        Button(action: {
//                            saveWordToUserCategory(word)
//                            dismiss()
//                        }, label: {
//                            Text("Save")
//                                .font(.custom("Sabien", size: 20))
//                                .padding()
//                                .background(Color("q1"))
//                                .foregroundColor(.white)
//                                .cornerRadius(20)
//                                .shadow(color: .purple, radius: 1, y: 3)
//                                .shadow(color: .black, radius: 1, y: 4)
//                        })
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("User Category")
                        .font(.custom("Sabien", size: 25))
                        .foregroundColor(.white)
                        .shadow(color: .purple, radius: 1, y: 3)
                        .shadow(color: .black, radius: 1, y: 4)
                }
                
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
    
    func saveWordToUserCategory(_ word: String) {
        var currentWords = loadUserCategoryWords()
        currentWords.append(word)
        UserDefaults.standard.set(currentWords, forKey: "userCategoryWords")
    }
    
    func loadUserCategoryWords() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "userCategoryWords") ?? []
    }
}

#Preview {
    UserCategory(userWord: .constant(""))
}
