//
//  defaultTequilaBell.swift
//  Tequila-Bell Watch App
//
//  Created by どりー_Hack'z on 2023/04/01.
//

import SwiftUI
import AVFAudio

struct defaultTequilaBell: View {
    
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

struct defaultTequilaBell_Previews: PreviewProvider {
    static var previews: some View {
        defaultTequilaBell()
    }
}
