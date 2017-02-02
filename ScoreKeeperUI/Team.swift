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
        return lhs.name == rhs.name && lhs.wins == rhs.wins && lhs.losses == rhs.losses
    }
    
    let name: String
    var wins: Int
    var losses: Int
    
    
    init(name: String, wins: Int, losses: Int) {
        self.name = name
        self.wins = wins
        self.losses = losses
        
    }

    
}
