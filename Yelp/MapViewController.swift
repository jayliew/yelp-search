//
//  MapViewController.swift
//  Yelp
//
//  Created by Jay Liew on 4/1/16.
//  Copyright © 2016 Jay S. Liew. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: Properties
    
    var locationManager: CLLocationManager!
    
    // MARK: Outlets
    
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()
        
        let centerLocation = CLLocation(latitude: 37.37503, longitude: -122.0559737)
        goToLocation(centerLocation)
        
        let long = -122.0559737 as CLLocationDegrees
        let lat = 37.37503 as CLLocationDegrees
        
        addAnnotationAtCoordinate(CLLocationCoordinate2D(latitude: lat, longitude: long))
    }
    
    func goToLocation(location: CLLocation){
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }

    func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Sup beyatch"
        mapView.addAnnotation(annotation)
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: false)
        }
    }
    
    @IBAction func backToPreviousViewController(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
