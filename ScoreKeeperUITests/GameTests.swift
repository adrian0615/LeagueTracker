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
    
    
    func testGetGameInfoSuccess() {
        
        let sample: [String: Any] = ["homeTeam": ["name": "Hawks", "wins": 2, "losses": 0], "awayTeam": ["name": "Heat", "wins": 0, "losses": 2], "homeTeamScore": 20, "awayTeamScore": 17]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample , options: [])
        
        let stringSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        _ = try? stringSample.write(toFile: "/Users/AdrianHome/LeagueTest.txt", atomically: true, encoding: .utf8)
        
        let returnedSample = try! String(contentsOfFile: "/Users/AdrianHome/LeagueTest.txt", encoding: .utf8)
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let game = Game(jsonObject: jsonObject)!
        
        let expected = Game(homeTeam: Team(name: "Hawks", wins: 2, losses: 0), awayTeam: Team(name: "Heat", wins: 0, losses: 2), homeTeamScore: 20, awayTeamScore: 17)
        
        XCTAssertEqual(game, expected)
        
    }
    
    func testGetGameInfoFailHomeTeam() {
        
        let sample: [String: Any] = ["homeTeam": ["name": "Hawk", "wins": 2, "losses": 0], "awayTeam": ["name": "Heat", "wins": 0, "losses": 2], "homeTeamScore": 20, "awayTeamScore": 17]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample , options: [])
        
        let stringSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        _ = try? stringSample.write(toFile: "/Users/AdrianHome/LeagueTest.txt", atomically: true, encoding: .utf8)
        
        let returnedSample = try! String(contentsOfFile: "/Users/AdrianHome/LeagueTest.txt", encoding: .utf8)
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let game = Game(jsonObject: jsonObject)!
        
        let expected = Game(homeTeam: Team(name: "Hawks", wins: 2, losses: 0), awayTeam: Team(name: "Heat", wins: 0, losses: 2), homeTeamScore: 20, awayTeamScore: 17)
        
        XCTAssertNotEqual(game, expected)
        
    }
    
    func testGetGameInfoFailAwayScore() {
        
        let sample: [String: Any] = ["homeTeam": ["name": "Hawks", "wins": 2, "losses": 0], "awayTeam": ["name": "Heat", "wins": 0, "losses": 2], "homeTeamScore": 20, "awayTeamScore": 19]
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample , options: [])
        
        let stringSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        _ = try? stringSample.write(toFile: "/Users/AdrianHome/LeagueTest.txt", atomically: true, encoding: .utf8)
        
        let returnedSample = try! String(contentsOfFile: "/Users/AdrianHome/LeagueTest.txt", encoding: .utf8)
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String: Any]
        
        let game = Game(jsonObject: jsonObject)!
        
        let expected = Game(homeTeam: Team(name: "Hawks", wins: 2, losses: 0), awayTeam: Team(name: "Heat", wins: 0, losses: 2), homeTeamScore: 20, awayTeamScore: 17)
        
        XCTAssertNotEqual(game, expected)
        
    }
    
    func testJsonTransferGamesThenGetThemBackSuccess() {
        
        let gameStore = GameStore()
        
        let games: [Game] = [Game(homeTeam: Team(name: "Falcons", wins: 4, losses: 0), awayTeam: Team(name: "Patriots", wins: 3, losses: 1), homeTeamScore: 28, awayTeamScore: 17), Game(homeTeam: Team(name: "Packers", wins: 2, losses: 2), awayTeam: Team(name: "Steelers", wins: 3, losses: 2), homeTeamScore: 20, awayTeamScore: 21), Game(homeTeam: Team(name: "Seahawks", wins: 1, losses: 3), awayTeam: Team(name: "Texans", wins: 3, losses: 2), homeTeamScore: 3, awayTeamScore: 22)]
        
        let sample = gameStore.convertToDictionary(games: games)
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: sample, options: [])
        
        let stringSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        _ = try? stringSample.write(toFile: "/Users/AdrianHome/LeagueTest.txt", atomically: true, encoding: .utf8)
        
        let returnedSample = try! String(contentsOfFile: "/Users/AdrianHome/LeagueTest.txt", encoding: .utf8)
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [[String: Any]]
        
        let returnedGames = gameStore.array(from: jsonObject)!
        
        XCTAssertEqual(games, returnedGames)
    }
    
    
}
