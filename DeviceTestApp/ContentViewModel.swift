//
//  ContentViewModel.swift
//  DeviceTestApp
//
//  Created by Leandro Sousa on 2024. 09. 21..
//

import SwiftUI
import Combine
import DeviceSDK

class ContentViewModel: ObservableObject {
	@Published var deviceID: String = "Loading..."
	@Published var showAlert: Bool = false
	@Published var alertMessage: String = ""

	init() {
		fetchDeviceID()
	}

	func fetchDeviceID() {
		Task { [weak self] in
			guard let self else {
				print("Error: self is nil")
				return
			}
			do {
				let fetchedDeviceID = try await DeviceManager.getDeviceID()
				print("Device ID: \(fetchedDeviceID)")
				await MainActor.run {
					self.deviceID = fetchedDeviceID
				}
			} catch let error as DeviceSDK.ErrorHandler.DeviceSDKError {
				let errorMessage = DeviceSDK.ErrorHandler.handleError(error)
				print("Error: \(errorMessage)")
				await MainActor.run {
					self.alertMessage = errorMessage
					self.showAlert = true
				}
			} catch {
				let errorMessage = DeviceSDK.ErrorHandler.handleError(.unknownError)
				print("Error: \(errorMessage)")
				await MainActor.run {
					self.alertMessage = errorMessage
					self.showAlert = true
				}
			}
		}
	}
}
