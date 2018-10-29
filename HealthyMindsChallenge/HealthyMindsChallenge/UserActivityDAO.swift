//
//  UserActivityDAO.swift
//  HealthyMindsChallenge
//
//  Created by William Calkins on 10/28/18.
//  Copyright © 2018 Calkins Computer Consulting. All rights reserved.
//
// This object will be used to connect to the network and gather user data
// For this challenge it will simply load the data from a file inside the bundle but
// could easily be modified to use URLSession to connection to a network and return this data.

import Foundation

//create typealias to facilitate conversion with controller
typealias UserProgressSuccess = (UsersProgressModel?, HMNetworkStatus) -> Void
typealias UserProgressFailure = (HMNetworkStatus) -> Void


struct UserProgressDAO {
    
    
    func getUserProgress(userId: String?, success: UserProgressSuccess, failure: UserProgressFailure) {
        
        //unwrap the userId; use it if given
        if let givenUserID = userId {
            print("The given userID is \(givenUserID)")
        } else {
            print("Return will not be based on user.")
        }
        
        //find the "healthy-minds-description.json" in the bundle
        if let healthyMindsDescrURL = Bundle.main.url(forResource: "healthy-minds-description", withExtension: "json") {
            //load return file into a buffer
            do {
                let healthyMindsData = try Data(contentsOf: healthyMindsDescrURL)
                
                //use Decocable to load data structure
                let healthyMindsDecoder = JSONDecoder()
                let healthyMindsStructure = try healthyMindsDecoder.decode(UsersProgressModel.self, from: healthyMindsData)
                //sent success to the caller
                
                success(healthyMindsStructure, HMNetworkStatus(returnCode: 200, returnDescription: "Decoded data being returned successfully."))
                
                
            } catch  {
                print("Error loading the data file from the bundle")
                failure(HMNetworkStatus(returnCode: 500, returnDescription: "Error loading the data file from the bundle"))
            }
            
            
            
        }
        
        
        //load it into a buffer
        //user Decodble to load the data structure
        //return the data via the closure to the caller
        
        
    }
    
    
}


