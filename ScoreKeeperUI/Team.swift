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
    
    convenience init?(jsonObject: [String: Any]) {
        
        guard let teamName = jsonObject["name"] as? String,
        let teamWins = jsonObject["wins"] as? Int,
            let teamLosses = jsonObject["losses"] as? Int else {
                return nil
        }
        
        self.init(name: teamName, wins: teamWins, losses: teamLosses)
    }
    
    
}
