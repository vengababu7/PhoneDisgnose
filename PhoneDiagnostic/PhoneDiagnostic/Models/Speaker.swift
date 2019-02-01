//
//  Speaker.swift
//  PhoneDiagnostic
//
//  Created by Vengababu Maparthi on 01/02/19.
//  Copyright © 2019 Vengababu Maparthi. All rights reserved.
//

import AVFoundation

class Speaker {
    var player: AVAudioPlayer?
    
    
    func playSound(onCompletion:@escaping(Bool)->()) {
        guard let url = Bundle.main.url(forResource: "alarm_beep_1", withExtension: "mp3") else {
            print("error")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else {
                onCompletion(false)
                return
            }
            player.play()
            onCompletion(true)
        } catch let error {
            onCompletion(false)
            print(error.localizedDescription)
        }
    }
}
