//
//  MovesListViewController.swift
//  Pokedex
//
//  Created by Guilherme Rosa on 08/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MovesListViewController: UIViewController {
    
    @IBOutlet weak var moveTableView: UITableView!
    
    let requestMaker = RequestMaker()
    var moveList = [Move]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.configTable()
        self.fetchData()
    }
    
    private func configTable(){
        self.moveTableView.delegate = self
        self.moveTableView.dataSource = self
    }
}

extension MovesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moveTbViewCell", for: indexPath)
        
        if let moveCell = cell as? MoveTableViewCell {
            moveCell.config(with: self.moveList[indexPath.row])
        }
        
        return cell
    }
}

extension MovesListViewController: UITableViewDelegate {
}

extension MovesListViewController {
    
    func fetchData(){
        requestMaker.make(withEndPoint: .moves){
            (moveList: [Move]) in
            self.moveList = moveList
            DispatchQueue.main.async {
                self.moveTableView.reloadData()
            }
        }
    }
}
