//
//  AddPhotoViewController.swift
//  theWeeknd
//
//  Created by Christie Lynam on 8/5/18.
//  Copyright © 2018 Christie Lynam. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var caption: UITextField!
    @IBOutlet weak var emojis: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func photoLibraryTapped(_ sender: Any) {
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
    }

}
