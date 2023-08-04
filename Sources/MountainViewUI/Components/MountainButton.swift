//
//  SwiftUIView 2.swift
//  
//
//  Created by Paul Frank Pacheco Carpio on 1/08/23.
//

import SwiftUI

@available(iOS 15, *)
struct MountainViewButton<ButtonStyleType: ButtonStyle>: View {
	var id: String = ""
	var text: String
	var action: () -> Void
	var vertical: Double = 10
	var horizontal: Double = 24
	var buttonStyle: ButtonStyleType
	
	var body: some View {
		Button(action: {}) {
			Text(text)
				.padding(.vertical, vertical)
				.padding(.horizontal, horizontal)
		}
		.buttonStyle(buttonStyle)
		.accessibility(identifier: id)
	}
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			Text("MountainView Buttons")
				.font(.MountainView.relative(.regular, size: 32, relativeTo: .body))
			MountainViewButton(text: "Contained", action: {}, buttonStyle: MountainButtonStyle())
			MountainViewButton(text: "Filled", action: {}, buttonStyle: MountainFillButtonStyle())
			MountainViewButton(text: "Outlined", action: {}, buttonStyle: MountainOutlinedButtonStyle())
		}
    }
}
