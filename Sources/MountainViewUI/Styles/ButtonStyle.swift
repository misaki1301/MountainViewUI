//
//  File.swift
//  
//
//  Created by Paul Frank Pacheco Carpio on 1/08/23.
//

import Foundation
import SwiftUI

extension ButtonStyle where Self == MountainButtonStyle {
	static var outlined: MountainOutlinedButtonStyle {
		MountainOutlinedButtonStyle()
	}
	static var filled: MountainFillButtonStyle {
		MountainFillButtonStyle()
	}
	static var contained: MountainButtonStyle {
		MountainButtonStyle()
	}
}

public struct MountainButtonStyle: ButtonStyle {
	public init() {}
	public func makeBody(configuration: Configuration) -> some View {
		MountainButtonView(configuration: configuration)
	}
}

private extension MountainButtonStyle {
	struct MountainButtonView: View {
		@Environment(\.isEnabled) var isEnabled
		let configuration: MountainButtonStyle.Configuration
		
		var body: some View {
			return configuration
				.label
				.font(.MountainView.relative(.medium, size: 14, relativeTo: .body))
				.foregroundColor(MountainColor.primary.color)
				.background(isEnabled ? MountainColor.background.color : Color.clear)
				.overlay(RoundedRectangle(cornerRadius: 100).stroke(!isEnabled ? MountainColor.primary.color : Color.clear, lineWidth: 2))
				.cornerRadius(100)
				.shadow(radius: isEnabled ? 2 : 0, x: 0, y: isEnabled ? 2 : 0)
				.opacity(configuration.isPressed ? 0.8 : 1.0)
				.scaleEffect(configuration.isPressed ? 0.98 : 1.0)
		}
	}
}

public struct MountainOutlinedButtonStyle: ButtonStyle {
	public init() {}
	public func makeBody(configuration: Configuration) -> some View {
		MountainOutlinedButtonView(configuration: configuration)
	}
}

private extension MountainOutlinedButtonStyle {
	struct MountainOutlinedButtonView: View {
		@Environment(\.isEnabled) var isEnabled
		let configuration: MountainOutlinedButtonStyle.Configuration
		var body: some View {
			return configuration.label
				.font(.MountainView.relative(.medium, size: 14, relativeTo: .body))
				.foregroundColor(MountainColor.primary.color)
				.background(Color.clear)
				.overlay(
					RoundedRectangle(cornerRadius: 100)
						.stroke(MountainColor.primary.color, lineWidth: 2)
				)
				.cornerRadius(100)
				//.shadow(radius: isEnabled ? 2 : 0, x: 0, y: isEnabled ? 2 : 0)
				// make the button a bit more translucent when pressed
				.opacity(configuration.isPressed ? 0.8 : 1.0)
				// make the button a bit smaller when pressed
				.scaleEffect(configuration.isPressed ? 0.98 : 1.0)
		}
	}
}

public struct MountainFillButtonStyle: ButtonStyle {
	public init() {}
	public func makeBody(configuration: Configuration) -> some View {
		MountainFillButtonStyleView(configuration: configuration)
	}
}

private extension MountainFillButtonStyle {
	struct MountainFillButtonStyleView: View {
		@Environment(\.isEnabled) var isEnabled
		let configuration: MountainFillButtonStyle.Configuration
		var body: some View {
			return configuration.label
				.font(.MountainView.relative(.medium, size: 14, relativeTo: .body))
				.foregroundColor(.white)
				.background(isEnabled ? MountainColor.primary.color : Color.clear)
				.overlay(RoundedRectangle(cornerRadius: 100)
					.stroke(!isEnabled ? MountainColor.primary.color : Color.clear, lineWidth: 2))
				.cornerRadius(100)
				//.shadow(radius: isEnabled ? 2 : 0, x: 0, y: isEnabled ? 2 : 0)
				// make the button a bit more translucent when pressed
				.opacity(configuration.isPressed ? 0.8 : 1.0)
				// make the button a bit smaller when pressed
				.scaleEffect(configuration.isPressed ? 0.98 : 1.0)
		}
	}
}
