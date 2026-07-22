//
//  File.swift
//  
//
//  Created by Paul Frank Pacheco Carpio on 3/08/23.
//

import Foundation

extension Bundle {
	private class BundleFinder {}
}

extension Bundle {
	static let MountainViewUI = "MountainViewUI_MountainViewUI"
	
	public static let myPackage: Bundle = {
		let bundleNameIOS = MountainViewUI
		let candidates = [
				// Bundle should be here when the package is linked into an App.
				Bundle.main.resourceURL,
				// Bundle should be here when the package is linked into a framework.
				Bundle(for: BundleFinder.self).resourceURL,
				// For command-line tools.
				Bundle.main.bundleURL,
				// Bundle should be here when running previews from a different package
				// (this is the path to "…/Debug-iphonesimulator/").
				Bundle(for: BundleFinder.self)
					.resourceURL?
					.deletingLastPathComponent()
					.deletingLastPathComponent()
					.deletingLastPathComponent(),
				Bundle(for: BundleFinder.self)
					.resourceURL?
					.deletingLastPathComponent()
					.deletingLastPathComponent(),
			]

			for candidate in candidates {
				let bundlePathiOS = candidate?.appendingPathComponent(bundleNameIOS + ".bundle")
				if let bundle = bundlePathiOS.flatMap(Bundle.init(url:)) {
					return bundle
				}
			}
			fatalError("Can't find myPackage custom bundle.")
	}()
}
