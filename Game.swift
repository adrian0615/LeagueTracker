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
    
    
    func scoringPlay(team: Team, score: Int) -> Game {
        let game: Game = Game(homeTeam: homeTeam, awayTeam: awayTeam, homeTeamScore: homeTeamScore, awayTeamScore: awayTeamScore)
        var totalScore: Int = 0
        
        if team == homeTeam {
            totalScore = homeTeamScore + score
            game.homeTeamScore = totalScore
            return game
        } else if team == awayTeam {
            totalScore = awayTeamScore + score
            game.awayTeamScore = totalScore
            return game
        }
        return game
    }
    
    

}







