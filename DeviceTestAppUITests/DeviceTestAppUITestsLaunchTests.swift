//
//  DeviceTestAppUITestsLaunchTests.swift
//  DeviceTestAppUITests
//
//  Created by Leandro Sousa on 2024. 09. 21..
//

import XCTest

final class DeviceTestAppUITestsLaunchTests: XCTestCase {

	override class var runsForEachTargetApplicationUIConfiguration: Bool {
		true
	}

	override func setUpWithError() throws {
		continueAfterFailure = false
	}

	@MainActor
	func testLaunchAndVerifyUI() throws {
		let app = XCUIApplication()
		app.launch()

		// Example: Wait for an element to appear, such as a "Device ID" label
		let deviceIDLabel = app.staticTexts["Device ID:"]
		XCTAssertTrue(deviceIDLabel.exists, "The Device ID label should be visible on launch")

		// Example: Capture a screenshot after interacting with the UI
		let attachment = XCTAttachment(screenshot: app.screenshot())
		attachment.name = "Launch Screen with Device ID"
		attachment.lifetime = .keepAlways
		add(attachment)
	}
}
