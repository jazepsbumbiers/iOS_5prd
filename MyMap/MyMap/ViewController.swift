//
//  ViewController.swift
//  MyMap
//
//  Created by Jazeps on 24/04/2018.
//  Copyright © 2018 Jazeps. All rights reserved.
//
import UIKit
import MapKit

class ViewController: UIViewController, VC2Delegate {

    @IBOutlet var mapView: MKMapView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Segue", let vc = segue.destination as? ViewController2{
            vc.delegate = self
        }
    }
    
    func ChangeAnnotation(_ sender: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(sender, forKey: "SwitchOn")
        annoVisibility()
    }
    
    func annoVisibility (){
        let defaults = UserDefaults.standard
        let visible = defaults.bool(forKey: "SwitchOn")
        
        for annotation in mapView.annotations {
            if (annotation.subtitle == "") {
                mapView.view(for: annotation)?.isHidden = visible
            }
        }

//        if let path = Bundle.main.path(forResource: "MapData", ofType: "plist") {
//        var array = NSArray(contentsOfFile: path)
//            for dictionary in array! {
//                if let dict = dictionary as? [String: String] {
//                    let desc = dict["Description"]
//                    if (desc == ""){
//                                mapView.view(for: mapView.annotations)?.isHidden = visible               }
//                }
//            }
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var firstName : String = ""
        var firstDesc : String = ""
        var firstLat : String = ""
        var firstLong : String = ""
        
        var secondName : String = ""
        var secondDesc : String = ""
        var secondLat : String = ""
        var secondLong : String = ""
        
        var thirdName : String = ""
        var thirdDesc : String = ""
        var thirdLat : String = ""
        var thirdLong : String = ""

        
        if let path = Bundle.main.path(forResource: "MapData", ofType: "plist") {
            let array = NSArray(contentsOfFile: path)
           // debugPrint(path)
            if let dict = array {
                let value = dict[0] as! NSDictionary
                firstName = value["Name"] as! String
                firstDesc = value["Description"] as! String
                firstLat = value["Latitude"] as! String
                firstLong = value["Longitude"] as! String
               //debugPrint(firstName)
                
            }
            
            if let dict = array {
                let value = dict[1] as! NSDictionary
                secondName = value["Name"] as! String
                secondDesc = value["Description"] as! String
                secondLat = value["Latitude"] as! String
                secondLong = value["Longitude"] as! String
         //       debugPrint(secondName)
                
            }
            
            if let dict = array {
                let value = dict[2] as! NSDictionary
                thirdName = value["Name"] as! String
                thirdDesc = value["Description"] as! String
                thirdLat = value["Latitude"] as! String
                thirdLong = value["Longitude"] as! String
          //     debugPrint(thirdLong)
                
            }
        }
        
        
        let firstPoint = MKPointAnnotation()
        firstPoint.coordinate = CLLocationCoordinate2D(latitude: Double(firstLat)!, longitude: Double(firstLong)!)
        firstPoint.title = firstName
        firstPoint.subtitle = firstDesc
        
        
        mapView.addAnnotation(firstPoint)
        
        let secondPoint = MKPointAnnotation()
        secondPoint.coordinate = CLLocationCoordinate2D(latitude: Double(secondLat)!, longitude: Double(secondLong)!)
        secondPoint.title = secondName
        secondPoint.subtitle = secondDesc
        
        
        mapView.addAnnotation(secondPoint)
        
        let thirdPoint = MKPointAnnotation()
        thirdPoint.coordinate = CLLocationCoordinate2D(latitude: Double(thirdLat)!, longitude: Double(thirdLong)!)
        thirdPoint.title = thirdName
        thirdPoint.subtitle = thirdDesc
        
        mapView.addAnnotation(thirdPoint)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
           self.annoVisibility()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
