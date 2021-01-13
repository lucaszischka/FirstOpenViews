//
//  WelcomeView.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2021 Lucas Zischka. All rights reserved.
//

import SwiftUI

struct WelcomeView: ViewModifier {
    
    var imageName: String?
    var mainColor: Color = Color.blue
    var informationDetailViews: [InformationDetailView]
    
    @State private var savedAppVersion: String? = UserDefaults.standard.string(forKey: "savedAppVersion")
    @State private var showWelcomeView: Bool = false
    
    func body(content: Content) -> some View {
        content
            .onAppear(perform: checkForUpdate)
            .background(EmptyView()
            .sheet(isPresented: self.$showWelcomeView, content: {
                FirstOpenView(firstOpenType: .welcome, imageName: self.imageName, mainColor: self.mainColor, informationDetailViews: self.informationDetailViews)
            })
            )
    }
    
    func checkForUpdate() {
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

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
            .modifier(WelcomeView(informationDetailViews: [
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
            ]))
    }
}
