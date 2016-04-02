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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    // MARK: Properties
    
    var locationManager: CLLocationManager!
    var locations: [Business]?
    var lastLocation : CLLocationCoordinate2D!
    var initialLocationSet = false
    
    // MARK: Outlets
    
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()
        
        if let places = locations {
            for place in places{
                addAnnotationAtCoordinate(place.name!,
                                          coordinate: CLLocationCoordinate2D(latitude: place.latitude! as CLLocationDegrees,
                                            longitude: place.longitude! as CLLocationDegrees))
            }//for
        }// if let
        
    } // viewDidLoad
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let annotations = [mapView.userLocation]
        if !initialLocationSet{ // only zoom in on initial location once
            mapView.showAnnotations(annotations, animated: true)
            initialLocationSet = true
        }
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        let annotations = [mapView.userLocation, view.annotation!]
        mapView.showAnnotations(annotations, animated: true)
    }
    
    func goToLocation(location: CLLocation){
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }

    func addAnnotationAtCoordinate(name: String, coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = name
        mapView.addAnnotation(annotation)
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }

/*
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     // this is to continuously center map on user's location
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(location.coordinate, span)
            mapView.setRegion(region, animated: false)
        }
    }
 */
    
    @IBAction func backToPreviousViewController(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
