//
//  GalleryViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 10/12/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//
/*
import UIKit

class GalleryViewController: UITableViewController {

    var building: Building!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
  
    @IBAction func addPhoto(_ sender: Any) {
        performSegue(withIdentifier: "addphotosegue", sender: self)
        self.dismiss(animated: true, completion: nil)
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return building.countPhotos
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let photoname = String("\(building.name ?? "none")\(indexPath.row)")
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(photoname)
        cell.imageView?.image = UIImage(contentsOfFile: imagePath)
        cell.imageView?.frame = CGRect(x: 20, y: 20, width: 2000 , height: 2000)
        return cell
    }
    
    
    
    func getImage(imageName: String, x:Int , y:Int){
        let fileManager = FileManager.default
        
        //let imagePath = building.pathPhoto
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath){
            //imageView.image = UIImage(contentsOfFile: imagePath)
            let image = UIImage(contentsOfFile: imagePath)
            let imageViewNew = UIImageView(image: image!)
            
            imageViewNew.frame = CGRect(x: x, y: y, width: 200 , height: 200)
            view.addSubview(imageViewNew)
        }else{
            print("No Image!")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addphotosegue" {
            
            let destinationViewController = segue.destination as? AddPhotoViewController
            destinationViewController?.building = building
            
        }
    }
   
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
*/

