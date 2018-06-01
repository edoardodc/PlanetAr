//
//  SecondViewController.swift
//  Cristoforo Colombo
//
//  Created by Edoardo de Cal on 24/05/18.
//  Copyright © 2018 Edoardo de Cal. All rights reserved.
//

import UIKit
import MapKit


struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class MapPin: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}


class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    let stati = ["Stati Uniti", "Canada", "Messico", "Argentina", "Cile", "Bolivia", "Perù", "Colombia", "Uruguay", "Brasile", "Cuba"]
    
    let imgStati = ["StatiUniti", "Canada", "Messico", "Argentina", "Cile", "Bolivia", "Peru", "Colombia", "Uruguay", "Brasile", "Cuba", "Panama"]
    
    var tableViewData = [cellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let initialLocation = CLLocation(latitude: 19.2542, longitude: -99.127)

        let regionRadius: CLLocationDistance = 15000000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius, regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        
            centerMapOnLocation(location: initialLocation)
        
        
        let statiUniti = MapPin(title: "Edolandia",
                              locationName: "Edoardo de Cal",
                              discipline: "citta",
                              coordinate: CLLocationCoordinate2D(latitude: 41.8500300, longitude: -87.6500500))
        mapView.addAnnotation(statiUniti)
        
        tableViewData = [cellData(opened: false, title: "Title 1", sectionData: ["Cell1",                       "Cell2", "Cell3"]), cellData(opened: false, title: "Title 2", sectionData: ["Cell1", "Cell2", "Cell3"])]
        
        
    }
    
    
    
    //////TABLE VIEW DELEGATE - SOURCE DATA////
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stati.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        let imgName = UIImage(named: imgStati[indexPath.row])
        cell.labelCell?.text = stati[indexPath.row]
        cell.imageFlag.image = imgName
        
        return cell
    }

}

class MyCell: UITableViewCell {
    
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
}
