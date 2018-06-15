//
//  ViewController.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 13/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let networkcall = Networking()
    var tracks = [MusicSample]()

    var searchTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var first:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.navigationItem.title = "iMusic Samples"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search iTunes"
        searchController.isActive = true
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(SearchSampleMusicCell.self, forCellReuseIdentifier: "musicCell")
        setUpUI()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   private func setUpUI() {
    
      view.addSubview(searchTableView)
      setUpConstraints()

    }
    
    private func setUpConstraints() {
        
        searchTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        searchTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        searchTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        searchTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }

}

extension SearchViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return  tracks.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sampleMusicCell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! SearchSampleMusicCell
        sampleMusicCell.albumTitle.text = tracks[indexPath.row].artistName
        sampleMusicCell.artistName.text = tracks[indexPath.row].trackName
        return sampleMusicCell
    }
}

extension SearchViewController: UISearchBarDelegate {
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.tracks.removeAll()
        networkcall.downloadSampleTunes(searchString: searchBar.text!) { (response, error) in
            for track in response {
                self.tracks.append(track)
            }
            
            DispatchQueue.main.async(execute: {
                self.searchTableView.reloadData()
            })
        }
        
    }

}
