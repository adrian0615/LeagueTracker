//
//  StandingsViewController.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/18/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class StandingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var standingsTableView: UITableView!
    
    var games: [Game] = []
    var gameStore = GameStore()
    
    var records = Records(teams: [])
    
    var standings: [Team] = []
    
    let teamCellIdenifier = "TeamCell"
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.standings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: teamCellIdenifier)
        
        cell.textLabel?.text = "\(indexPath.row + 1): \(records.standings[indexPath.row].name)"
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = UIColor.lightGray
        cell.textLabel?.textColor = UIColor.blue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        standingsTableView.deselectRow(at: indexPath, animated: true)
        
        let teamVC = self.storyboard!.instantiateViewController(withIdentifier: "TeamView") as! TeamViewController
        
        teamVC.team = records.standings[indexPath.row]
        
        self.navigationController?.pushViewController(teamVC, animated:
            true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Playoff Rankings"
        
        let gamesVC = self.storyboard!.instantiateViewController(withIdentifier: "GamesView") as! GamesViewController
        gameStore = gamesVC.gameStore
        games = gameStore.fetchGames()
        
        update()
        
        standingsTableView.delegate = self
        standingsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        for game in games {
           
            
            self.records.teams.append(game.homeTeam)
            self.records.teams.append(game.awayTeam)
            
        }
        
        

        standingsTableView.reloadData()
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
