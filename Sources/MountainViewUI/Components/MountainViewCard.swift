//
//  MountainViewCard.swift
//
//
//  Created by Paul Frank Pacheco Carpio on 12/08/23.
//

import SwiftUI

@available(iOS 15, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MountainViewCardImage: ViewModifier {
	var isLocal: Bool = false
	var image: String = "https://otakuusamagazine.com/wp-content/uploads/2023/07/knapsack-kid.jpg"

	public func body(content: Content) -> some View {
		VStack(spacing: 0) {
			if isLocal {
				Image(image)
					.resizable()
					.scaledToFill()
			} else {
				AsyncImage(url: URL(string: image)) { image in
					image.resizable()
						.scaledToFill()

				} placeholder: {
					ProgressView()
				}
			}
			content
				
		}
	}
}

public struct MountainCardViewContainer: ViewModifier {
	var cornerRadius: Double = 12
	var padding: Double = 16
	var paddingBetweenCards: Double = 8
	var alignment: HorizontalAlignment = .leading
	public func body(content: Content) -> some View {
		content
		.frame(maxWidth: .infinity, alignment: .leading)
		   .overlay(content: {
			   // outlined variant
			   RoundedRectangle(cornerRadius: cornerRadius).stroke(MountainColor.outline_variant.color)
		   })
		   .background(MountainColor.surface.color)
		   .cornerRadius(cornerRadius)
	}
}

extension View {
	func imageTop(isLocal: Bool = true, image: String) -> some View {
		modifier(MountainViewCardImage(isLocal: isLocal, image: image))
	}
	func cardView(cornerRadius: Double = 12, padding: Double = 16, paddingBetweenCards: Double = 8, alignment: HorizontalAlignment = .leading) -> some View {
		modifier(MountainCardViewContainer(cornerRadius: cornerRadius, padding: padding, paddingBetweenCards: paddingBetweenCards, alignment: alignment))
	}
}

enum Orientation {
	case vertical
	case horizontal
}

// there are 3 styles of cards
// elevated, filled, outlined
@available(iOS 15, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MountainCardView<Image, Content, Footer>{
	var image: () -> Image
	var content: () -> Content
	var footer: () -> Footer
	var orientation: Orientation = .vertical
	var cornerRadius: Double = 12
	var padding: Double = 16
	var paddingBetweenCards: Double = 8
	var alignment: HorizontalAlignment = .leading
}

@available(iOS 15, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension MountainCardView: View
where Image: View, Content: View, Footer: View {
	
	/// Creates a card with an image on top and a footer
	/// - Parameters:
	///   - content: the card's content
	///   - image: a view that holds an image (AsyncImage or Image)
	///   - footer: a view that holds usually buttons
	public init(@ViewBuilder content: @escaping () -> Content,
				@ViewBuilder image: @escaping () -> Image,
				@ViewBuilder footer: @escaping () -> Footer) {
		self.content = content
		self.image = image
		self.footer = footer
	}
	
	/// Creates a card with a content and a footer
	/// - Parameters:
	///   - content: the card's content
	///   - footer: a view that usuarlly holds action buttons
	public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder footer: @escaping () -> Footer) where Image == EmptyView {
		self.content = content
		self.image = {EmptyView()}
		self.footer = footer
	}
	
	/// Creates a card with a content on it
	/// - Parameter content: a view that holds the content
	public init(@ViewBuilder content: @escaping () -> Content) where Image == EmptyView, Footer == EmptyView {
		self.content = content
		self.image = {EmptyView()}
		self.footer = {EmptyView()}
	}

	public var body: some View {
		if orientation == .vertical {
			 VStack {
				image()
				VStack(alignment: alignment) {
					content()
					footer()
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(padding)
			}
			   .overlay(content: {
				   // outlined variant
				   RoundedRectangle(cornerRadius: cornerRadius).stroke(MountainColor.outline_variant.color)
			   })
			   .background(MountainColor.surface.color)
			   .cornerRadius(cornerRadius)
		} else {
			 HStack {
				
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			   .overlay(content: {
				   // outlined variant
				   RoundedRectangle(cornerRadius: cornerRadius).stroke(MountainColor.outline_variant.color)
			   })
			   .background(MountainColor.surface.color)
			   .cornerRadius(cornerRadius)
		}
	}
}

@available(iOS 15, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct MountainViewCardExample<Content: View>: View {
	var cornerRadius: Double = 12
	var padding: Double = 16
	var paddingBetweenCards: Double = 8
	var alignment: HorizontalAlignment = .leading
	var image: () -> Content
	
	init(image: @escaping () -> Content) {
		self.image = image
	}
	
	public var body: some View {
		VStack(alignment: alignment) {
			Text("Headline").font(.MountainView.relative(.medium, size: 28, relativeTo: .headline))
			Text("Subhead").font(.MountainView.relative(.medium, size: 16, relativeTo: .subheadline))
			Text("Supporting text")
			HStack {
				Spacer()
				MountainViewButton(text: "Action", action: {}, buttonStyle: MountainOutlinedButtonStyle())
				MountainViewButton(text: "Action", action: {}, buttonStyle: MountainFillButtonStyle())
			}
		}
		.padding(16)
	}
}

struct MountainViewCard_Previews: PreviewProvider {
	static var previews: some View {
		let threeColumnGrid = [GridItem(.flexible())]
		return ScrollView {
			LazyVGrid(columns: threeColumnGrid, spacing: 20) {
				MountainCardView {
					Text("Makinohara Shoko")
						.font(.MountainView.relative(.medium, size: 28, relativeTo: .headline))
				}
				MountainCardView {
					Text("Rascal Does Not Dream of a Dreaming Girl").font(.MountainView.relative(.medium, size: 28, relativeTo: .headline))
				} footer: {
					HStack {
						Spacer()
						MountainViewButton(text: "GO", action: {
							
						}, buttonStyle: MountainFillButtonStyle())
					}
				}

				MountainCardView {
					Text("Rascal Does Not Dream in Knapsack Girl").font(.MountainView.relative(.medium, size: 28, relativeTo: .headline))
				} image: {
					AsyncImage(url: URL(string: "https://otakuusamagazine.com/wp-content/uploads/2023/07/knapsack-kid.jpg")) { image in
						image.resizable()
							.scaledToFill()
					} placeholder: {
						ProgressView()
					}
					
				} footer: {
					MountainViewButton(text: "XD", action: {
						
					}, buttonStyle: MountainFillButtonStyle())
				}
				MountainCardView {
					Text("Headline").font(.MountainView.relative(.medium, size: 28, relativeTo: .headline))
					Text("Subhead").font(.MountainView.relative(.medium, size: 16, relativeTo: .subheadline))
					Text("Supporting text")
				} image: {
					AsyncImage(url: URL(string: "https://otakuusamagazine.com/wp-content/uploads/2023/07/knapsack-kid.jpg")) { image in
						image.resizable()
							.scaledToFill()
					} placeholder: {
						ProgressView()
					}
					
				} footer: {
					HStack {
						Spacer()
						MountainViewButton(text: "XD", action: {
							
						}, buttonStyle: MountainOutlinedButtonStyle())
						MountainViewButton(text: "XD", action: {
							
						}, buttonStyle: MountainFillButtonStyle())
					}
				}
			}
		}
			.preferredColorScheme(.dark)
	}
}
