//
//  CoreDataManager.swift
//  StudentProgressInfo
//
//  Created by admin on 8/3/2024.
//

import Foundation
import CoreData
class CoreDataManager {
    static let shared = CoreDataManager()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StudentProgressInfo") // Replace "YourDataModel" with your actual data model name
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // Save a new report to Core Data
    func saveReport(eventName: String, eventDate: Date, eventDescription: String, nextOfKinName: String, nextOfKinPhoneNumber: Int64, gender: String) {
        let context = persistentContainer.viewContext
        let newReport = ReportEntity(context: context)
        newReport.studentName = eventName
        newReport.dateOfBirth = eventDate
        newReport.physicalAddress = eventDescription
        newReport.nextOfKinName = nextOfKinName
        newReport.nextOfKinPhoneNumber = nextOfKinPhoneNumber
        newReport.gender = gender

        saveContext()
    }

    // Fetch all reports from Core Data
    func fetchReports() -> [ReportEntity] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ReportEntity> = ReportEntity.fetchRequest()
        do {
            let reports = try context.fetch(fetchRequest)
            return reports
        } catch {
            print("Error fetching reports: \(error.localizedDescription)")
            return []
        }
    }

    // Delete a report from Core Data
    func delete(_ report: ReportEntity) {
        let context = persistentContainer.viewContext
        context.delete(report)
        saveContext()
    }
}

