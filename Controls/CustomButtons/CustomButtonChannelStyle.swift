//
//  ChannelButtonStyle.swift
//  Alert
//
//  Created by Phu Bao on 22/04/2023.
//

import SwiftUI

struct CustomButtonChannelStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
                .frame(width: 10.0)
            Image(systemName: "play")
            configuration.label
                .padding()
                .foregroundColor(.white)
        }
        .background(Color.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            configuration.trigger()
        }
    }
}
