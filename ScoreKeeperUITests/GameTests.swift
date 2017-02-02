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
    
    func testRecordSuccess() {
        
        
        let game = Game(homeTeam: Team(name: "Hawks", wins: 2, losses: 3), awayTeam: Team(name: "Heat", wins: 3, losses: 2), homeTeamScore: 20, awayTeamScore: 17)
        
        let test = game.determineRecord(game: game)
        
        let expected = Game(homeTeam: Team(name: "Hawks", wins: 3, losses: 3), awayTeam: Team(name: "Heat", wins: 3, losses: 3), homeTeamScore: 20, awayTeamScore: 17)
        
        XCTAssertEqual(test, expected)
    }
    
    func testRecordFail() {
        
        
        let game = Game(homeTeam: Team(name: "Hawks", wins: 2, losses: 3), awayTeam: Team(name: "Heat", wins: 3, losses: 2), homeTeamScore: 20, awayTeamScore: 17)
        
        let test = game.determineRecord(game: game)
        
        let expected = Game(homeTeam: Team(name: "Hawks", wins: 6, losses: 3), awayTeam: Team(name: "Heat", wins: 3, losses: 0), homeTeamScore: 20, awayTeamScore: 17)
        
        XCTAssertNotEqual(test, expected)
    }
    
    func testRecordSuccess2() {
        
        
        let game = Game(homeTeam: Team(name: "Hornets", wins: 5, losses: 0), awayTeam: Team(name: "Heels", wins: 3, losses: 2), homeTeamScore: 9, awayTeamScore: 17)
        
        let test = game.determineRecord(game: game)
        
        let expected = Game(homeTeam: Team(name: "Hornets", wins: 5, losses: 1), awayTeam: Team(name: "Heels", wins: 4, losses: 2), homeTeamScore: 9, awayTeamScore: 17)
        
        XCTAssertEqual(test, expected)
    }
    
    func testRecordFail2() {
        
        
        let game = Game(homeTeam: Team(name: "Hawks", wins: 0, losses: 0), awayTeam: Team(name: "Heat", wins: 0, losses: 0), homeTeamScore: 20, awayTeamScore: 17)
        
        let test = game.determineRecord(game: game)
        
        let expected = Game(homeTeam: Team(name: "Hawks", wins: 6, losses: 3), awayTeam: Team(name: "Heat", wins: 3, losses: 0), homeTeamScore: 20, awayTeamScore: 17)
        
        XCTAssertNotEqual(test, expected)
    }
    
}
