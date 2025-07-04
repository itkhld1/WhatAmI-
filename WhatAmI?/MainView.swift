//
//  MainView.swift
//  WhatAmI?
//
//  Created by itkhld on 25.01.2025.
//

import SwiftUI

struct MainView: View {
    
    @State private var ShowInfo = false
    @State private var showGameTimer = false
    @State private var selectedWord: String? = nil
    @State private var selectedCategoryName: String? = nil
    @State private var showUserCategory = false
    @State private var userWord: String = ""
    @State private var showEmptyCategoryAlert = false

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func loadUserCategoryWords() -> [String] {
        return UserDefaults.standard.stringArray(forKey: "userCategoryWords") ?? []
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("q4"), Color("q3"), Color("q2"), Color("q1")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        VStack {
                            ZStack {
                                Image("own")
                                    .resizable()
                                    .frame(width: 350, height: 199)
                                    .cornerRadius(20)
                                    .opacity(0.8)
                                    .padding(.bottom)
                                
                                Rectangle()
                                    .fill(Color.black)
                                    .frame(width: 350, height: 40)
                                    .opacity(0.4)
                                
                                Text("Create Your Own Category")
                                    .font(.custom("Sabien", size: 25))
                                    .foregroundColor(.white)
                                    .shadow(color: .purple, radius: 1, y: 3)
                                    .shadow(color: .black, radius: 1, y: 4)
                                
                                
                                ZStack {
                                    Button(action: {
                                        showUserCategory.toggle()
                                        SoundManagerWav.shared.playSound(named: "click2")
                                    }, label: {
                                        ZStack {
                                            Rectangle()
                                                .fill(Color("q1"))
                                                .frame(width: 240, height: 40)
                                                .opacity(0.7)
                                                .cornerRadius(20)
                                            
                                            Text("Create Now")
                                                .font(.custom("Sabien", size: 25))
                                                .foregroundColor(.white)
                                                .shadow(color: .purple, radius: 1, y: 3)
                                                .shadow(color: .black, radius: 1, y: 4)
                                        }
                                    })
                                    .fullScreenCover(isPresented: $showUserCategory, content: {
                                        UserCategory(userWord: $userWord)  // Passing the binding to UserCategory
                                    })
                                }
                                .padding(.top, 120)
                            }
                            
                            LazyVGrid(columns: columns, spacing: 30) {
                                ForEach(categories, id: \.name) { category in
                                    Button(action: {
                                        SoundManagerWav.shared.playSound(named: "click2")
                                        if category.name == "Your Category" {
                                            if userWord .isEmpty {
                                                showEmptyCategoryAlert = true
                                                SoundManager.shared.playSound(named: "error") // Play sound
                                            } else {
                                                selectedWord = userWord  // Use the user-entered word
                                                selectedCategoryName = category.name
                                                showGameTimer = true
                                            }
                                        } else if let words = categoryWords[category.name], !words.isEmpty {
                                            selectedWord = words.randomElement()
                                            selectedCategoryName = category.name
                                            showGameTimer = true
                                        }
                                    }, label: {
                                        ZStack {
                                            Image(category.imageName)
                                                .resizable()
                                                .frame(width: 150, height: 200)
                                                .cornerRadius(20)
                                                .opacity(0.8)
                                            
                                            Rectangle()
                                            .fill(Color.black)
                                            .frame(width: 150, height: 35)
                                            .opacity(0.4)
                                            
                                            Text(category.name)
                                                .font(.custom("Sabien", size: 20))
                                                .foregroundColor(.white)
                                                .shadow(color: .purple, radius: 1, y: 3)
                                                .shadow(color: .black, radius: 1, y: 4)
                                        }
                                    })
                                }
                                .shadow(radius: 10)
                            }
                        }
                    }
                }
                .toolbarBackground(.q1.opacity(0.8), for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Categories")
                            .font(.custom("Sabien", size: 30))
                            .foregroundColor(.white)
                            .shadow(color: .purple, radius: 1, y: 4)
                            .shadow(color: .black, radius: 1, y: 4)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            ShowInfo.toggle()
                            //SoundManager.shared.playSound(named: "click") // Play sound
                            SoundManagerWav.shared.playSound(named: "click2")
                        }, label: {
                            Image(systemName: "info.circle.fill")
                                .font(.custom("Sabien", size: 15))
                                .foregroundColor(.white)
                                .shadow(color: .purple, radius: 1, y: 3)
                                .shadow(color: .black, radius: 1, y: 4)
                        })
                        .sheet(isPresented: $ShowInfo, content: {
                            InfoView()
                        })
                    }
                }
                .navigationDestination(isPresented: $showGameTimer) {
                    if let selectedWord = selectedWord, let selectedCategory = categories.first(where: { $0.name == selectedCategoryName }) {
                        GameTimeView(categoryImageName: selectedCategory, selectedWord: selectedWord)
                            .navigationBarBackButtonHidden(true)
                    } else {
                        EmptyView()
                    }
                }
            }
            
            if showEmptyCategoryAlert {
                Color.black.opacity(0.8).ignoresSafeArea()
                    .blur(radius: 20)
                
                VStack(spacing: 20) {
                    Text("Error")
                        .font(.custom("Sabien", size: 35))
                        .foregroundColor(.white)
                        .shadow(color: .purple, radius: 1, y: 3)
                        .shadow(color: .black, radius: 1, y: 4)
                    
                    Text("To Use this Category, Please Add Words First")
                        .font(.custom("Sabien", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 300)
                        .shadow(color: .purple, radius: 1, y: 3)
                        .shadow(color: .black, radius: 1, y: 4)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack(spacing: 70) {
                        Button(action: {
                            showEmptyCategoryAlert = false
                            
                        }) {
                            Text("Cancel")
                                .font(.custom("Sabien", size: 20))
                                .padding()
                                .background(Color(.red).opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(color: .purple, radius: 1, y: 3)
                                .shadow(color: .black, radius: 1, y: 4)
                        }
                                                
                        Button(action: {
                            showUserCategory.toggle()
                            showEmptyCategoryAlert = false
                            SoundManagerWav.shared.playSound(named: "click2")
                        }) {
                            Text("Add")
                                .font(.custom("Sabien", size: 20))
                                .padding()
                                .background(Color("q2"))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(color: .purple, radius: 1, y: 3)
                                .shadow(color: .black, radius: 1, y: 4)
                        }
                    }
                    .frame(height: 100)
                }
                .padding()
                .background(Color("q1"))
                .cornerRadius(40)
                .shadow(radius: 30)
                .frame(width: 300, height: 300)
            }
        }
    }
}

#Preview {
    MainView()
}

