//
//  ContentView.swift
//  Tequila-Bell Watch App
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
        }.tabViewStyle(.page)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
