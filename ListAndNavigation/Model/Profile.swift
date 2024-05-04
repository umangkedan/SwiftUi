//
//  Profile.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 04/05/24.
//

import Foundation

struct Profile : Equatable {
    var username : String
    var id : Int
    var preferredSeason : Season
    var goalDate = Date()
    var likedPlace : Landmark.Category
    
    static let `default` = Profile(username: "veer_kumar",id: 1 ,preferredSeason: Season.summer , likedPlace: Landmark.Category.lakes)

    
    enum Season: String, CaseIterable, Identifiable {
            case spring = "🌷"
            case summer = "🌞"
            case autumn = "🍂"
            case winter = "☃️"


            var id: String { rawValue }
        }
}
