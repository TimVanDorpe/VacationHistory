//
//  ListDetailViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 10/10/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class ListDetailViewController: UIViewController{
    @IBOutlet weak var stackViewRating: RatingController!
    
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var lblLong: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    var building: Building!
    override func viewDidLoad() {
        self.loadStrings()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadStrings()
    }
   
   
    @IBAction func goToGallery(_ sender: Any) {
        performSegue(withIdentifier: "gallerysegue", sender: self)
        
    }
    @IBAction func edit(_ sender: Any) {
         performSegue(withIdentifier: "editsegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gallerysegue" {
            
            let destinationViewController = segue.destination as? CollectionViewController
            destinationViewController?.building = building
        }
        if segue.identifier == "editsegue" {
            
            let destinationViewController = segue.destination as? EdditsViewController
            destinationViewController?.building = building
        }
      
    }
   
    @IBAction func exitt(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
     
    }
    private func loadStrings(){
        let photoname = String("\(String(describing: building.name ?? "random"))0")
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(photoname)
        if(UIImage(contentsOfFile: imagePath) != nil){
        img.image = UIImage(contentsOfFile: imagePath)
        }
        stackViewRating.setStarsRating(rating: building.rating)
        lblTitle.text = building.name
        lblDate.text = String("Added on : \(String(describing: building.date ?? "No description"))")
        
        lblLong.text = String("Longitude : \(building.longitude)")
        lblLat.text = String("Latitude : \(building.latitude)")
        txtDesc.text = building.desscription
    }
}
