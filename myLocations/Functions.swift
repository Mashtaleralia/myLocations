//
//  Functions.swift
//  myLocations
//
//  Created by Admin on 25.01.2023.
//

import Foundation
func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}
let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
  
    return paths[0]
}()
let CoreDataSaveFailedNotification = Notification.Name("CoreDataSaveFailedNotification")
func fatalCoreDataError(_ error: Error) {
    print("***Fatal error: \(error)")
    NotificationCenter.default.post(name: CoreDataSaveFailedNotification, object: nil)
}
