//
//  CategoryHome.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 03/05/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    @State private var userProfile = Profile.default
    
    var body: some View {
        NavigationSplitView {
            List {
                Pageview(page: modelData.features.map { FeatureCard(landmark: $0) })
                                  .listRowInsets(EdgeInsets())
        
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileSummary(profile: $userProfile)
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    CategoryHome()
        .environment(ModelData())
}
