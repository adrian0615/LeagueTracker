//
//  Game.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


class Game : Equatable {
    
    public static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.homeTeam == rhs.homeTeam && lhs.awayTeam == rhs.awayTeam && lhs.homeTeamScore == rhs.homeTeamScore && lhs.awayTeamScore == rhs.awayTeamScore
    }
    
    
    let homeTeam: Team
    let awayTeam: Team
    
    var homeTeamScore: Int
    var awayTeamScore: Int
    
    init(homeTeam: Team, awayTeam: Team, homeTeamScore: Int, awayTeamScore: Int) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeTeamScore = homeTeamScore
        self.awayTeamScore = awayTeamScore
    }
    
    convenience init?(jsonObject: [String: Any]) {
        
        
        guard let gameHomeTeam = Team.init(jsonObject: jsonObject["homeTeam"] as! [String : Any]),
            let gameAwayTeam = Team.init(jsonObject: jsonObject["awayTeam"] as! [String : Any]),
            let gameHomeTeamScore = jsonObject["homeTeamScore"] as? Int,
            let gameAwayTeamScore = jsonObject["awayTeamScore"] as? Int else {
                return nil
        }
        self.init(homeTeam: gameHomeTeam, awayTeam: gameAwayTeam, homeTeamScore: gameHomeTeamScore, awayTeamScore: gameAwayTeamScore)
    }
    
    
    func determineRecord(game: Game) -> Game {
        let newGame = game
        
        guard newGame.homeTeamScore != newGame.awayTeamScore else {
            fatalError()
        }
        
        if newGame.homeTeamScore > newGame.awayTeamScore {
            newGame.homeTeam.wins += 1
            newGame.awayTeam.losses += 1
            
        } else {
            
            newGame.homeTeam.losses += 1
            newGame.awayTeam.wins += 1
        }
        
        
        return newGame
    }
    
}












