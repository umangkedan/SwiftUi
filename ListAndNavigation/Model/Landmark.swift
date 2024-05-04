//
//  Landmark.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 03/05/24.
//

import Foundation
import CoreLocation
import SwiftUI

struct Landmark : Codable , Hashable , Identifiable {
        var id: Int
        var name: String
        var park: String
        var state: String
        var description: String
        var isFavorite : Bool
        var isFeatured : Bool
    
    var category: Category
    
       enum Category: String, CaseIterable, Codable , Identifiable {
           case lakes = "Lakes"
           case rivers = "Rivers"
           case mountains = "Mountains"
           
           var id: String { rawValue }
       }

        private var imageName: String
        var image: Image {
            Image(imageName)
        }
    
    var featuredImage : Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

        private var coordinates: Coordinates
        var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }

        struct Coordinates: Hashable, Codable {
            var latitude: Double
            var longitude: Double
        }
}
