//
//  ViewController.swift
//  MagicTravel
//
//  Created by Suprabhat kumar on 03/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countriesTableView: UITableView?
    
    var countries: [String] = ["India", "USA", "Australia", "New Zealand", "UK", "France", "Italy", "Germany", "Spain", "China"]
    
    var countriesContinent: [String: String] = [
        "India": "Asia",
        "USA": "North America",
        "Australia": "Australia",
        "New Zealand": "Australia",
        "UK": "Europe",
        "France": "Europe",
        "Italy": "Europe",
        "Germany": "Europe",
        "Spain": "Europe",
        "China": "Asia"
    ]
    
    struct Constants {
        static let cellIdentifier = "Cell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countriesTableView?.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellConfiguration = tableViewCell.defaultContentConfiguration()
        let country = countries[indexPath.row]
        cellConfiguration.text = country
        cellConfiguration.secondaryText = countriesContinent[country]
        tableViewCell.contentConfiguration = cellConfiguration
        return tableViewCell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Index \(indexPath) selected")
    }
}
