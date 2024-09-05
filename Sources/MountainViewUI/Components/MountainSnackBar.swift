//
//  MountainSnackBar.swift
//
//
//  Created by Paul Frank Pacheco Carpio on 23/11/23.
//

import SwiftUI

struct TextBodyCardModifier: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.font(.MountainView.relative(.medium, size: 14, relativeTo: .body))
			.foregroundColor(MountainColor.inverse_on_surface.color)
			.padding(.leading, 16)
	}
}

extension View {
	func textBodyCard() -> some View {
		modifier(TextBodyCardModifier())
	}
}

struct MountainSnackBar: View {
	var message: String
	var dismissEvent: () -> Void
	var actionButtonText: String
	var action: () -> Void
    var body: some View {
		HStack {
			Text(message)
				.textBodyCard()
			Spacer()
			Button(action: {action()}, label: {
				Text(actionButtonText)
					.font(.MountainView.relative(.medium, size: 14, relativeTo: .body))
					.foregroundColor(MountainColor.inverse_primary.color)
			})
			Button(action: {dismissEvent()}, label: {
				Image(systemName: "xmark")
					.foregroundColor(MountainColor.inverse_on_surface.color)
			})
			.frame(width: 24, height: 24)
			.padding(.trailing, 8)
		}
		.frame(height: 48)
		.background(MountainColor.inverse_surface.color)
		.cornerRadius(4)
		.padding(.horizontal, 32)
		.opacity(1)
		.scaleEffect(x: 1, y: 1)
		.animation(.easeInOut, value: 0.5)
    }
}

struct SnackbarModifier: ViewModifier {
	@Binding var isActive: Bool
	@State var dismissTimer: Timer?
	@State var message: String
	var actionButtonText: String
	var action: () -> Void
	
	func body(content: Content) -> some View {
		ZStack(alignment: .bottom) {
			content
				.animation(.bouncy, value: isActive)
			if isActive {
				MountainSnackBar(message: message, 
								 dismissEvent: dismissEvent,
								 actionButtonText: actionButtonText,
								 action: action)
					.onAppear {
						startDismissTimer()
					}
					.onDisappear {
							dismissTimer?.invalidate()
					}
			}
		}
	}
	
	private func dismissEvent() {
		withAnimation {
			isActive = false
		}
	}
	
	private func startDismissTimer() {
		dismissTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { _ in
				isActive = false
		})
	}
}

extension View {
	func showSnackbar(message: String, isActive: Binding<Bool>, actionButtonText: String, action: @escaping () -> Void) -> some View {
		modifier(SnackbarModifier(isActive: isActive, message: message, actionButtonText: actionButtonText, action: action))
	}
}

struct ExampleSnackbar:View {
	@State var isActive: Bool = false
	var body: some View {
		NavigationView {
			VStack {
				MountainCardView {
					AsyncImage(url: URL(string: "https://dispatch.m.io/wp-content/uploads/2021/09/How-to-create-a-new-team-in-Microsoft-Teams.png")) { image in
						image.resizable()
							.scaledToFill()
							.frame(height: 150)
							.clipped()
					} placeholder: {
						ProgressView()
					}
				} content: {
					Text("The new Microsoft Teams is now generally available")
				} footer: {
					HStack {
						Spacer()
						MountainViewButton(text: "Donwload now", action: {
							isActive.toggle()
							print(isActive)
						}, buttonStyle: .filled)
					}
				}
			}.padding(.horizontal, 24)
			.navigationTitle("Snackbar showcase")
		}.showSnackbar(message: "The service is currently down for maintenance", isActive: $isActive, actionButtonText: "Retry", action: {print("action executed ")})
	}
}

#Preview {
	ExampleSnackbar()
}
