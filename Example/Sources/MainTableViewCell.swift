//
//  MainTableViewCell.swift
//  Example
//
//  Created by DongHeeKang on 06/02/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

import FluidHighlighter

final class MainTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setFluidHighlighter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setFluidHighlighter() {
        fh.enable(normalColor: .white, highlightedColor: UIColor.gray.withAlphaComponent(0.5))
    }
    
}
