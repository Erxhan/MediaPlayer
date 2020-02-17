//
//  SearchViewController.swift
//  MediaPlayer
//
//  Created by Erxhan Selmani on 16/02/2020.
//  Copyright © 2020 Erxhan Selmani. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let tableView = UITableView()
    var tracks: [Track] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        configureSearchController()
        //        for index in 1...100 {
        //            tracks.append(Track(index: index, artist: "Snoop Dog \(index)", title: "What's my name \(index)", url: URL(string: "http://ok.com")!))
        //        }
        
        // Do any additional setup after loading the view.
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.rowHeight     = 80
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.removeExcessCells()
        tableView.register(TrackCell.self, forCellReuseIdentifier: TrackCell.identifier)
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater                   = self
        searchController.obscuresBackgroundDuringPresentation   = false
        searchController.searchBar.placeholder                  = "Search Tracks or Artists"
        navigationItem.searchController                         = searchController
        definesPresentationContext                              = true
    }
    
    func updateUI(with tracks: [Track]) {
        self.tracks = tracks
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    = tableView.dequeueReusableCell(withIdentifier: TrackCell.identifier) as! TrackCell
        let track   = tracks[indexPath.row]
        cell.set(track: track, downloaded: false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let track = tracks[indexPath.row]
    }
}


extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchTerm = searchController.searchBar.text, searchTerm != "" else { return }
        NetworkManager.shared.getTracks(searchTerm: searchTerm) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let tracks):
                    print(tracks)
                    self.updateUI(with: tracks)
                case .failure(let error):
                    print(error)
            }
        }
        print(searchTerm)
    }
    
    
}
