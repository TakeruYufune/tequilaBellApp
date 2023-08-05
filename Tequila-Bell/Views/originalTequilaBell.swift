//
//  originalTequilaBell.swift
//  Tequila-Bell
//
//  Created by どりー_Hack'z on 2023/08/05.
//

import SwiftUI

struct originalTequilaBell: View {
    @State var showingPicker = false
    @State var image: UIImage?
    
    let soundPlayer = tequilaPlayer()
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 400)
                    .onTapGesture {
                        soundPlayer.musicPlay()
                    }
                    .padding()
            }
            Text("画像を選択")
                .onTapGesture {
                showingPicker.toggle()
            }
        }
        .sheet(isPresented: $showingPicker) {
                    ImagePickerViewController(image: $image, sourceType: .library)
            }
        .frame(maxWidth: .infinity,
                   maxHeight: .infinity
            )
        .background(Color.black)
        .ignoresSafeArea()
    }
}

struct originalTequilaBell_Previews: PreviewProvider {
    static var previews: some View {
        originalTequilaBell()
    }
}
