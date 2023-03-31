//
//  realTequilaBell.swift
//  Tequila-Bell
//
//  Created by どりー_Hack'z on 2023/04/01.
//

import SwiftUI

struct realTequilaBell: View {
    
    let soundPlayer = tequilaPlayer()
    
    var body: some View {
        VStack {
            Image("realTequilaBell")
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

struct realTequilaBell_Previews: PreviewProvider {
    static var previews: some View {
        realTequilaBell()
    }
}
