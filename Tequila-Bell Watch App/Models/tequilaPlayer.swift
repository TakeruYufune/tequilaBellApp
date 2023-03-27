//
//  tequilaPlayer.swift
//  Tequila-Bell Watch App
//
//  Created by どりー_Hack'z on 2023/03/27.
//

import WatchKit
import AVFoundation

class tequilaPlayer: NSObject {
    
    let musicData = NSDataAsset(name: "Bell")!.data
    
    var player: AVAudioPlayer!
    
    func musicPlay() {
        do {
            player = try AVAudioPlayer(data: musicData)
            
            player.play()
        } catch {
            print("Error")
        }
        
    }

}
