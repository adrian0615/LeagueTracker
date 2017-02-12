//
//  Standings.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 2/1/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


class Records {
    
    var teams: [Team]
    
    var standings: [Team] {
        let sorted = self.teams.sorted { $0.wins == $1.wins ? $0.losses < $1.losses : $0.wins > $1.wins }
        
        return sorted
    }
    
    init(teams: [Team]) {
        self.teams = teams
    }
    
    
    
}
