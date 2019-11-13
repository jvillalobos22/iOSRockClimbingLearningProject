//
//  ViewController.swift
//  RockClimbing
//
//  Created by Juan Villalobos on 11/13/19.
//  Copyright © 2019 Juanton. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var fetchResults:[Crag] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = DatabaseController.persistentStoreContainer().viewContext; // store local reference to core data managed object context
        
//        // creating a new crag with a location
//        let newCrag = Crag(context: context)
//        newCrag.cragName = "Another crag location"
//        newCrag.cragNotes = "new notes go here"
//
//        newCrag.cragLocation = ClimbingLocation(context: context)
//        newCrag.cragLocation?.latitude = 123.54
//        newCrag.cragLocation?.longitude = 321.985
//        // will save a new Crag each time we load, will be broken out later
//        DatabaseController.saveContext()
        
        // get them from the database
        let fetchRequest:NSFetchRequest = Crag.fetchRequest()
        
        do {
            fetchResults = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CragCell")
        
        cell?.textLabel?.text = fetchResults[indexPath.row].cragName
        
        return cell!
    }
}

