//
//  StationDetailViewController.swift
//  YoubikePractice
//
//  Created by apple on 2018/6/20.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import UIKit
import GoogleMaps
class StationDetailViewController: UIViewController {
    
    var lat: Double? = 0
    
    var lng: Double? = 0
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMapView()
        // Do any additional setup after loading the view.
        backBtn.addTarget(self, action: #selector(click(_:)), for: .touchDown)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIUtils.lockOrientation(.all)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIUtils.lockOrientation(.portrait)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func click(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func initMapView(){
        mapView.isMyLocationEnabled = true
        let camera = GMSCameraPosition.camera(withLatitude: lat ?? 0.0, longitude: lng ?? 0.0, zoom: 12.0)
        mapView.camera = camera
        mapView.mapType = .normal
        // The myLocation attribute of the mapView may be null
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
        }
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat ?? 0.0, longitude: lng ?? 0.0)
        marker.map = mapView
    }

}
