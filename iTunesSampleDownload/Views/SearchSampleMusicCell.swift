//
//  SearchSampleMusicCell.swift
//  iTunesSampleDownload
//
//  Created by Vivekananda Cherukuri on 13/06/18.
//  Copyright © 2018 Vivekananda Cherukuri. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

protocol downloadDelegate:class {
    func didDownloadTapped(with index:Int)
}
class SearchSampleMusicCell:UITableViewCell {
    
    weak var delegate:downloadDelegate?
    var  animation = CABasicAnimation()
    var albumTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        title.sizeToFit()
        return title
    }()
    
    var albumIamgeView:UIImageView = {
       let imageview = UIImageView()
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 8.0
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
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
        button.setImage(UIImage(named: "download"), for: .normal)
        //button.tintColor = UIColor.blue
        
        return button
    }()
    
    var downloadProgressLabel:UILabel = {
        let label = UILabel()
       // label.text = "0%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.textColor = UIColor.blue
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 9.0)
        return label
    }()
    
   
    var shapeLayer:CAShapeLayer = {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.backgroundColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 8.0
        //shapeLayer.strokeEnd = 0
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
        shapeLayer.isHidden = true
        shapeLayer.isHidden = true
        setUpUI()
        downloadButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(handleTap)))
        
    }
    
    @objc private func handleTap() {

        self.delegate?.didDownloadTapped(with: self.tag)
        
    }
    
    private func createShapeLayer() {
        let path = UIBezierPath(arcCenter: CGPoint(x: 25, y: 25), radius: 25.0, startAngle:-CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        
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
        contentView.addSubview(albumIamgeView)
        downloadButton.addSubview(downloadProgressLabel)
        setAutoLayoutConstraints()
        createTrackLayer()
        createShapeLayer()
        downloadButton.layer.addSublayer(trackLayer)
        downloadButton.layer.addSublayer(shapeLayer)
        
    }
    
    private func setAutoLayoutConstraints() {
        
        albumIamgeView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0).isActive = true
        albumIamgeView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        albumIamgeView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        albumIamgeView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true

        
        albumTitle.leadingAnchor.constraint(equalTo: albumIamgeView.leadingAnchor, constant: 58.0).isActive = true
        albumTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        albumTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
        
        artistName.leadingAnchor.constraint(equalTo: albumIamgeView.leadingAnchor, constant: 58.0).isActive = true
        artistName.topAnchor.constraint(equalTo: albumTitle.bottomAnchor, constant: 8.0).isActive = true
        
        downloadButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        downloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        downloadButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        downloadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        downloadProgressLabel.centerYAnchor.constraint(equalTo: downloadButton.centerYAnchor).isActive = true
        downloadProgressLabel.centerXAnchor.constraint(equalTo: downloadButton.centerXAnchor).isActive = true
        
    }
    
    func configureCell(sample:MusicSample,download:MusicDownload?,downloaded:Bool){
       
        albumTitle.text = sample.trackName
        artistName.text = sample.artistName
        albumIamgeView.kf.setImage(with: sample.artworkUrl)
        if(downloaded == true) {
            shapeLayer.isHidden = true
            shapeLayer.isHidden = true
        }
        
    }
    
    func updateDisplay(progress: Float, totalSize : String) {
        shapeLayer.strokeEnd = CGFloat(progress)
        if(progress == 1.0){
           
            downloadButton.setImage(UIImage(named: "downloadSuccess"), for: .normal)
            downloadProgressLabel.isHidden = true
            shapeLayer.isHidden = true
            trackLayer.isHidden = true
            
        }
        else {
            downloadButton.setImage(nil, for: .normal)
        }
        downloadProgressLabel.text = String(format: "%.1f%%", progress * 100)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
