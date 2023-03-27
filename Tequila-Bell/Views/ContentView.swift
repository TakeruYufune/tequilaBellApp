//
//  ContentView.swift
//  Tequila-Bell
//
//  Created by どりー_Hack'z on 2023/03/27.
//

import SwiftUI

struct ContentView: View {
    
    let soundPlayer = tequilaPlayer()
    
    var body: some View {
        VStack {
            Image("tequilaBell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    soundPlayer.musicPlay()
                }
        }
        .frame(maxWidth: .infinity,
                   maxHeight: .infinity
            )
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
