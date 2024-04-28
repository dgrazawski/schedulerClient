//
//  SearchPlansView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 17/04/2024.
//

import SwiftUI
import SwiftData

struct SearchPlansView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    @State private var searchValue = ""
   // @State private var listOfUnis = ["UMK", "UW", "Politechnika Poznanska", "Akademia morska w Gdyni"]
    @State private var listOfUnis = [SearchListModel(), SearchListModel(), SearchListModel(), SearchListModel()]
    var searchResults: [SearchListModel] {
        if searchValue.isEmpty {
            return listOfUnis
        } else {
            return listOfUnis.filter{
                $0.universityName.contains(searchValue) || $0.facultyName.contains(searchValue) ||
                $0.scheduleName.contains(searchValue)
            }
        }
    }
    var body: some View {
        NavigationStack{
            VStack{
                
                List {
                    ForEach(searchResults, id: \.self) { uni in
                            PlanTileView(plan: uni)
                    }
                }
                .searchable(text: $searchValue, prompt: "Szukaj planu")
            
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Text("Search for Plans")
                        .font(.title)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan QR", systemImage: "qrcode.viewfinder") {
                        print("placeholder")
                    }
                }
            }
            .padding()
        }
        
        
    }
}

#Preview {
    SearchPlansView()
}
