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
        // Do any additional setup after loading the
        collectionView.dataSource = self
        collectionView.delegate = self
        let count = building.countPhotos
        //self.getImage(imageName: String("\(building.name ?? "none")\(i)") , x :x , y:y )
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    @IBAction func addphoto(_ sender: Any) {
        performSegue(withIdentifier: "addphotosegue", sender: self)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

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
        //cell.imageView?.image = UIImage(contentsOfFile: imagePath)
        //cell.imageView?.frame = CGRect(x: 20, y: 20, width: 2000 , height: 2000)
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
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

