//
//  CellConfigurable.swift
//  YoubikePractice
//
//  Created by john.lin on 2019/4/18.
//  Copyright © 2019年 Johnny. All rights reserved.
//

import Foundation

protocol CellConfigurable {
    associatedtype ViewData
    func setup(viewModel: ViewData)
}
