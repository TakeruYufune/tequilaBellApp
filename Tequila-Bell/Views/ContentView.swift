//
//  ContentView.swift
//  Tequila-Bell
//
//  Created by どりー_Hack'z on 2023/03/27.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NavigationStack {
                defaultTequilaBell()
            }
            NavigationStack {
                realTequilaBell()
            }
            NavigationStack {
                originalTequilaBell()
            }
        }.tabViewStyle(.page)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
