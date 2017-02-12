//
//  GameStore.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 2/12/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation

enum GamesResult {
    case success([Game])
    case failure(GameStore.Error)
}


struct GameStore {
    
    
    enum Error: Swift.Error {
        case system(Swift.Error)
    }
    
    func array(from jsonObjects: [[String: Any]]) -> [Game]? {
        let eventArray = jsonObjects.flatMap(Game.init(jsonObject:))
        
        
        return eventArray
    }
    
    func convertToDictionary(games: [Game]) -> [[String: Any]] {
        var dictionaryArray: [[String: Any]] = []
        
        
        for game in games {
            
            let gameDictionary: [String: Any] = ["homeTeam": ["name": game.homeTeam.name, "wins": game.homeTeam.wins, "losses": game.homeTeam.losses], "awayTeam": ["name": game.awayTeam.name, "wins": game.awayTeam.wins, "losses": game.awayTeam.losses], "homeTeamScore": game.homeTeamScore, "awayTeamScore": game.awayTeamScore]
            
            dictionaryArray.append(gameDictionary)
        }
        return dictionaryArray
    }
    
    
    func postGames(games: [Game]) {
        var dictionaryArray: [[String: Any]] = []
        
        
        for game in games {
            
            let gameDictionary: [String: Any] = ["homeTeam": ["name": game.homeTeam.name, "wins": game.homeTeam.wins, "losses": game.homeTeam.losses], "awayTeam": ["name": game.awayTeam.name, "wins": game.awayTeam.wins, "losses": game.awayTeam.losses], "homeTeamScore": game.homeTeamScore, "awayTeamScore": game.awayTeamScore]
            
            dictionaryArray.append(gameDictionary)
        }
        
        let jsonRepresentation = try! JSONSerialization.data(withJSONObject: dictionaryArray, options: [])
        
        let stringSample = String(bytes: jsonRepresentation, encoding: .utf8)!
        _ = try? stringSample.write(toFile: "/Users/AdrianHome/League.txt", atomically: true, encoding: .utf8)
    }
    
    
    func fetchGames() -> [Game] {
        
        let returnedSample = try! String(contentsOfFile: "/Users/AdrianHome/League.txt", encoding: .utf8)
        let jsonData = returnedSample.data(using: .utf8)!
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [[String: Any]]
        
        let returnedGames = self.array(from: jsonObject)!
        
        return returnedGames
    }
}
