//
//  PartsController.swift
//  HealthyMindsChallenge
//
//  Created by William Calkins on 10/29/18.
//  Copyright © 2018 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class PartsController: UITableViewController {
    
    var partsData : [Part]?
    var selectedRow : IndexPath?

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
        return partsData?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let partsCell = tableView.dequeueReusableCell(withIdentifier: "PartDataCell", for: indexPath) as? UserDataCell,
            let givenPart = self.partsData?[indexPath.row] else {
                return UITableViewCell()
        }
        
        partsCell.dataTitle.text = givenPart.title
        
        return partsCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //record selected row
        self.selectedRow = indexPath
        //deselect row
        tableView.deselectRow(at: indexPath, animated: true)
        //Call the segue
        self.performSegue(withIdentifier: "seriesSegue", sender: tableView)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "seriesSegue" {
            if let seriesController = segue.destination as? SeriesController,
                let givenIndex = self.selectedRow,
                let givenSeriesData = self.partsData?[givenIndex.row].series {
                //feed the series controller
                seriesController.seriesData = givenSeriesData
                
            }
        }
        
    }
    

}
