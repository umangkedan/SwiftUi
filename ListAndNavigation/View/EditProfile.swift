//
//  EditProfile.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 04/05/24.
//

import SwiftUI

struct EditProfile: View {
    @Binding var userProfile : Profile
    var body: some View {
        List{
            HStack{
                Text("Username ")
                Spacer()
                Text($userProfile.username.wrappedValue).foregroundStyle(.secondary)
            }
            .padding(10)
            HStack{
                Text("Liked Place ")
                Spacer()
                Text($userProfile.likedPlace.wrappedValue.rawValue).foregroundStyle(.secondary)
            }.padding(10)
            
            Picker("Preferred Season ", selection: $userProfile.preferredSeason, content: {
                ForEach(Profile.Season.allCases){ season in
                    Text(season.rawValue).tag(season)}
            }).padding(10)
        }
    }
}

#Preview {
    EditProfile(userProfile: .constant(.default))
}
