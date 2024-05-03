//
//  FavouriteButton.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 03/05/24.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet : Bool
    
    var body: some View {
        Button{
            isSet.toggle()
        } label: {
            Label("Toggle Favourite", systemImage: isSet ? "star.fill" : "star").labelStyle(.iconOnly).foregroundStyle(isSet ? .yellow : .gray)
            
        }
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
