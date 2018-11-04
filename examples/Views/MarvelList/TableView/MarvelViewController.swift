//
//  MarvelViewController.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import UIKit

class MarvelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    let nibIdentifier: String = "MarvelTableViewCell"
    let cellIdentifier: String = "cellIdentifier"
    
    // Array from data
    var characterListView : CharacterList?
    
    // MARK: System
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Marvel List"
        
        // Make download
        self.downloadData()
        
        self.tableView.register(UINib(nibName: nibIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let characters = characterListView {
            return characters.count()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MarvelTableViewCell
        
        // Build cell
        if let characters = characterListView {
            
            let character = characters.getCharacter(index: indexPath.row)
            
            cell.titleCell.text = character.getName()
            
            if let url = URL(string: character.getImage()){
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        OperationQueue.main.addOperation {
                            cell.imageCell.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt \(indexPath.row)")
    }
    
    // MARK:- Aux Func
    
    func downloadData() {
        let download = DownloadCharacterList()
        download.execute(onSuccess: {
            self.requestFromRealm()
            
        }, onError: { (error) in
            print(error)
        })
    }
    
    func requestFromRealm() {
        print("requestFromRealm")
    }


}
