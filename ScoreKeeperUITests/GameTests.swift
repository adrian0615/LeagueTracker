//
//  GameTests.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import XCTest
@testable import ScoreKeeperUI

class GameTests: XCTestCase {
    
    func testAwayTeamScoredTrue() {
        
    
    let game = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 7)
        
        let test = game.scoringPlay(team: game.awayTeam, score: 7)
        
        let result = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 14)
        
        XCTAssertEqual(test, result)
    
    }
    
    func testAwayTeamScoredTrue2() {
        
        let game = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 7)
        
        let test = game.scoringPlay(team: game.awayTeam, score: 2)
        
        let result = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 9)
        
        XCTAssertEqual(test, result)
        
    }
    
    
    
    func testHomeTeamScoredTrue() {
        
        let game = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 7)
        
        let test = game.scoringPlay(team: game.homeTeam, score: 3)
        
        let result = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 13, awayTeamScore: 7)
        
        XCTAssertEqual(test, result)
        
    }
    
    func testHomeTeamScoredTrue2() {
        
        let game = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 7)
        
        let test = game.scoringPlay(team: game.homeTeam, score: 8)
        
        let result = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 18, awayTeamScore: 7)
        
        XCTAssertEqual(test, result)
        
    }
    
    
    func testHomeTeamScoredFalse() {
        
        let game = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 7)
        
        let test = game.scoringPlay(team: game.awayTeam, score: 3)
        
        let result = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 13, awayTeamScore: 7)
        
        XCTAssertNotEqual(test, result)
        
    }
    
    func testHomeTeamScoredFalse2() {
        
        let game = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 7)
        
        let test = game.scoringPlay(team: game.homeTeam, score: 7)
        
        let result = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 13, awayTeamScore: 7)
        
        XCTAssertNotEqual(test, result)
        
    }
    
    func testAwayTeamScoredFalse() {
        
        let game = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 7)
        
        let test = game.scoringPlay(team: game.homeTeam, score: 3)
        
        let result = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 10)
        
        XCTAssertNotEqual(test, result)
        
    }
    
    func testAwayTeamScoredFalse2() {
        
        let game = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 7)
        
        let test = game.scoringPlay(team: game.awayTeam, score: 3)
        
        let result = Game(homeTeam: Team(name: "Falcons", wins: 0, loses: 0, ties: 0), awayTeam: Team(name: "Bears", wins: 0, loses: 0, ties: 0), homeTeamScore: 10, awayTeamScore: 3)
        
        XCTAssertNotEqual(test, result)
        
    }
    
    
}
