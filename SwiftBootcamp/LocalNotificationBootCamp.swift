//
//  LocalNotificationBootCamp.swift
//  SwiftBootcamp
//
//  Created by Назар Горевой on 07.07.2023.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { succes, error in
            if let error = error {
                print("ErrorL \(error)")
            } else {
                print("Succes")
            }
        }
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification"
        content.subtitle = "This was so easy "
        content.sound = .default
        content.badge = 1
        
        
        // time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 16
//        dateComponents.minute = 11
//        dateComponents.weekday = 2 // 1 - Sunday
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        // location
        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationBootCamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule Notifications") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootCamp()
    }
}
