//
//  Records.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


class Record {
    
    var team: Team
    var wins: Int
    var loses: Int
    var ties: Int
    
    init(team: Team, wins: Int, loses: Int, ties: Int) {
        self.team = team
        self.wins = wins
        self.loses = loses
        self.ties = ties
        
    }
    
    
    
}
