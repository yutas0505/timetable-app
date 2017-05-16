//
//  ImageViewController.swift
//  a
//
//  Created by 佐比内優太 on 2017/05/04.
//  Copyright © 2017年 Yuta Sahinai. All rights reserved.
//

import UIKit
import Accounts

class ImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBAction func backToView1(segue: UIStoryboardSegue) {}
    
    
    let userDefaults = UserDefaults.standard
    
    var rownumber: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let loadedPhotoImageView = defaults.object(forKey: "\(rownumber)")
        if (loadedPhotoImageView == nil) {
            photoImageView = loadedPhotoImageView as! UIImageView
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func onTappedAlbumButton(){
        presentPickerController(sourceType: .photoLibrary)
    }
    
    
    func presentPickerController(sourceType: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        self.dismiss(animated: true, completion: nil)
        
        let profile = UserDefaults.standard
        
         if let imageData = profile.object(forKey: "imageData") as? NSData, let _ = UIImage(data: imageData as Data) {
            
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        }
        
        let defaults = UserDefaults.standard
        defaults.set(photoImageView, forKey: "\(rownumber)")
        
        let imageData = UIImageJPEGRepresentation(photoImageView.image!, 1);
        userDefaults.set(imageData, forKey: "imageData")
        userDefaults.synchronize()

        
        }
    
    @IBAction func pushSaveButton(sender: UIButton) {
        
        // UIImage => NSDataに変換してUserDefaultに保存
        if let image = UIImage(named: "image") {
            let imageData = UIImageJPEGRepresentation(image, 1);
            userDefaults.set(imageData, forKey: "imageData")
            userDefaults.synchronize()
        }
        let defaults = UserDefaults.standard
        defaults.set(photoImageView, forKey: "\(rownumber)")
    }
}
