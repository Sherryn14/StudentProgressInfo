//
//  SubmitDescriptionView.swift
//  StudentProgressInfo
//
//  Created by admin on 8/3/2024.
//

import SwiftUI

struct SubmitDescriptionView: View {
    @State private var studentName = ""
    @State private var dateOfBirth = Date()
    @State private var physicalAddress = ""
    @State private var isReportSaved = false // Add a state variable to track report saving
    @State private var emailNme = ""
    @State private var emailName = ""
    @State private var nextOfKinName = ""
    @State private var nextOfKinPhoneNumber = ""
    @State private var gender = ""



    var body: some View {
        Form {
            TextField("student Name", text: $studentName)
            DatePicker("Student Birth", selection: $dateOfBirth, displayedComponents: .date)
          //  TextField("To(Email)", text: $emailNme)
            TextField("Email", text: $emailName)
            TextField("Phone Number", text: $emailNme)
            TextField("Next of Kin", text: $nextOfKinName)
            TextField("Next of Kin Phone Number", text: $nextOfKinPhoneNumber)
            TextField("Gender", text: $gender)
            TextEditor(text: $physicalAddress)
            Button(action: submitReport) {
                Text("Save")
            }
            .disabled(isReportSaved) // Disable button if report is already saved
            if isReportSaved {
                Text("Student Saved") // Display a message indicating report is saved
                    .foregroundColor(.green)
            }
            }
                .navigationTitle("Student")
        }

        func submitReport(){
            submitReport(studentName: studentName, dateOfBirth: dateOfBirth, physicalAddress: physicalAddress)
        }


        func submitReport(studentName: String, dateOfBirth: Date, physicalAddress: String) {
            // Access the managed object context
            let managedObjectContext = CoreDataManager.shared.persistentContainer.viewContext

            // Create a new instance of ReportEntity
            let newReport = ReportEntity(context: managedObjectContext)

            // Set properties of the new report
            newReport.studentName = studentName
            newReport.dateOfBirth = dateOfBirth
            newReport.physicalAddress = physicalAddress

            // Save the managed object context
            do {
                try managedObjectContext.save()
                print("Report saved successfully.")
                isReportSaved = true // Update state variable to indicate report is saved

            } catch {
                print("Failed to save report: \(error.localizedDescription)")
            }
        }


    }



