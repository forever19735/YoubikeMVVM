//
//  UserViewModel.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/15.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import Foundation


protocol ViewPressedDelegate {
    func userPressed(at index: IndexPath)
}

class StationViewModel {
    
    private var cellViewModels: [StationListViewCellModel] = [StationListViewCellModel]() {
        didSet {
            self.reloadTableViewClousure?()
        }
    }
    
    private var stations: [StationInfo] = [StationInfo]()
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLodingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertCloure?()
        }
    }
    
    var selectedStation: StationInfo?
    
    var reloadTableViewClousure: (()->())?
    var updateLodingStatus: (()->())?
    var showAlertCloure: (()->())?
    
    func initFetch() {
        self.isLoading = true
        _ = DataManager.shared.requestStaion({ (data) in
            self.isLoading = false
            self.processFetchedStaition(stations: data.result.results)

        }) { (error) in
            self.alertMessage = error.localizedDescription
            print(error.localizedDescription)
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> StationListViewCellModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel(station: StationInfo) -> StationListViewCellModel {
        return StationListViewCellModel(arText: station.ar, countText: station.tot)
    }
    
    private func processFetchedStaition(stations: [StationInfo]){
        self.stations = stations
        var valueArray = [StationListViewCellModel]()
        for station in stations {
            valueArray.append(createCellViewModel(station: station))
        }
        self.cellViewModels = valueArray
    }
}

extension StationViewModel: ViewPressedDelegate {
    func userPressed(at indexPath: IndexPath){
        let station = self.stations[indexPath.row]
        self.selectedStation = station
    }
}
