import XCTest
import ViewInspector
import SwiftUI
@testable import MountainViewUI

final class MountainViewUITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MountainViewUI().text, "Hello, World!")
    }
	
	func testCardView() throws {
		let textCard = "a simple card"
		let card = MountainCardView {
			Text(textCard)
		}
		let value = try card.inspect().find(text: textCard).string()
		XCTAssertEqual(value, textCard)
	}
	
	func testCardViewWithImage() throws {
		let card = MountainCardView {
			VStack {
				Text("Rascal Does Not Dream of a Sister Venturing Out Reveals Visual and Trailer, June 23 Premiere")
					.font(.MountainView.relative(.medium, size: 28, relativeTo: .headline))
				AsyncImage(url: URL(string: "https://i0.wp.com/anitrendz.net/news/wp-content/uploads/2023/03/rascaldoesnotdreamofasisterventuringout_mainvisual-1-e1679805501133.jpg?resize=696%2C391&ssl=1")) { image in
					image.resizable()
						.scaledToFill()
				} placeholder: {
					ProgressView()
				}
				Text("The Rascal Does Not Dream of a Sister Venturing Out anime has received a main visual and a trailer. It was also announced that it will premiere in Japanese theaters on June 23.").font(.MountainView.relative(.regular, size: 16, relativeTo: .body))
			}
		} footer: {
			HStack {
				MountainViewButton(text: "Get tickets", action: {}, buttonStyle: MountainFillButtonStyle())
				MountainViewButton(text: "Learn more", action: {}, buttonStyle: MountainOutlinedButtonStyle())
				Spacer()
				Image(systemName: "ellipsis").rotationEffect(.degrees(90))
			}
		}
		
		let buttonTickets = try card.inspect().find(button: "Get tickets")
		let buttonLearn = try card.inspect().find(button: "Learn more")
		XCTAssertNotNil(buttonTickets)
		XCTAssertNotNil(buttonLearn)
	}
}
