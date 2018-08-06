//
//  DeetsViewController.swift
//  theWeeknd
//
//  Created by Christie Lynam on 8/6/18.
//  Copyright © 2018 Christie Lynam. All rights reserved.
//

import UIKit

class DeetsViewController: UIViewController {
    
    
    @IBOutlet weak var photoContainer: UIImageView!
    
    var photo : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realPhoto = photo {
            title = realPhoto.caption
            
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    photoContainer.image = cellPhotoImage
                }
            }
        }
    }

}
