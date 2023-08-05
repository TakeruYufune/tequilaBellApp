//
//  ImagePickerViewController.swift
//  Tequila-Bell
//
//  Created by どりー_Hack'z on 2023/08/05.
//

import SwiftUI

struct ImagePickerViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    enum SourceType {
        case camera
        case library
    }
    var sourceType: SourceType
    var allowsEditing: Bool = false
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerViewController
        
        init(_ parent: ImagePickerViewController) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.editedImage] as? UIImage {
                parent.image = image
            } else if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
            Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let viewController = UIImagePickerController()
        viewController.delegate = context.coordinator
        switch sourceType {
        case .camera:
            viewController.sourceType = UIImagePickerController.SourceType.camera
        case .library:
            viewController.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        viewController.allowsEditing = allowsEditing
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

