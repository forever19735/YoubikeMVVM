//
//  StationViewController.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/9.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit


class StationViewController: UIViewController {
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var barsHidden = false
    
    lazy var viewModel: StationViewModel = {
        return StationViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: StationTableViewCell.self)
        
        initVM()
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //判斷往上滑還往下滑
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            setStatusBarHidden(true)
            changeTabBar(hidden: true, animated: true)
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            setStatusBarHidden(false)
            changeTabBar(hidden: false, animated: true)
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    func setStatusBarHidden(_ enable: Bool){
        UIView.animate(withDuration: 0.1) {
            self.barsHidden = enable
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    func changeTabBar(hidden:Bool, animated: Bool){
        let tabBar = self.tabBarController?.tabBar
        let offset = (hidden ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.height - (tabBar?.frame.size.height)! )
        if offset == tabBar?.frame.origin.y {return}
        print("changing origin y position")
        let duration:TimeInterval = (animated ? 0.5 : 0.0)
        UIView.animate(withDuration: duration,
                       animations: {tabBar!.frame.origin.y = offset},
                       completion:nil)
    }
    func initVM() {
        
        viewModel.updateLodingStatus = {[weak self]( ) in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.loadingView.startAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.tableView.alpha = 0.0
                    })
                } else {
                    self?.loadingView.stopAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        self?.tableView.alpha = 1.0
                    })
                }
            }
        }
        
        viewModel.reloadTableViewClousure = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.initFetch()
    }
    
}

extension StationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: StationTableViewCell.self, for: indexPath)
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.setup(viewModel: cellVM)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.userPressed(at: indexPath)
        let detail = StationDetailViewController()
        
        guard let selectedStation = self.viewModel.selectedStation else{return}
        detail.lat = selectedStation.lat?.toDouble()
        detail.lng = selectedStation.lng?.toDouble()
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

extension StationViewController {
    override var prefersStatusBarHidden: Bool {
        return barsHidden
    }
}
