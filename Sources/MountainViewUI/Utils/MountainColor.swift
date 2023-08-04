//
//  MountainColor.swift
//  
//
//  Created by Paul Pacheco on 26/07/23.
//

import Foundation
import SwiftUI

enum MountainColor {
	
	case primary
	case secondary
	case tertiary
	case surface
	case background
	case error
	
	var color: Color {
		switch self {
			case .primary:
				return Color("primary", bundle: .myPackage)
			case .secondary:
				return Color("secondary", bundle: .myPackage)
			case .tertiary:
				return Color("tertiary", bundle: .myPackage)
			case .surface:
				return Color("surface", bundle: .myPackage)
			case .background:
				return Color("background", bundle: .myPackage)
			case .error:
				return Color("error", bundle: .myPackage)
		}
	}
}

enum MountainFontColor {
	case primary
	case secondary
}
