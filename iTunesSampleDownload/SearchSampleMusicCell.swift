//
//  SearchSampleMusicCell.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 13/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import Foundation
import UIKit

class SearchSampleMusicCell:UITableViewCell {
    
    var albumTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        title.sizeToFit()
        return title
    }()
    
    var artistName:UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "HelveticaNeue-Thin", size: 13.0)
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor.red
        title.sizeToFit()
        return title
    }()
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        
        
    }
    
    private func setUpUI() {
        contentView.addSubview(albumTitle)
        contentView.addSubview(artistName)
        setAutoLayoutConstraints()
    }
    
    private func setAutoLayoutConstraints() {
        
        albumTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0).isActive = true
        albumTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        albumTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        artistName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0).isActive = true
        artistName.topAnchor.constraint(equalTo: albumTitle.bottomAnchor, constant: 8.0).isActive = true
        
    }
}
