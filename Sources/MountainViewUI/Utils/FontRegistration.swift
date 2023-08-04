//
//  File.swift
//  
//
//  Created by Paul Frank Pacheco Carpio on 3/08/23.
//

import Foundation
import UIKit
import CoreGraphics
import CoreText
import SwiftUI

public enum FontError: Error {
	case failedToRegisterFont
}

func registerFont(named name: String) throws {
	guard let asset = NSDataAsset(name: "Fonts/\(name)", bundle: .module),
		  let provider = CGDataProvider(data: asset.data as NSData),
		  let font = CGFont(provider),
		  CTFontManagerRegisterGraphicsFont(font, nil) else {
		throw FontError.failedToRegisterFont
	}
}

struct MountainViewFont {
	public let name: String
	
	private init(named name: String) {
		self.name = name
		do {
			try registerFont(named: name)
		} catch {
			let reason = error.localizedDescription
			fatalError("Failed to register font: \(reason)")
		}
	}
	
	public static let black = MountainViewFont(named: "Roboto-Black")
	public static let regular = MountainViewFont(named: "Roboto-Regular")
	public static let bold = MountainViewFont(named: "Roboto-Bold")
	public static let light = MountainViewFont(named: "Roboto-Light")
	public static let medium = MountainViewFont(named: "Roboto-Medium")
	public static let thin = MountainViewFont(named: "Roboto-Thin")
}

extension Font {
	public struct MountainView {
		/// Returns a fixed-size font of the specified style.
			   static func fixed(_ style: MountainViewFont, size: CGFloat) -> Font {
				 return Font.custom(style.name, fixedSize: size)
			  }

			  /// Returns a relative-size font of the specified style.
			   static func relative(_ style: MountainViewFont, size: CGFloat, relativeTo
			  textStyle: Font.TextStyle) -> Font {
				 return Font.custom(style.name, size: size, relativeTo: textStyle)
			  }
	}
}
