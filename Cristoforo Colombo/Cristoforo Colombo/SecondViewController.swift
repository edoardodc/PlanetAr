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
    
    var cittaStatiUniti = [MapPin]()
    var cittaCanada = [MapPin]()
    var cittaMessico = [MapPin]()
    var cittaArgentina = [MapPin]()
    var cittaCile = [MapPin]()
    var cittaUruguay = [MapPin]()
    var cittaColombia = [MapPin]()
    var cittaBrasile = [MapPin]()
    var cittaCuba = [MapPin]()
    var cittaBolivia = [MapPin]()
    
    
    let stati = ["Stati Uniti", "Canada", "Messico", "Argentina", "Cile", "Bolivia", "Perù", "Colombia", "Uruguay", "Brasile", "Cuba"]
    

    
    
    var tableViewData = [cellData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        initialLocation()
        cellDataSetUp()
        cittaDati()

        
    }
    
    func initialLocation() {
        let initialLocation = CLLocation(latitude: 19.2542, longitude: -99.127)
        let regionRadius: CLLocationDistance = 15000000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)

    }
    
//////TABLE VIEW DELEGATE - SOURCE DATA////
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
            cell.labelCell?.text = tableViewData[indexPath.section].title
            cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            cell.labelCell.textColor = .white
            let imgName = UIImage(named: tableViewData[indexPath.section].title)
            cell.imageFlag.image = imgName
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! MyCell2
            cell.labelCity?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            cell.labelCity.textColor = .white
            let imgName = UIImage(named: tableViewData[indexPath.section].sectionData[indexPath.row - 1])
            cell.imageCity.image = imgName
            cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            return cell
        }
}
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
            tableViewData[indexPath.section].opened = false
            let section = IndexSet.init(integer: indexPath.section)
            controlRemoveAnnotation(index: indexPath.section)
            tableView.reloadSections(section, with: .none)
        }else{
            tableViewData[indexPath.section].opened = true
            let section = IndexSet.init(integer: indexPath.section)
            controlAddAnnotation(index: indexPath.section)
            tableView.reloadSections(section, with: .none)
        }
    }
    
    
    
}





class MyCell: UITableViewCell {
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
}

class MyCell2: UITableViewCell {
    @IBOutlet weak var imageCity: UIImageView!
    @IBOutlet weak var labelCity: UILabel!
}
