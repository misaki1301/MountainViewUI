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
	case outline_variant
	case on_surface_variant
	case on_surface
	case secondary_container
	case on_secondary_container
	
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
			case .outline_variant:
				return Color("outline_variant", bundle: .myPackage)
			case .on_surface:
				return Color("on_surface", bundle: .myPackage)
			case .on_surface_variant:
				return Color("on_surface_variant", bundle: .myPackage)
			case .on_secondary_container:
				return Color("on_secondary_container", bundle: .myPackage)
			case .secondary_container:
				return Color("secondary_container", bundle: .myPackage)
				
		}
	}
}

enum MountainFontColor {
	case primary
	case secondary
}
