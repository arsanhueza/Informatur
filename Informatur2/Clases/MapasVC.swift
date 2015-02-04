//
//  SecondViewController.swift
//  Informatur
//
//  Created by Arturo Sanhueza on 20-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit
import MapKit

class MapasVC: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    var mapa = MKMapView()
    var loca = CLLocationManager()
    var managedObjectContext: NSManagedObjectContext? = nil
    var arra = NSArray()

    override func viewDidLoad() {
        self.title = NSLocalizedString("Places", comment: "")
        
        self.loca.delegate = self
        self.mapa.delegate = self
        self.loca.desiredAccuracy = kCLLocationAccuracyBest
        self.loca.requestAlwaysAuthorization()
        self.loca.startUpdatingLocation()
        var buttonItem = MKUserTrackingBarButtonItem(mapView: self.mapa)
        self.navigationItem.rightBarButtonItem = buttonItem
        self.mapa.userInteractionEnabled = true
        self.mapa.showsPointsOfInterest = true
        
        var lo =  CLLocationCoordinate2D(latitude: -41.316667, longitude: -72.983333)
        var theRegion : MKCoordinateRegion = MKCoordinateRegionMake(lo, MKCoordinateSpanMake(0.5, 0.5))
        
        self.mapa.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.mapa.setUserTrackingMode(.None, animated: true)
        self.view.addSubview(self.mapa)

        var defolto = NSUserDefaults.standardUserDefaults()
        let idi = defolto.valueForKey("idioma") as NSString

        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        self.managedObjectContext = appDelegate.managedObjectContext
        
        var error: NSError? = nil
        var fReq: NSFetchRequest = NSFetchRequest(entityName: "Mapas")
        fReq.predicate = NSPredicate(format: "idioma = %@", idi)
        var sorter: NSSortDescriptor = NSSortDescriptor(key: "nombre" , ascending: false)
        fReq.sortDescriptors = [sorter]
        fReq.returnsObjectsAsFaults = false
        self.arra  = self.managedObjectContext!.executeFetchRequest(fReq, error:&error)!

        self.mapa.setRegion(theRegion, animated: true)

        for Mapas in self.arra{
            
            let  x = Mapas.valueForKey("x") as CLLocationDegrees
            let y = Mapas.valueForKey("y") as CLLocationDegrees
            
            var informatur =  CLLocationCoordinate2D(latitude:x, longitude:y)
            var ma = MapPin(coordinate: informatur, title:Mapas.nombre, subtitle:Mapas.detalle)
            self.mapa.addAnnotation(ma)

        }
        super.viewDidLoad()
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