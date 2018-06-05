//
//  Extensions.swift
//  Cristoforo Colombo
//
//  Created by Edoardo de Cal on 26/05/18.
//  Copyright © 2018 Edoardo de Cal. All rights reserved.
//

import UIKit
import MapKit

extension UIView {
    func animateBounceRepeat() {
        self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 3.0,
                       options: [.repeat, .allowUserInteraction],
                       animations: { [weak self] in self!.transform = .identity
            }, completion: nil)
    }
    
    func animateBounce() {
        self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 3.0,
                       options: [.allowUserInteraction],
                       animations: { [weak self] in self!.transform = .identity
            }, completion: nil)
    }
    
    
    func setupBackgroundColor() {
        UIView.animate(withDuration: 5, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
            self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }) { (Bool) -> Void in
            UIView.animate(withDuration: 5, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                self.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            }, completion: { (Bool) -> Void in
                UIView.animate(withDuration: 5, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                    self.backgroundColor = #colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)
                }, completion: { (Bool) -> Void in
                    UIView.animate(withDuration: 5, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { () -> Void in
                        self.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                    }, completion: { (Bool) -> Void in
                        self.setupBackgroundColor()
                    })
                })
            })
        }
    }
}

extension SecondViewController {
    
    
    
    func cittaDati() {
        cittaStatiUniti = [
            MapPin(title: "New York City", locationName: "New York", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 40.712775, longitude: -74.005973)),
            MapPin(title: "Los Angeles", locationName: "California", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 34.052234, longitude: -118.243685)),
            MapPin(title: "San Francisco", locationName: "California", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 37.774929, longitude: -122.419416)),
            MapPin(title: "San Josè", locationName: "California", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 37.338208, longitude: -121.886329)),
            MapPin(title: "Honolulu", locationName: "Hawaii", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 21.306944, longitude: -157.858333)),
            MapPin(title: "Dallas", locationName: "Texas", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 32.7830600, longitude: -96.8066700)),
            MapPin(title: "Chicago", locationName: "Illinois", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 41.8500300, longitude: -87.6500500)),
            MapPin(title: "Washington", locationName: "Washington DC", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 38.8951100, longitude: -77.0363700)),
            MapPin(title: "Miami", locationName: "Florida", discipline: "StatiUniti", coordinate: CLLocationCoordinate2D(latitude: 25.761681, longitude: -80.191788))
        ]
        

        
        cittaCile = [MapPin(title: "Santiago del Cile", locationName: "Cile", discipline: "Cile", coordinate: CLLocationCoordinate2D(latitude: -33.448890, longitude: -70.669265))]
        
        
        cittaCanada = [
            MapPin(title: "Toronto", locationName: "Canada", discipline: "Canada", coordinate: CLLocationCoordinate2D(latitude: 43.653226, longitude: -79.383184)),
            MapPin(title: "Ottawa", locationName: "Canada", discipline: "Canada", coordinate: CLLocationCoordinate2D(latitude: 45.421530, longitude: -75.697193)),
            MapPin(title: "Vancouver", locationName: "Canada", discipline: "Canada", coordinate: CLLocationCoordinate2D(latitude: 49.282729, longitude: -123.120738)),
        ]
        
        cittaCuba = [MapPin(title: "L'Avana", locationName: "Cuba", discipline: "Cuba", coordinate: CLLocationCoordinate2D(latitude: 23.113592, longitude: -82.366596))]

        
        cittaBrasile = [
            MapPin(title: "Rio de Janeiro", locationName: "Brasile", discipline: "Brasile", coordinate: CLLocationCoordinate2D(latitude: -22.906847, longitude: -43.172896)),
            MapPin(title: "Brasilia", locationName: "Brasile", discipline: "Brasile", coordinate: CLLocationCoordinate2D(latitude: -15.7797200, longitude: -47.9297200)),
        ]
        
        cittaMessico = [MapPin(title: "Citta del Capo", locationName: "Messico", discipline: "Messico", coordinate: CLLocationCoordinate2D(latitude: 19.432608, longitude: -99.133208))]

        
        cittaArgentina = [MapPin(title: "Buenos Aires", locationName: "Argentina", discipline: "Argentina", coordinate: CLLocationCoordinate2D(latitude: -34.6131500, longitude: -58.3772300))]

        
        cittaUruguay = [MapPin(title: "MonteVideo", locationName: "Uruguay", discipline: "Uruguay", coordinate: CLLocationCoordinate2D(latitude: -34.9032800, longitude: -56.1881600))]

        
        cittaBolivia = [MapPin(title: "La Paz", locationName: "Bolivia", discipline: "Bolivia", coordinate: CLLocationCoordinate2D(latitude: -33.425223, longitude: -70.651204))]

        
        
        cittaColombia = [MapPin(title: "Bogotà", locationName: "Colombia", discipline: "Colombia", coordinate: CLLocationCoordinate2D(latitude: 4.710989, longitude: -74.072092))]

    }
    
    func cellDataSetUp() {
        tableViewData = [
            
            cellData(opened: false, title: "Stati Uniti", sectionData: ["NewYork City", "Los Angeles", "Washington", "Miami", "Chicago", "Dallas", "San Jose"]),
            cellData(opened: false, title: "Canada", sectionData: ["Ottawa", "Toronto", "Vancouver"]),
            cellData(opened: false, title: "Messico", sectionData: ["Cittá del Capo"]),
            cellData(opened: false, title: "Cile", sectionData: ["Santiago del Cile"]),
            cellData(opened: false, title: "Argentina", sectionData: ["Buenos Aires"]),
            cellData(opened: false, title: "Brasile", sectionData: ["Brasilia", "Rio de Janeiro"]),
            cellData(opened: false, title: "Cuba", sectionData: ["L'Avana"]),
            cellData(opened: false, title: "Uruguay", sectionData: ["Montevideo"]),
            cellData(opened: false, title: "Bolivia", sectionData: ["La Paz"]),
            cellData(opened: false, title: "Colombia", sectionData: ["Bogotà"]),
            
        ]

    }
    
    func controlAddAnnotation(index: Int) {
        switch index {
        case 0:
            for city in cittaStatiUniti {
                mapView.addAnnotation(city)
            }
            break
        case 1:
            for city in cittaCanada {
                mapView.addAnnotation(city)
            }
            break
        case 2:
            for city in cittaMessico {
                mapView.addAnnotation(city)
            }
            break
        case 3:
            for city in cittaCile {
                mapView.addAnnotation(city)
            }
            break
        case 4:
            for city in cittaArgentina {
                mapView.addAnnotation(city)
            }
            break
        case 5:
            for city in cittaBrasile {
                mapView.addAnnotation(city)
            }
            break
        case 6:
            for city in cittaCuba {
                mapView.addAnnotation(city)
            }
            break
        case 7:
            for city in cittaUruguay {
                mapView.addAnnotation(city)
            }
            break
        case 8:
            for city in cittaBolivia {
                mapView.addAnnotation(city)
            }
            break
        case 9:
            for city in cittaColombia {
                mapView.addAnnotation(city)
            }
            break
        default:
            break
        }
    }
    
    
    func controlRemoveAnnotation(index: Int) {
        switch index {
        case 0:
            for city in cittaStatiUniti {
                mapView.removeAnnotation(city)
            }
            break
        case 1:
            for city in cittaCanada {
                mapView.removeAnnotation(city)
            }
            break
        case 2:
            for city in cittaMessico {
                mapView.removeAnnotation(city)
            }
            break
        case 3:
            for city in cittaCile {
                mapView.removeAnnotation(city)
            }
            break
        case 4:
            for city in cittaArgentina {
                mapView.removeAnnotation(city)
            }
            break
        case 5:
            for city in cittaBrasile {
                mapView.removeAnnotation(city)
            }
            break
        case 6:
            for city in cittaCuba {
                mapView.removeAnnotation(city)
            }
            break
        case 7:
            for city in cittaUruguay {
                mapView.removeAnnotation(city)
            }
            break
        case 8:
            for city in cittaBolivia {
                mapView.removeAnnotation(city)
            }
            break
        case 9:
            for city in cittaColombia {
                mapView.removeAnnotation(city)
            }
            break
        default:
            break
        }
    }
    
}
    

