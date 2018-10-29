//
//  UserProgressData.swift
//  HealthyMindsChallenge
//
//  Created by William Calkins on 10/28/18.
//  Copyright © 2018 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class UserProgressData: UITableViewController {
    
    let userProgressDAO = UserProgressDAO()
    var userData : UsersProgressModel?
    
    var selectedRow : IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //Get data for the user
        userProgressDAO.getUserProgress(userId: nil, success: { (userProgressData, networkStatus) in
            //Yah, success
            
            
            if let givenUserData = userProgressData {
                self.userData = userProgressData
                print("The number of module for the user is : \(givenUserData.modules.count)")
            }
        }) { (networkStatus) in
            //Boo, failure
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.userData?.modules.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let userDataCell = tableView.dequeueReusableCell(withIdentifier: "ModuleDataCell", for: indexPath) as? UserDataCell,
                let givenModule = self.userData?.modules[indexPath.row] else {
            return UITableViewCell()
        }
        
         userDataCell.dataTitle.text = givenModule.title

        return userDataCell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //set the selected row
        self.selectedRow = indexPath
        //turn off selection
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //prepare to go to the Parts controller
        if segue.identifier == "showPartsSegue" {
            if let partsController = segue.destination as? PartsController,
                let givenIndex = self.selectedRow {
                //set the parts for the given module
                //TODO:- verify count of parts
                
                partsController.partsData = self.userData?.modules[givenIndex.row].parts
            }
        }
        
    }

}
