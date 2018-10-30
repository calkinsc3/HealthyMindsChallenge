//
//  SeriesController.swift
//  HealthyMindsChallenge
//
//  Created by William Calkins on 10/29/18.
//  Copyright © 2018 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class SeriesController: UITableViewController {
    
    var seriesData : [Series]?

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
        return self.seriesData?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let givenSeriesCell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as? UserDataCell,
            let givenSeriesData = self.seriesData?[indexPath.row] else {
                return UITableViewCell()
        }
        
       givenSeriesCell.dataTitle.text = givenSeriesData.title
        
        return givenSeriesCell
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
