//
//  JSON.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/17/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation




func makeGameJSONAble(game: Game) -> [String: Any] {
    var gameDict: [String: Any] = [:]
    
    gameDict["homeTeam"] = game.homeTeam.name
    gameDict["awayTeam"] = game.awayTeam.name
    gameDict["homeTeamRecord"] = "\(game.homeTeam.wins)-\(game.homeTeam.wins)"
    gameDict["awayTeamRecord"] = "\(game.awayTeam.wins)-\(game.awayTeam.wins)"
    gameDict["homeTeamScore"] = game.homeTeamScore
    gameDict["awayTeamScore"] = game.awayTeamScore
    
    
    print(gameDict)
    return gameDict
}






func jsonSerial(jsonDict: [String: Any]) {
    
    let jsonRepresentation = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
    
    let returned = String(bytes: jsonRepresentation, encoding: .utf8)!
    
    let jsonData = returned.data(using: .utf8)!
    
    let jsonObject = try! JSONSerialization.jsonObject(with: jsonData, options:[]) as! [String:Any]
    
    print(jsonObject)
}
