//
//  TrackCell.swift
//  MediaPlayer
//
//  Created by Exrhan Selmani on 17/02/2020.
//  Copyright © 2020 Erxhan Selmani. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    static let identifier = "TrackCell"
    
    let artistLabel     = UILabel(frame: .zero)
    let titleLabel      = UILabel(frame: .zero)
    let downloadButton  = UIButton(frame: .zero)
    let labelsStack     = UIStackView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(track: Track, downloaded: Bool) {
        artistLabel.text   = track.artist
        titleLabel.text    = track.title
        
//        var showDownloadControls = false
        
        selectionStyle = downloaded ? UITableViewCell.SelectionStyle.gray : UITableViewCell.SelectionStyle.none
        downloadButton.isHidden = downloaded
    }
    
    private func configure() {
        contentView.addSubViews(labelsStack, downloadButton)
        labelsStack.addSubViews(artistLabel, titleLabel)
        
        let padding: CGFloat = 12
        
        let avalaibleSize = contentView.frame.size
        
        let testWidth = avalaibleSize.width * 80 / 100
        let testWidth2 = avalaibleSize.width * 20 / 100
        
        NSLayoutConstraint.activate([
            labelsStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            labelsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            labelsStack.widthAnchor.constraint(equalToConstant: avalaibleSize.width * 80 / 100),
            labelsStack.heightAnchor.constraint(equalToConstant: avalaibleSize.height),
            
//            artistLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -padding),
//            artistLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
//
//            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: padding),
//            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            
            downloadButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            downloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            downloadButton.widthAnchor.constraint(equalToConstant: avalaibleSize.width * 20 / 100),
            downloadButton.heightAnchor.constraint(equalToConstant: avalaibleSize.height),
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

protocol TrackCellDelegate {
    func downloadTapped(_ cell: TrackCell)
}
