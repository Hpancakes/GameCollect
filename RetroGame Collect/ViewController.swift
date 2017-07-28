//
//  ViewController.swift
//  RetroGame Collect
//
//  Created by JoseLuis Lara VIllanueva on 7/28/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var gameTableView: UITableView!
    
    var gameList : [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameTableView.delegate = self
        gameTableView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        gameList = try context.fetch(Game.fetchRequest())
            gameTableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let game = gameList[indexPath.row]
        cell.textLabel?.text = game.title
        cell.detailTextLabel?.text = game.consola
        cell.imageView?.image = UIImage(data: game.picture! as Data)
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let game = gameList[indexPath.row]
        performSegue(withIdentifier: "gameSegue", sender: game)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! GameViewController
        nextVC.game = sender as? Game
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

