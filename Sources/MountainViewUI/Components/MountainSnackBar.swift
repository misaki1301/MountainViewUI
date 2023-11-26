//
//  MountainSnackBar.swift
//
//
//  Created by Paul Frank Pacheco Carpio on 23/11/23.
//

import SwiftUI

struct MountainSnackBar: View {
    var body: some View {
		HStack {
			Text("Single-line snackbar with action")
				.font(.MountainView.relative(.medium, size: 14, relativeTo: .body))
				.foregroundColor(MountainColor.on_surface.color)
				.padding(.leading, 16)
			Spacer()
			Button(action: {}, label: {
				Text("Button")
					.font(.MountainView.relative(.medium, size: 14, relativeTo: .body))
					.foregroundColor(MountainColor.primary.color)
			})
			Button(action: {}, label: {
				Image(systemName: "xmark")
					.foregroundColor(MountainColor.on_surface.color)
			})
			.frame(width: 24, height: 24)
			.padding(.trailing, 8)
		}
		.frame(height: 48)
		.background(MountainColor.surface.color)
		.cornerRadius(4)
		.padding(.horizontal, 32)
    }
}

#Preview {
    MountainSnackBar()
}
