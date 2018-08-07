//
//  AddPhotoViewController.swift
//  theWeeknd
//
//  Created by Christie Lynam on 8/5/18.
//  Copyright © 2018 Christie Lynam. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var imagePicker = UIImagePickerController()
    
    
    
    @IBOutlet weak var photoContainer: UIImageView!
    @IBOutlet weak var caption: UITextField!
    @IBOutlet weak var emojis: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoContainer.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func photoLibraryTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let photoToSave = Photo(entity: Photo.entity(), insertInto: context)
            photoToSave.caption = caption.text
            photoToSave.emoji = emojis.text
            
            if let userImage = photoContainer.image {
                if let userImageData = UIImagePNGRepresentation(userImage) {
                    photoToSave.imageData = userImageData
                }
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            navigationController?.popViewController(animated: true)
        }
    }
    
}
