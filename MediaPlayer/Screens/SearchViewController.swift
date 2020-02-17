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
    var tracks: [Track] = [
        Track(index: 0, artist: "Snoop Dog", title: "What's my name", url: URL(string: "http://ok.com")!),
        Track(index: 0, artist: "Test", title: "Hello", url: URL(string: "http://ok.com")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        
        // Do any additional setup after loading the view.
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeExcessCells()
        tableView.register(TrackCell.self, forCellReuseIdentifier: TrackCell.identifier)
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
