//
//  GameViewController.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/18/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var game: Game? = nil
    @IBOutlet var homeTeamLabel: UILabel!
    @IBOutlet var homeScoreLabel: UILabel!
    @IBOutlet var awayTeamLabel: UILabel!
    @IBOutlet var awayScoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Game"
        
        homeTeamLabel.text = game?.homeTeam.name
        awayTeamLabel.text = game?.awayTeam.name
        homeScoreLabel.text = "\(game!.homeTeamScore)"
        awayScoreLabel.text = "\(game!.awayTeamScore)"

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
