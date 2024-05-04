//
//  EditProfile.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 04/05/24.
//

import SwiftUI

struct EditProfile: View {
    @Binding var userProfile : Profile
    @State private var userInput : String
    @State private var showAlert = false
    
    init(userProfile: Binding<Profile>) {
           _userProfile = userProfile
           _userInput = State(initialValue: userProfile.wrappedValue.username)
       }
    
    var body: some View {
        List{
            HStack{
                Text("Username ")
                Spacer()
                Text($userProfile.username.wrappedValue).foregroundStyle(.secondary).onTapGesture {
                    showAlert = true
                }
                .alert("Enter The New Username", isPresented: $showAlert, actions: {
                   
                    TextField("Enter ", text: $userInput)
                    
                    Button("Ok", action: {
                        $userProfile.wrappedValue = Profile(username: userInput, id: $userProfile.wrappedValue.id + 1, preferredSeason: $userProfile.wrappedValue.preferredSeason, likedPlace: $userProfile.wrappedValue.likedPlace)
                        showAlert = false

                    })
                    Button("Cancel", action: {
                        
                    })
                   
                })
                
                
            }
            .padding(10)
            
            Picker("Preferred Season ", selection: $userProfile.preferredSeason, content: {
                ForEach(Profile.Season.allCases){ season in
                    Text(season.rawValue).tag(season)}
            }).padding(10)
            
            Picker("Liked Place", selection: $userProfile.likedPlace, content: {
                ForEach(Landmark.Category.allCases){
                    category in
                    Text(category.rawValue).tag(category)
                }
            }).padding(10)
        }
    }
}

#Preview {
    EditProfile(userProfile: .constant(.default))
}
