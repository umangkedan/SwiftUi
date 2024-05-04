//
//  ProfileSummary.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 04/05/24.
//

import SwiftUI

struct ProfileSummary: View {
  @Environment(ModelData.self) var modelData
  @Binding var profile : Profile
  @Environment(\.editMode) var editMode
  @State private var isPresenting = false
    
    var body: some View {
        NavigationSplitView{
            ScrollView{
                HStack{
                    Text("User Profile").font(.largeTitle).bold()
                    Spacer()
                    Button("Edit", action: {
                       isPresenting = true
                    }).sheet(isPresented: $isPresenting, content: {
                        EditProfile(userProfile: $profile)
                    })
                }
                Divider()
                VStack(alignment: .leading,spacing: 20 , content: {
                    Text(profile.username).font(.title).bold()
                    Text("Preferred Season -\(profile.preferredSeason.id)").bold()
                    Text("Goal Date - \(profile.goalDate.description)").bold()
                    Text("Preferred Places - \(profile.likedPlace.rawValue)").bold()
                    
                })
            }.padding(20)
        } detail: {
            Text("navigate")
        }
    }
}
#Preview {
    ProfileSummary(profile: .constant(.default)).environment(ModelData())
}
