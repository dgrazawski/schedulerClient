//
//  SearchPlansView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 17/04/2024.
//

import SwiftUI
import SwiftData
import CodeScanner

struct SearchPlansView: View {
    @ObservedObject private var network: NetworkManager = NetworkManager()
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    @State private var searchValue = ""
   // @State private var listOfUnis = ["UMK", "UW", "Politechnika Poznanska", "Akademia morska w Gdyni"]
    @State private var listOfUnis: [SearchListModel] = []
    var searchResults: [SearchListModel] {
        if searchValue.isEmpty {
            return listOfUnis
        } else {
            return listOfUnis.filter{
                $0.universityName.lowercased().contains(searchValue.lowercased()) || $0.facultyName.lowercased().contains(searchValue.lowercased()) ||
                $0.scheduleName.lowercased().contains(searchValue.lowercased()) || $0.id.uuidString.lowercased().contains(searchValue)
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
                .searchable(text: $searchValue, prompt: "Search for plan")
                .overlay{
                    if searchResults.isEmpty {
                        ContentUnavailableView("No plans named like this", systemImage: "doc.text.magnifyingglass")
                    }
                }
            
            }
            .sheet(isPresented: $isPresentingScanner) {
                        CodeScannerView(codeTypes: [.qr], simulatedData: "3250b226-e4f7-4a0d-9808-56e4b911f34a") { response in
                            if case let .success(result) = response {
                                scannedCode = result.string
                                isPresentingScanner = false
                                searchValue = scannedCode ?? ""
                            }
                        }
                    }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Text("Search for Plans")
                        .font(.title)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan QR", systemImage: "qrcode.viewfinder") {
                        isPresentingScanner = true
                    }
                }
            }
            .padding()
        }
        .task {
            let url = URLRequestBuilder().createURL(route: .client, endpoint: .clientGetSchedules)
            let request = URLRequestBuilder().createRequest(method: .get, url: url!)
            network.getDataSearch(request: request!)
            listOfUnis = network.searchList
        }
        
        
    }
}

#Preview {
    SearchPlansView()
}
