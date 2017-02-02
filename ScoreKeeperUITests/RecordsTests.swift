//
//  RecordsTests.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import XCTest
@testable import ScoreKeeperUI

class RecordsTests: XCTestCase {
    
    func testRecordsTrue() {
        
        
        let records = Records(teams: [Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Heals", wins: 4, losses: 1)])
        
        let standings = records.computeStandings(teams: records.teams)
        
        
        
        let expected = [Team(name: "Heals", wins: 4, losses: 1), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hawks", wins: 2, losses: 3)]
        
        XCTAssertEqual(standings, expected)
        
    }
    
    func testRecordsFalse() {
        
        
        let records = Records(teams: [Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Heals", wins: 4, losses: 1)])
        
        let standings = records.computeStandings(teams: records.teams)
        
        
        
        let expected = [Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heals", wins: 1, losses: 3)]
        
        XCTAssertNotEqual(standings, expected)
        
    }
    
    
    func testRecordsTrue2() {
        
        
        let records = Records(teams: [Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Heals", wins: 1, losses: 3)])
        
        let standings = records.computeStandings(teams: records.teams)
        
        
        
        let expected = [Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heals", wins: 1, losses: 3)]
        
        XCTAssertEqual(standings, expected)
        
    }
    
    func testRecordsFalse2() {
        
        
        let records = Records(teams: [Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Heals", wins: 1, losses: 3)])
        
        let standings = records.computeStandings(teams: records.teams)
        
        
        
        let expected = [Team(name: "Heals", wins: 4, losses: 1), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hawks", wins: 2, losses: 3)]
        
        XCTAssertNotEqual(standings, expected)
        
    }
    
    func testRecordsTrue3() {
        
        
        let records = Records(teams: [Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hive", wins: 0, losses: 4), Team(name: "Heals", wins: 1, losses: 3)])
        
        let standings = records.computeStandings(teams: records.teams)
        
        
        
        let expected = [Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heals", wins: 1, losses: 3), Team(name: "Hive", wins: 0, losses: 4)]
        
        XCTAssertEqual(standings, expected)
        
    }
    
    
    func testRecordsFalse3() {
        
        
        let records = Records(teams: [Team(name: "Hawks", wins: 2, losses: 3), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hive", wins: 0, losses: 4), Team(name: "Heals", wins: 1, losses: 3)])
        
        let standings = records.computeStandings(teams: records.teams)
        
        
        
        let expected = [Team(name: "Heals", wins: 4, losses: 1), Team(name: "Heat", wins: 3, losses: 1), Team(name: "Hive", wins: 3, losses: 2), Team(name: "Hornets", wins: 2, losses: 2), Team(name: "Hawks", wins: 2, losses: 3)]
        
        XCTAssertNotEqual(standings, expected)
        
    }

}
