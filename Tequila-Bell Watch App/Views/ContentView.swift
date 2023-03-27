//
//  ContentView.swift
//  Tequila-Bell Watch App
//
//  Created by どりー_Hack'z on 2023/03/27.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    let soundPlayer = tequilaPlayer()
    
    var body: some View {
        VStack {
            Image("tequilaBell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    setAudioSession()
                    soundPlayer.musicPlay()
                }
        }
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
