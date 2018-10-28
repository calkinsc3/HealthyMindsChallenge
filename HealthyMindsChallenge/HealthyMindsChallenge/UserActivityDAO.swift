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
typealias UserProgressSuccess = (UsersProgressModel, NetworkStatus) -> Void
typealias UserProgressFailure = (NetworkStatus) -> Void


struct UserProgressDAO {
    
    
    func getUserProgress(userId: String?, success: UserProgressSuccess, failure: UserProgressFailure) {
        
        //unwrap the userId; use it if given
        //find the "healthy-minds-description.json" in the bundle
        //load it into a buffer
        //user Decodble to load the data structure
        //return the data via the closure to the caller
        
        
    }
    
    
    
}

