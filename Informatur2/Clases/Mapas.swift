//
//  SecondViewController.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 20-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit
import MapKit

class Mapas: UIViewController,MKMapViewDelegate {
var mapa = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mapa"
        self.mapa.delegate = self
        self.mapa.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        
        var theSpan : MKCoordinateSpan = MKCoordinateSpanMake(0.5, 0.5)
        var lo =  CLLocationCoordinate2D(latitude: -41.316667, longitude: -72.983333)
        
        var informatur =  CLLocationCoordinate2D(latitude: -41.317373, longitude: -72.983444)
        var frutillar =  CLLocationCoordinate2D(latitude: -41.136667, longitude: -73.025)
        var llanquihuea =  CLLocationCoordinate2D(latitude: -41.26, longitude: -73.006667)
        
        
        var theRegion : MKCoordinateRegion = MKCoordinateRegionMake(lo, theSpan)
       
        var ma = MapPin(coordinate: informatur, title: "Informatur", subtitle:"Fono: +56 (65) 237 773")
        var ma2 = MapPin(coordinate: frutillar, title: "Frutillar", subtitle:"Comuna")
        var ma3 = MapPin(coordinate: llanquihuea, title: "Llanquihue", subtitle:"Comuna")

        
        self.mapa.setRegion(theRegion, animated: true)
        self.mapa.addAnnotation(ma2)
        self.mapa.addAnnotation(ma)
        self.mapa.addAnnotation(ma3)
        self.view.addSubview(self.mapa)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

class MapPin : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}