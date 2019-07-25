//
//  CSearchController.swift
//  MyAnimeDatabase
//
//  Created by Developer on 23/07/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class CSearchController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    var personnage = Personnage()
    var personnageFiltrer = Personnage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
        setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    func alterLayout() {
        table.tableHeaderView = UIView()
        table.estimatedSectionHeaderHeight = 50
        navigationItem.titleView = searchBar
        searchBar.showsScopeBar = false
        searchBar.placeholder = "Search Animal by Name"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personnageFiltrer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableCell
        cell.CellLabel.text = personnageFiltrer[indexPath.row].anime + "-" + personnage[indexPath.row].fullname
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let character : PersonnageElement = personnage[indexPath.row] {
            performSegue(withIdentifier: "CharaceterView", sender: character)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CharaceterView" {
            let targetEvent = segue.destination as! CView
            let output = sender as! MyAnimeDatabase.PersonnageElement
            targetEvent.input = output
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText == "") {
            personnageFiltrer = personnage
        } else {
            personnageFiltrer = personnage.filter({$0.fullname.contains(searchText)})
        }
        table.reloadData()
    }
    
    func getCharacters() {
        if let path = Bundle.main.path(forResource: "characters", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
                personnage = try! JSONDecoder().decode(Personnage.self, from: data)
                personnageFiltrer = personnage
            } catch {
                print("cant get characters.json")
            }
        }
    }
    

}
