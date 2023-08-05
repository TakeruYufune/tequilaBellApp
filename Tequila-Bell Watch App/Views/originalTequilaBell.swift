//
//  originalTequilaBell.swift
//  Tequila-Bell Watch App
//
//  Created by どりー_Hack'z on 2023/08/05.
//

import SwiftUI
import PhotosUI

struct originalTequilaBell: View {
    @State var selectedItems: PhotosPickerItem? = nil
    @State var image: UIImage?
    
    let soundPlayer = tequilaPlayer()
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        setAudioSession()
                        soundPlayer.musicPlay()
                    }
                    .padding()
            } else {
                Text("ベルにしたい画像を選択してね！")
                    .padding()
            }
            PhotosPicker(
                selection: $selectedItems,
                matching: .images) {
                    Text("写真を選択")
                }
                .onChange(of: selectedItems) { pickedItem in
                    Task {
                        guard let imageData = try await pickedItem?.loadTransferable(type: Data.self) else { return }
                        guard let uiImage = UIImage(data: imageData) else { return }
                        image = uiImage
                    }
                }
        }
    }
}

struct originalTequilaBell_Previews: PreviewProvider {
    static var previews: some View {
        originalTequilaBell()
    }
}
