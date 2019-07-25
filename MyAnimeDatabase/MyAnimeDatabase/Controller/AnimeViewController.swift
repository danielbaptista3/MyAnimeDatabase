//
//  CSearchController.swift
//  MyAnimeDatabase
//
//  Created by Developer on 23/07/2019.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit

class AnimeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    var anime = Anime()
    var animeFiltrer = Anime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAnimes()
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
        return animeFiltrer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AnimeCell
        cell.titre.text = animeFiltrer[indexPath.row].nom
        cell.sequel.text = animeFiltrer[indexPath.row].sequel
        cell.prequel.text = animeFiltrer[indexPath.row].prequel
        cell.episode.text = String(animeFiltrer[indexPath.row].episode)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let anime : AnimeElement = anime[indexPath.row] {
            performSegue(withIdentifier: "AnimePage", sender: anime)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AnimePage") {
            let targetEvent = segue.destination as! AnimePageController
            let output = sender as! MyAnimeDatabase.AnimeElement
            targetEvent.input = output
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText == "") {
            animeFiltrer = anime
        } else {
            animeFiltrer = anime.filter({$0.nom.contains(searchText)})
        }
        table.reloadData()
    }
    
    func getAnimes() {
        if let path = Bundle.main.path(forResource: "animes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
                anime = try! JSONDecoder().decode(Anime.self, from: data)
                animeFiltrer = anime
            } catch {
                print("cant get animes.json")
            }
        }
    }
    
    
}
