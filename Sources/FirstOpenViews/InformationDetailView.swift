//
//  InformationDetailView.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2021 Lucas Zischka. All rights reserved.
//

import SwiftUI

struct InformationDetailView: View {
    
    var title: String
    var subTitle: String
    var image: Image
    var mainColor: Color = Color.blue
    
    var body: some View {
        HStack(alignment: .center) {
            image
                .font(.largeTitle)
                .foregroundColor(mainColor)
                .padding()
                .accessibility(hidden: true)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)
                
                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        
        .padding(.top)
    }
}

struct InformationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InformationDetailView(title: "Car", subTitle: "A car (or automobile) is a wheeled motor vehicle used for transportation.", image: Image(systemName: "car.fill"), mainColor: Color.blue)
            .previewLayout(.sizeThatFits)
    }
}
