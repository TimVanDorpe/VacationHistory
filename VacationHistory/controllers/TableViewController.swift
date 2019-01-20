//
//  TableViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 19/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit
import MapKit


class TableViewController: UITableViewController{
    var buildings : Results<Building>!
    var notificationToken : NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = RealmService.shared.realm
        buildings = realm.objects(Building.self)
        buildings = buildings.sorted(byKeyPath: "name", ascending: true)
        notificationToken = realm.observe{
            (notification, realm) in
        self.tableView.reloadData()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(forName: BuildingsController.BUILDING_ADDED_NOTIFICATION, object: nil , queue: nil)
        {
            notification in
            self.tableView.reloadData()
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) 
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        
        return buildings.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        
        //let buildingsArray:Array = BuildingsController.sharedBuildings()
        
        let building:Building = buildings[indexPath.row] 
        cell.textLabel?.text = building.name

        
        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //update
       
        print("selected")
        let building = buildings[indexPath.row]
        
        AlertService.updateAlert(in: self, building:building) { (name, desc) in
            let dict: [String: Any?] = ["name": name,
                                        "desscription": desc]
            RealmService.shared.update(building, with: dict)
        }
    }*/
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListDetailSegue" {
        let selectedIndex_ = self.tableView.indexPath(for: sender as! UITableViewCell)
        let destinationViewController = segue.destination as?
        ListDetailViewController
            destinationViewController?.building = buildings[(selectedIndex_?.row)!]
            
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        let building = buildings[indexPath.row]
        
        RealmService.shared.delete(building)
        
    }
    
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


extension ViewController: UITableViewDelegate {
    
}
