//
//  AddPhotoViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 15/12/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    var building : Building!
  
    
    @IBOutlet weak var lblWarning: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblWarning.text = ""

        // Do any additional setup after loading the view.
    }
    @IBAction func backtogallery(_ sender: Any) {
         performSegue(withIdentifier: "gobacksegue", sender: self)
      

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gobacksegue" {
            
            let destinationViewController = segue.destination as? CollectionViewController
            destinationViewController?.building = building
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    @IBAction func savepicture(_ sender: Any) {
        
        if (imageView.image == nil )
        {
            self.lblWarning.text = "You have to add an photo first, before saving it !"
        }
        else{
            
            let imageData = imageView.image!.pngData()
            let compresedImage = UIImage(data: imageData!)
            UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
        
            saveImage(imageName: String("\(building.name ?? "none")\(building.countPhotos)"))
        
            let buildingcount = building.countPhotos + 1
            let dict: [String: Any?] = ["countPhotos": buildingcount]
            RealmService.shared.update(building, with: dict)
        
            let alert = UIAlertController(title: "Saved", message: "Your image has been saved", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    
    }
    @IBAction func selectpicture(_ sender: Any) {
         self.lblWarning.text = ""
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default , handler: {(action:UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController , animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default , handler: {(action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController , animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
  
    func saveImage(imageName: String){
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
       
        let image = imageView.image!
        let data = image.pngData()
       
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        print(imagePath)
        
        let dict: [String: Any?] = ["pathPhoto": imagePath]
        RealmService.shared.update(building, with: dict)
    }
    
}
