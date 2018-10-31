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
    var selectedIndexPath: IndexPath?
    var activityMetaData : ActivityMetaData?
    
    let isoDateFormatter = ISO8601DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadActivityMetaData()
        
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
        //find if the given activity is in the completion list; if it output the data completed on
        //it it is not output "Need to complete"
        var activityCompleted = false
        var completedActivityDate : Date?
        var completeDateForDisplay = ""
        if let givenActivityMetaData = self.activityMetaData, let listOfCompletions = givenActivityMetaData.activityCompletions {
            let completedActivity = listOfCompletions.filter({$0.activityUUID == givenActivityData.uuid})
            activityCompleted = completedActivity.count > 0
            if activityCompleted {
                completedActivityDate = completedActivity[0].lastCompletedOn
                if let givenCompleteDate = completedActivityDate {
                    completeDateForDisplay = self.isoDateFormatter.string(from: givenCompleteDate)
                }
            }
        }
        
        givenActivityCell.dataTitle.text = (activityCompleted ? "Completed on \(completeDateForDisplay) " : "Not completed")
        
        return givenActivityCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //set selected Index path
        self.selectedIndexPath = indexPath
        //deselected the row
        tableView.deselectRow(at: indexPath, animated: true)
        //call segue
        self.performSegue(withIdentifier: "taskSegue", sender: tableView)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "taskSegue" {
            if let taskController = segue.destination as? TasksController,
                let givenIndex = self.selectedIndexPath,
                let givenTasks = self.actvities?[givenIndex.row].tasks {
                
                taskController.tasks = givenTasks
            }
        }
    }
    
    //MARK: - Helper Functions
    private func loadActivityMetaData() {
        
       /*
         1. "c376391f-d24e-4b78-a246-e8816f888340": {"lastCompletedOn": "2018-05-30T07:41:04-05:00"},
         2. "0f2f5925-3521-486d-91dd-75469d4da57c": {"lastCompletedOn": "2018-05-30T07:48:08-05:00"},
         3. "0e6b7000-6588-4cb9-a1f7-6eecbca74230": {"lastCompletedOn": "2018-05-30T07:52:12-05:00"},
         4. "1208d753-4134-427e-8eb8-a300c7d788f0": {"lastCompletedOn": "2018-05-30T08:08:24-05:00"},
         5. "7a9626cc-f906-41a3-86de-0a2a899fc546": {"lastCompletedOn": "2018-05-31T07:23:31-05:00"},
         6. "9fbd5cdb-05bb-4d83-ad12-cbff28fb0683": {"lastCompletedOn": "2018-05-31T07:25:54-05:00"},
         7. "5c60029f-cb05-4e27-a7e9-9bbb97bdd5fe": {"lastCompletedOn": "2018-05-31T07:30:11-05:00"},
         8. "d0a5c01e-9991-4717-aff1-42ba41f33eb8": {"lastCompletedOn": "2018-06-01T11:22:59-05:00"},
         9. "31dcb471-a62b-4e73-934a-f19c9bb90281": {"lastCompletedOn": "2018-06-01T11:25:17-05:00"},
         10. "dd8c5a1d-aeca-4eac-b595-80a66f02ab43": {"lastCompletedOn": "2018-06-01T11:33:48-05:00"}
 
 */
        //(activityUUID: String, lastCompletedOn: Date?)
        let isoDateFormatter = ISO8601DateFormatter()
        let completion1 = ActivityCompletion(activityUUID: "c376391f-d24e-4b78-a246-e8816f888340", lastCompletedOn: isoDateFormatter.date(from: "2018-05-30T07:41:04-05:00"))
        let completion2 = ActivityCompletion(activityUUID: "0f2f5925-3521-486d-91dd-75469d4da57c", lastCompletedOn: isoDateFormatter.date(from: "2018-05-30T07:48:08-05:00"))
        let completion3 = ActivityCompletion(activityUUID: "0e6b7000-6588-4cb9-a1f7-6eecbca74230", lastCompletedOn: isoDateFormatter.date(from: "2018-05-30T07:52:12-05:00"))
        let completion4 = ActivityCompletion(activityUUID: "1208d753-4134-427e-8eb8-a300c7d788f0", lastCompletedOn: isoDateFormatter.date(from: "2018-05-30T08:08:24-05:00"))
        let completion5 = ActivityCompletion(activityUUID: "7a9626cc-f906-41a3-86de-0a2a899fc546", lastCompletedOn: isoDateFormatter.date(from: "2018-05-31T07:23:31-05:00"))
        let completion6 = ActivityCompletion(activityUUID: "9fbd5cdb-05bb-4d83-ad12-cbff28fb0683", lastCompletedOn: isoDateFormatter.date(from: "2018-05-31T07:25:54-05:00"))
        let completion7 = ActivityCompletion(activityUUID: "5c60029f-cb05-4e27-a7e9-9bbb97bdd5fe", lastCompletedOn: isoDateFormatter.date(from: "2018-05-31T07:30:11-05:00"))
        let completion8 = ActivityCompletion(activityUUID: "d0a5c01e-9991-4717-aff1-42ba41f33eb8", lastCompletedOn: isoDateFormatter.date(from: "2018-06-01T11:22:59-05:00"))
        let completion9 = ActivityCompletion(activityUUID: "31dcb471-a62b-4e73-934a-f19c9bb90281", lastCompletedOn: isoDateFormatter.date(from: "2018-06-01T11:25:17-05:00"))
        let completion10 = ActivityCompletion(activityUUID: "dd8c5a1d-aeca-4eac-b595-80a66f02ab43", lastCompletedOn: isoDateFormatter.date(from: "2018-06-01T11:33:48-05:00"))
        
    
        self.activityMetaData = ActivityMetaData(cohortName: "Alice Co.", mostRecentlyCompletedActivityId: "dd8c5a1d-aeca-4eac-b595-80a66f02ab43", activityCompletions: [completion1,
                                                                                                                                                                         completion2,
                                                                                                                                                                         completion3,
                                                                                                                                                                         completion4,
                                                                                                                                                                         completion5,
                                                                                                                                                                         completion6,
                                                                                                                                                                         completion7,
                                                                                                                                                                         completion8,
                                                                                                                                                                         completion9,
                                                                                                                                                                         completion10])
        
    }
    

}


