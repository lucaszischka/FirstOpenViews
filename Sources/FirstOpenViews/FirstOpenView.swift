//
//  FirstOpenView.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2021 Lucas Zischka. All rights reserved.
//

import SwiftUI

struct FirstOpenView: View {
    
    
    @Environment(\.presentationMode) private var presentationMode
    
    var firstOpenType: FirstOpenType
    
    var imageName: String?
    var mainColor: Color
    var informationDetailViews: [InformationDetailView]
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                if imageName != nil {
                    Image(imageName!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 0.3*geometry.size.width)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .accessibility(hidden: true)
                }
                
                Text(firstOpenType == .welcome ? "Welcome to" : "What's New in")
                    .fontWeight(.black)
                    .font(.system(size: 36))
                
                Text(Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "")
                    .foregroundColor(mainColor)
                    .fontWeight(.black)
                    .font(.system(size: 36))
                
                Spacer()
                
                VStack(alignment: .leading) {
                    ForEach(0..<informationDetailViews.count) { index in
                        informationDetailViews[index]
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                Spacer()
                
                Button(action: {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .background(
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(mainColor)
                        )
                        .padding([.bottom, .horizontal])
                }
            }
        }
    }
}

struct FirstOpenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstOpenView(firstOpenType: .welcome, mainColor: Color.blue, informationDetailViews: [
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
