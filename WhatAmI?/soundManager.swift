//
//  soundManager.swift
//  WhatAmI?
//
//  Created by itkhld on 19.02.2025.
//

import AVFoundation


class SoundManager {
    static let shared = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(named soundName: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}

class SoundManagerWav {
    static let shared = SoundManagerWav()
    var player: AVAudioPlayer?
    
    func playSound(named soundName: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error")
            }
        }
    }
}
