//
//  CollectionViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 21/12/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var building: Building!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       collectionView.reloadData()
        
    }
    @IBAction func addphoto(_ sender: Any) {
         
        performSegue(withIdentifier: "addphotosegue", sender: self)
       
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
      
    }
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return building.countPhotos
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
    
        // Configure the cell
        let photoname = String("\(building.name ?? "none")\(indexPath.row)")
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(photoname)
        cell.imageView?.image = UIImage(contentsOfFile: imagePath)
        return cell
    
    
    }

    /*
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
    }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addphotosegue" {
            let destinationViewController = segue.destination as? AddPhotoViewController
            destinationViewController?.building = building
            
        }
        if segue.identifier == "gobacktodetailssegue" {
            let destinationViewController = segue.destination as? ListDetailViewController
            destinationViewController?.building = building
            
        }
        
    }
    

}

