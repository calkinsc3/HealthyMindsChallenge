//
//  TasksController.swift
//  HealthyMindsChallenge
//
//  Created by William Calkins on 10/29/18.
//  Copyright © 2018 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class TasksController: UITableViewController {
    
    var tasks : [Task]?
    var types : [PurpleType]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //flatten the task types into an array of string for display
        self.types = self.tasks?.compactMap({$0.type})
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.types?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let taskCell = tableView.dequeueReusableCell(withIdentifier: "TaskDataCell", for: indexPath) as? UserDataCell,
            let givenType = self.types?[indexPath.row]  else {
                return UITableViewCell()
        }
        
        taskCell.dataTitle.text = givenType.rawValue
        
        return taskCell
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
