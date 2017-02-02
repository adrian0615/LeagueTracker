//
//  GameAddViewController.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/18/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class GameAddViewController: UIViewController {
    
    var game: Game? = nil

    @IBOutlet var homeNameField: UITextField!
    
    @IBOutlet var homeScoreField: UITextField!
    
    @IBOutlet var awayNameField: UITextField!
    
    @IBOutlet var awayScoreField: UITextField!
    
    @IBAction func addGame(_ sender: Any) {
        
        game = Game(homeTeam: Team(name: homeNameField.text!, wins: 0, losses: 0), awayTeam: Team(name: awayNameField.text!, wins: 0, losses: 0), homeTeamScore: Int(homeScoreField.text!)!, awayTeamScore: Int(awayScoreField.text!)!)
        
        let updatedGame = game?.determineRecord(game: self.game!)
        
        let gamesVC = self.storyboard!.instantiateViewController(withIdentifier: "GamesView") as! GamesViewController
        
        let standingsVC = self.storyboard!.instantiateViewController(withIdentifier: "StandingsView") as! StandingsViewController
        
        gamesVC.games.append(updatedGame!)
        
        standingsVC.records.teams.append((updatedGame!.homeTeam))
        standingsVC.records.teams.append((updatedGame!.awayTeam))
        
        
        self.navigationController?.pushViewController(gamesVC, animated:
            true)
        
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == homeNameField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == awayNameField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == homeScoreField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        if textField == awayScoreField {
            if textField.text?.isEmpty ?? true {
                return false
            } else {
                
                print(textField.text!)
                return true
            }
        }
        
        return false
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Game"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
