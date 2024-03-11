//
//  ReportListView.swift
//  StudentProgressInfo
//
//  Created by admin on 8/3/2024.
//

import SwiftUI
import CoreData
struct ReportListView: View {

    @FetchRequest(entity: ReportEntity.entity(), sortDescriptors: []) var reports: FetchedResults<ReportEntity>
    @Environment(\.managedObjectContext) private var viewContext

    struct Report: Identifiable {
        let id = UUID()
        let studentName: String
        let dateOfBirth: Date
        let physicalAddress: String
        let nextOfKinName: String
        let nextOfKinPhoneNumber: Int
        let gender: String



    }

    var body: some View {
        NavigationView {
            List {
                ForEach(reports) { report in
                    VStack(alignment: .leading) {
                        Text("Student Name: \(report.studentName ?? "")")
                        Text("Date Of Birth: \(report.dateOfBirth ?? Date(), formatter: dateFormatter)")
                        Text("Physical Address: \(report.physicalAddress ?? "")")
                        Text("Next Of Kin Name: \(report.nextOfKinName ?? "")")
                        Text("Next Of Kin Phone Number: \(report.nextOfKinPhoneNumber ?? 0)")
                        Text("Gender: \(report.gender ?? "")")
                    }
                    .contextMenu{
                        Button("Delete"){
                            deleteReport(at: report as! IndexSet)
                        }
                    }
                }
                .onDelete(perform: deleteReport)
            }
            .navigationTitle("Students")
            .navigationBarItems(trailing: EditButton())
        }
    }

    func deleteReport(at offsets: IndexSet) {
        for index in offsets {
            let report = reports[index]
            viewContext.delete(report)
            do {
                try viewContext.save()
            } catch {
                print("Error deleting report: \(error)")
            }
        }
    }
}

// DateFormatter for formatting the event date
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

