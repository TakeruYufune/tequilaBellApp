//
//  realTequilaBell.swift
//  Tequila-Bell Watch App
//
//  Created by どりー_Hack'z on 2023/04/01.
//

import SwiftUI
import AVFAudio

struct realTequilaBell: View {
    let soundPlayer = tequilaPlayer()
    
    var body: some View {
        VStack {
            Image("realTequilaBell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    setAudioSession()
                    soundPlayer.musicPlay()
                }
        }
    }
}

struct realTequilaBell_Previews: PreviewProvider {
    static var previews: some View {
        realTequilaBell()
    }
}
