//
//  CatDetailView.swift
//  Catass
//
//  Created by Serhat Sezer on 07/10/2019.
//  Copyright © 2019 Serhat Sezer. All rights reserved.
//

import UIKit

class CatDetailView: UIView {
    private lazy var catImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.axis = .vertical
        $0.spacing = 8
        return $0
    }(UIStackView(arrangedSubviews: [self.catImageView, self.titleLabel]))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

private extension CatDetailView {
    func commonInit() {
        addSubview(stackView)
        configureLayout()
    }
    
    func configureLayout() {
        
    }
}
