//
//  originalTequilaBell.swift
//  Tequila-Bell
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
                    .frame(height: 400)
                    .onTapGesture {
                        soundPlayer.musicPlay()
                    }
                    .padding()
            } else {
                Text("ベルにしたい画像を選択してね！")
                    .padding()
            }
            PhotosPicker(
                selection: $selectedItems,
                matching: .images,
                photoLibrary: .shared()) {
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
