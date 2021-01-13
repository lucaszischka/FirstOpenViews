//
//  ViewExtension.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2021 Lucas Zischka. All rights reserved.
//

import SwiftUI

extension View {
    func whatsNewView(imageName: String? = nil, mainColor: Color = Color.blue, informationDetailViews: [InformationDetailView]) -> some View {
        self.modifier(WhatsNewView(imageName: imageName, mainColor: mainColor, informationDetailViews: informationDetailViews))
    }
    
    func welcomeView(imageName: String? = nil, mainColor: Color = Color.blue, informationDetailViews: [InformationDetailView]) -> some View {
        self.modifier(WelcomeView(imageName: imageName, mainColor: mainColor, informationDetailViews: informationDetailViews))
    }
}
