//
//  TeamViewController.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 2/1/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    
    var team: Team? = nil

    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var teamWinsLabel: UILabel!
    @IBOutlet var teamLosesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Team Record"
        
        teamNameLabel.text = team?.name
        teamWinsLabel.text = "Wins: \(team!.wins)"
        teamLosesLabel.text = "Losses: \(team!.losses)"

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
