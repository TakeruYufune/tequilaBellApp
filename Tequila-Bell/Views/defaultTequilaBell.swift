//
//  defaultTequilaBell.swift
//  Tequila-Bell
//
//  Created by どりー_Hack'z on 2023/04/01.
//

import SwiftUI

struct defaultTequilaBell: View {
    
    let soundPlayer = tequilaPlayer()
    
    @State var bellCount: Int = 0
    
    var body: some View {
        VStack {
            Text("\(bellCount)")
                .font(.system(size: 24.0))
            
            Image("tequilaBell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    soundPlayer.musicPlay()
                    bellCount += 1
                }
        }
        .frame(maxWidth: .infinity,
                   maxHeight: .infinity
            )
        .background(Color.black)
        .ignoresSafeArea()
    }
}

struct defaultTequilaBell_Previews: PreviewProvider {
    static var previews: some View {
        defaultTequilaBell()
    }
}
