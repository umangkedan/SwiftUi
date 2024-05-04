//
//  Pageview.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 04/05/24.
//

import SwiftUI

struct Pageview<Page : View > : View {
    var page : [Page]
    var body: some View {
        PageViewController(pages: page).aspectRatio(3/2, contentMode: .fit)
    }
}

#Preview {
    Pageview(page: ModelData().features.map{FeatureCard(landmark: $0)})
}
