//
//  ErrorView.swift
//  Catass
//
//  Created by Serhat Sezer on 09/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import UIKit

class ErrorView: UIView {
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    func showError(with message: String) {
        errorLabel.text = message
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
