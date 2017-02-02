//
//  GamesViewController.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/18/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var games = [Game(homeTeam: Team(name: "Falcons", wins: 4, losses: 0), awayTeam: Team(name: "Patriots", wins: 3, losses: 1), homeTeamScore: 28, awayTeamScore: 17), Game(homeTeam: Team(name: "Packers", wins: 2, losses: 2), awayTeam: Team(name: "Steelers", wins: 3, losses: 2), homeTeamScore: 20, awayTeamScore: 21), Game(homeTeam: Team(name: "Seahawks", wins: 1, losses: 3), awayTeam: Team(name: "Texans", wins: 3, losses: 2), homeTeamScore: 3, awayTeamScore: 22)]
    
    

    
    @IBOutlet var gamesTableView: UITableView!
    
    let gameCellIdenifier = "GameCell"
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: gameCellIdenifier)
        
        cell.textLabel?.text = "\(games[indexPath.row].homeTeam.name) vs \(games[indexPath.row].awayTeam.name)"
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.blue
        cell.backgroundColor = UIColor.lightGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        gamesTableView.deselectRow(at: indexPath, animated: true)
        
        let gameVC = self.storyboard!.instantiateViewController(withIdentifier: "GameView") as! GameViewController
        
        gameVC.game = games[indexPath.row]
        
        self.navigationController?.pushViewController(gameVC, animated:
            true)
        
    }
    
    
    
    
    @IBAction func newGame(_ sender: Any) {
        
        let gameAddVC = self.storyboard!.instantiateViewController(withIdentifier: "GameAddView") as! GameAddViewController
        
        self.navigationController?.pushViewController(gameAddVC, animated:
            true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Playoff Chase"
        
        
        gamesTableView.delegate = self
        gamesTableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update() {
        gamesTableView.reloadData()
    }
    
}


