//
//  MainViewController.swift
//  examples
//
//  Created by Manuel Colmenero Navarro on 4/11/18.
//  Copyright © 2018 mcolmenero. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var btnMarvel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Examples"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBAction
    @IBAction func clickBtnMarvel(_ sender: Any) {
        let viewController: UIViewController = MarvelViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
