//
//  Location+CoreDataClass.swift
//  myLocations
//
//  Created by Admin on 28.01.2023.
//
//

import Foundation
import CoreData
import MapKit

@objc(Location)
public class Location: NSManagedObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    public var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
        
    }
    public var subtitle: String? {
        return category
    }
    public var hasPhoto: Bool {
        return photoID != nil
    }
    var photoURL: URL {
        assert(photoID != nil, "No photo ID set")
        let fileName = "Photo-\(photoID!.intValue).jpg"
        return applicationDocumentsDirectory.appendingPathComponent(fileName)
    }
    var photoImage: UIImage? {
        print(photoURL.path)

        return UIImage(contentsOfFile: photoURL.path)
       
    }
    class func nextPhotoID() -> Int {
        let userDefaults = UserDefaults.standard
        let currentID = userDefaults.integer(forKey: "PhotoID") + 1
        userDefaults.set(currentID, forKey: "PhotoID")
        userDefaults.synchronize()
        return currentID
    }
    func removePhotoFile() {
        if hasPhoto {
            do {
                try FileManager.default.removeItem(at: photoURL)
            } catch {
                print("error removing file: \(error)")
            }
        }
    }
}
