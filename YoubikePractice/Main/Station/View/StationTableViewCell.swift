//
//  StationTableViewCell.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/19.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit

struct StationListViewCellModel {
    let arText: String
    let countText: String
}

class StationTableViewCell: UITableViewCell {

    @IBOutlet weak var arText: UILabel!
    
    @IBOutlet weak var countText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension StationTableViewCell: CellConfigurable {
    typealias ViewData = StationListViewCellModel

    func setup(viewModel: StationListViewCellModel) {
        arText.text = viewModel.arText
        countText.text = viewModel.countText
    }
}
