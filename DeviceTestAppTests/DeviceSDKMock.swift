//
//  DeviceSDKMock.swift
//  DeviceTestAppTests
//
//  Created by Leandro Sousa on 2024. 09. 21..
//

import Foundation
import DeviceSDK
@testable import DeviceTestApp

public class DeviceSDKMock {
	static var mockedDeviceID: String?
	static var shouldThrowError: Bool = false

	public static func getDeviceID() async throws -> String {
		if shouldThrowError {
			throw DeviceSDK.ErrorHandler.DeviceSDKError.deviceIDGenerationFailed
		}
		return mockedDeviceID ?? "MockDeviceID"
	}
}
