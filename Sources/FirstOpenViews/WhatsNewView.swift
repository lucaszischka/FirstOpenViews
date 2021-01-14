//
//  WhatsNewView.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2021 Lucas Zischka. All rights reserved.
//

import SwiftUI

fileprivate struct WhatsNewView: ViewModifier {
    
    @State private var savedAppVersion: String? = UserDefaults.standard.string(forKey: "savedAppVersion")
    @State private var showWhatsNewView: Bool = false
    
    fileprivate var imageName: String?
    fileprivate var mainColor: Color = Color.blue
    fileprivate var informationDetailViews: [InformationDetailView]
    
    
    fileprivate func body(content: Content) -> some View {
        content
            .onAppear(perform: checkForUpdate)
            .background(EmptyView()
            .sheet(isPresented: self.$showWhatsNewView, content: {
                FirstOpenView(firstOpenType: .whatsNew, imageName: self.imageName, mainColor: self.mainColor, informationDetailViews: self.informationDetailViews)
            })
            )
    }
    
    private func checkForUpdate() {
        let currentAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        
        if self.savedAppVersion == nil {
            //
        } else if self.savedAppVersion != currentAppVersion {
            self.showWhatsNewView = true
            UserDefaults.standard.set(currentAppVersion, forKey: "savedAppVersion")
            self.savedAppVersion = currentAppVersion
        }
    }
}

public extension View {
    func whatsNewView(imageName: String? = nil, mainColor: Color = Color.blue, informationDetailViews: [InformationDetailView]) -> some View {
        self.modifier(WhatsNewView(imageName: imageName, mainColor: mainColor, informationDetailViews: informationDetailViews))
    }
}

struct WhatsNewView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
            .whatsNewView(informationDetailViews: [
                InformationDetailView(title: "Car",
                                      subTitle: "A car (or automobile) is a wheeled motor vehicle used for transportation.",
                                      image: Image(systemName: "car.fill")
                ),
                InformationDetailView(title: "Airplane",
                                      subTitle: "An airplane or aeroplane (informally plane) is a powered, fixed-wing aircraft that is propelled forward by thrust from a jet engine, propeller or rocket engine.",
                                      image: Image(systemName: "airplane")
                ),
                InformationDetailView(title: "Tram",
                                      subTitle: "A tram (in North America streetcar or trolley) is a rail vehicle that runs on tramway tracks along public urban streets.",
                                      image: Image(systemName: "tram.fill")
                )
            ])
    }
}
