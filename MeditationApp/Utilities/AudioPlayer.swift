//
//  AudioPlayer.swift
//  MeditationApp
//
//  Created by Егор Шереметов on 01.12.2021.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Can't play sound file: \(sound).\(type)")
        }
    }
}
