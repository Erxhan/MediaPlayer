//
//  UITableViewExtension.swift
//  MediaPlayer
//
//  Created by Exrhan Selmani on 17/02/2020.
//  Copyright © 2020 Erxhan Selmani. All rights reserved.
//

import UIKit

extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
