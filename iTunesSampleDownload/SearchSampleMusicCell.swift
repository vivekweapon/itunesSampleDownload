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
    
    var downloadButton:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25.0
        
        return button
    }()
    
   
    var shapeLayer:CAShapeLayer = {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.backgroundColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 8.0
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        return shapeLayer
    }()
    
    var trackLayer:CAShapeLayer = {
        
        let trackLayer = CAShapeLayer()
        trackLayer.lineWidth = 8.0
        trackLayer.fillColor = UIColor.clear.cgColor
        return trackLayer
    }()
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        downloadButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(handleTap)))
        
    }
    
    @objc private func handleTap() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 5
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "downloadProgress")
    }
    
    private func createShapeLayer() {
        let path = UIBezierPath(arcCenter: CGPoint(x: 25, y: 25), radius: 25.0, startAngle:-CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.green.cgColor
        
    }
    
    private func createTrackLayer() {
        let path = UIBezierPath(arcCenter: CGPoint(x: 25, y: 25), radius: 25.0, startAngle:-CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
        trackLayer.path = path.cgPath
        trackLayer.strokeColor = UIColor.gray.cgColor
    }
    private func setUpUI() {
      
        contentView.addSubview(albumTitle)
        contentView.addSubview(artistName)
        contentView.addSubview(downloadButton)
        setAutoLayoutConstraints()
        createTrackLayer()
        createShapeLayer()
        downloadButton.layer.addSublayer(trackLayer)
        downloadButton.layer.addSublayer(shapeLayer)
        
    }
    
    private func setAutoLayoutConstraints() {
        
        albumTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0).isActive = true
        albumTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        albumTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        artistName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0).isActive = true
        artistName.topAnchor.constraint(equalTo: albumTitle.bottomAnchor, constant: 8.0).isActive = true
        
        downloadButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        downloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        downloadButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        downloadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
