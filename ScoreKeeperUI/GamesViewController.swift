//
//  GamesViewController.swift
//  ScoreKeeperUI
//
//  Created by Adrian McDaniel on 1/18/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {

    var dataSource: GroupsDataSource!
    
    var tableView: UITableView {
        return view as! UITableView
    }
    
    override func loadView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = dataSource
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GamesViewController : UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let (teamName, members) = dataSource.team(indexPath.row)
        let gameVC = GameViewController()
        gameVC.dataSource = GameDataSource(teamName: teamName, group: members)
        show(gameVC, sender: self)
    }
}

final class GamesDataSource: NSObject, UITableViewDataSource {
    var book: [String : Team]
    init(book: [String : Team]) {
        self.book = book
    }
    
    var sortedKeys: [String] {
        return book.keys.sorted()
    }
    
    func team(_ index: Int) -> (name: String, members: [[String:String]]) {
        let teamKey = sortedKeys[index]
        let team = book[teamKey]!
        return (teamKey, team)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = sortedKeys[indexPath.row]
        return cell
    }
}
}
