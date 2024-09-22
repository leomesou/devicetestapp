//
//  DeviceTestAppTests.swift
//  DeviceTestAppTests
//
//  Created by Leandro Sousa on 2024. 09. 21..
//

import Testing
@testable import DeviceTestApp

struct DeviceTestAppTests {

	@Test func testFetchDeviceIDSuccess() async throws {
		// Arrange: Mock success scenario
		DeviceSDKMock.mockedDeviceID = "MockDeviceID-12345"

		let viewModel = ContentViewModel()

		// Act: Wait for the async task to complete
		try await Task.sleep(for: .milliseconds(500)) // Simulate async delay (0.5 seconds)

		// Assert: Check the device ID and alert states
		#expect(viewModel.deviceID == "MockDeviceID-12345")
		#expect(viewModel.showAlert == false)
		#expect(viewModel.alertMessage.isEmpty)
	}

	@Test func testFetchDeviceIDFailure() async throws {
		// Arrange: Mock error scenario
		DeviceSDKMock.shouldThrowError = true

		let viewModel = ContentViewModel()

		// Act: Wait for the async task to complete
		try await Task.sleep(for: .milliseconds(500)) // Simulate async delay (0.5 seconds)

		// Assert: Ensure error handling is working
		#expect(viewModel.deviceID == "Loading...")
		#expect(viewModel.showAlert == true)
		#expect(viewModel.alertMessage == "Failed to generate a unique device ID.")
	}
}
