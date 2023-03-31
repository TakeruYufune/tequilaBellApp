//
//  audioSession.swift
//  Tequila-Bell Watch App
//
//  Created by どりー_Hack'z on 2023/04/01.
//

import Foundation
import AVFAudio

func setAudioSession(){
    let audioSession = AVAudioSession.sharedInstance()
    do {
        // カテゴリの設定
        try audioSession.setCategory(.playback, mode: .moviePlayback, options: [])

        // AVAudioSessionの有効化
        try audioSession.setActive(true)
    } catch {
        print(error)
    }
}
