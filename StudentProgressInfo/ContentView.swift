//
//  ContentView.swift
//  StudentProgressInfo
//
//  Created by admin on 8/3/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var isSubmitDescriptionViewPresented = false
    @State private var isReportListViewPresented = false

    var body: some View {
        NavigationView {

            ZStack{
                
                Image("MCRI logo") // Replace with your image name
                       .resizable()
                       .scaledToFill()

                       .opacity(0.2) // Adjust opacity as needed
                VStack {
                    NavigationLink(destination: SubmitDescriptionView(), isActive: $isSubmitDescriptionViewPresented) {
                        EmptyView()
                    }
                    Button(action: {
                        isSubmitDescriptionViewPresented = true
                    }) {
                        Text("Add New Student")
                            .bold()
                            .foregroundColor(.blue)
                            .fontWeight(.heavy)
                            .font(.largeTitle)
                    }
                    .padding()

                    NavigationLink(destination: ReportListView(), isActive: $isReportListViewPresented) {
                        EmptyView()
                    }
                    Button(action: {
                        isReportListViewPresented = true
                    }) {
                        Text("View Student Records")
                            .bold()
                            .foregroundColor(.blue)
                            .fontWeight(.heavy)
                            .font(.largeTitle)
                    }
                    .padding()
                }
                .navigationTitle("Student Menu")
            }
        }
    }
}
struct BackgroundImageView: View {
  var body: some View {
    Image("MCRI logo") // Replace with your image name
      .resizable()
      .scaledToFill()
      .edgesIgnoringSafeArea(.all)
      .opacity(0.5) // Adjust opacity as needed
  }
}


