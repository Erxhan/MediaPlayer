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
    
    let artistLabel     = BodyLabel(frame: .zero)
    let titleLabel      = TitleLabel(frame: .zero)
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
        artistLabel.text   = track.artistName
        titleLabel.text    = track.trackName
        downloadButton.setImage(SFSymbols.download, for: .normal)
        
//        var showDownloadControls = false
        
        selectionStyle = downloaded ? UITableViewCell.SelectionStyle.gray : UITableViewCell.SelectionStyle.none
        downloadButton.isHidden = downloaded
    }
    
    private func configure() {
        contentView.addSubViews(labelsStack, downloadButton)
        labelsStack.addArrangedSubview(artistLabel)
        labelsStack.addArrangedSubview(titleLabel)
        
        labelsStack.axis = .vertical
        labelsStack.distribution = .fillEqually
        
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 12
        
        let avalaibleSize = contentView.frame.size
        
        NSLayoutConstraint.activate([
            labelsStack.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            labelsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            labelsStack.widthAnchor.constraint(equalToConstant: avalaibleSize.width * 80 / 100),
            labelsStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            
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
