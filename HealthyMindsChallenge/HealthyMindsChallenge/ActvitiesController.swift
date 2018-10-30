//
//  ActvitiesController.swift
//  HealthyMindsChallenge
//
//  Created by William Calkins on 10/29/18.
//  Copyright © 2018 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class ActvitiesController: UITableViewController {
    
    var actvities : [Activity]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.actvities?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let givenActivityCell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath) as? UserDataCell,
            let givenActivityData = self.actvities?[indexPath.row] else {
                return UITableViewCell()
        }
        
       givenActivityCell.dataTitle.text = givenActivityData.uuid
        
        return givenActivityCell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}