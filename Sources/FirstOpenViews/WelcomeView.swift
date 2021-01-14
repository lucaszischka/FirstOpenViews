//
//  WelcomeView.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2021 Lucas Zischka. All rights reserved.
//

import SwiftUI

fileprivate struct WelcomeView: ViewModifier {
    
    @State private var savedAppVersion: String? = UserDefaults.standard.string(forKey: "savedAppVersion")
    @State private var showWelcomeView: Bool = false
    
    fileprivate var imageName: String?
    fileprivate var mainColor: Color = Color.blue
    fileprivate var informationDetailViews: [InformationDetailView]
    
    
    fileprivate func body(content: Content) -> some View {
        content
            .onAppear(perform: checkForUpdate)
            .background(EmptyView()
            .sheet(isPresented: self.$showWelcomeView, content: {
                FirstOpenView(firstOpenType: .welcome, imageName: self.imageName, mainColor: self.mainColor, informationDetailViews: self.informationDetailViews)
            })
            )
    }
    
    private func checkForUpdate() {
        let currentAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        
        if self.savedAppVersion == nil {
            self.showWelcomeView = true
            UserDefaults.standard.set(currentAppVersion, forKey: "savedAppVersion")
            self.savedAppVersion = currentAppVersion
        } else if self.savedAppVersion != currentAppVersion {
            //
        }
    }
}

public extension View {
    func welcomeView(imageName: String? = nil, mainColor: Color = Color.blue, informationDetailViews: [InformationDetailView]) -> some View {
        self.modifier(WelcomeView(imageName: imageName, mainColor: mainColor, informationDetailViews: informationDetailViews))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
            .welcomeView(informationDetailViews: [
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
