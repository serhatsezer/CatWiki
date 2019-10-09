//
//  CatHomeTableViewCell.swift
//  Catass
//
//  Created by Serhat Sezer on 09/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import UIKit

class CatHomeTableViewCell: UITableViewCell {
    
    static var cellReuseID: String {
        return String(describing: self)
    }
    
    // MARK: - Lifecycle methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

}

extension CatHomeTableViewCell {
    func setupUI() {
        
    }
}
