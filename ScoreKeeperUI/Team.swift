//
//  Team.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


class Team : Equatable {
    public static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name 
    }
    
    var name: String

    
    init(name: String) {
        self.name = name
        
    }
}
