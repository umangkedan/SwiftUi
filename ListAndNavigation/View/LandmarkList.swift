//
//  LandmarkList.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 03/05/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavouritesOnly = false
    
    var filteredLandmarks : [Landmark] {
        modelData.landmarks.filter{ landmark in
            (!showFavouritesOnly || landmark.isFavorite )
        }
    }
    var body: some View {
        NavigationStack{
            List{
                Toggle.init(isOn: $showFavouritesOnly, label: {
                    Text("Favourites only")
                })
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label : {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }.animation(.easeInOut , value: filteredLandmarks)
            .navigationTitle("Landmarks")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
