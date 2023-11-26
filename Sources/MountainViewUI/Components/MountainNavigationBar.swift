//
//  SwiftUIView 2.swift
//  
//
//  Created by Paul Frank Pacheco Carpio on 19/11/23.
//

import SwiftUI

@available(iOS 15, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MountainNavigationBar: View {
	@State var selectedTab = 0
	public var body: some View {
		ZStack(alignment: .bottom) {
//			TabView(selection: $selectedTab,
//					content:  {
//				Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(0)
//				Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(1)
//			})
			//ZStack {
			HStack(spacing: 32) {
					ForEach((TabbedItems.allCases), id: \.self) { item in
						Button {
							selectedTab = item.rawValue
						} label: {
							MountainTabItem(imageName: item.iconName, title: item.title, isActive: selectedTab == item.rawValue)
						}
					
				}
			}
		}
		.frame(maxWidth: .infinity)
		.frame(height: 80)
		.ignoresSafeArea()
		.background(MountainColor.surface.color)
		//.cornerRadius(35)
    }
}

enum TabbedItems: Int, CaseIterable {
	case home = 0
	case favorite
	case chat
	case profile
	
	var title: String {
		switch self {
			case .home:
				return "Home"
			case .favorite:
				return "Favorite"
			case .chat:
				return "Chat"
			case .profile:
				return "Profile"
		}
	}
	var iconName: String {
		switch self {
			case .home:
				return "house.fill"
			case .favorite:
				return "star.fill"
			case .chat:
				return "bubble.fill"
			case .profile:
				return "person.fill"
		}
	}
}

extension MountainNavigationBar {
	func MountainTabItem(imageName: String, title: String, isActive: Bool) -> some View {
		VStack(spacing: 10) {
			Spacer()
			if isActive {
				VStack {
					Image(systemName: imageName)
						.resizable()
						.renderingMode(.template)
						.foregroundColor(MountainColor.on_secondary_container.color)
						.frame(width: 24, height: 24)
				}
				.frame(width: 64, height: 32)
				.background(MountainColor.secondary_container.color)
				.cornerRadius(16)
				Text(title)
					.font(.MountainView.fixed(isActive ? .bold : .regular, size: 14))
					.foregroundColor(MountainColor.on_surface.color)
			} else {
				VStack {
					Image(systemName: imageName)
						.resizable()
						.renderingMode(.template)
						.foregroundColor(MountainColor.on_surface_variant.color)
						.frame(width: 24, height: 24)
				}
				.frame(width: 64, height: 32)
				Text(title)
					.font(.MountainView.fixed(isActive ? .bold : .regular, size: 14))
					.foregroundColor(MountainColor.on_surface_variant.color)
			}
			Spacer()
		}
		.frame(minWidth: 48)
		//.frame(minWidth: isActive ? .infinity : 48)
		//.cornerRadius(30)
	}
}

#Preview {
    MountainNavigationBar()
}
