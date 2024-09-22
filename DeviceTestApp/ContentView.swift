//
//  ContentView.swift
//  DeviceTestApp
//
//  Created by Leandro Sousa on 2024. 09. 21..
//

import SwiftUI

struct ContentView: View {
	@StateObject private var viewModel = ContentViewModel()

	var body: some View {
		VStack(spacing: 8) {
			HStack(spacing: 8) {
				Image(systemName: "phone")
					.imageScale(.large)
					.foregroundStyle(.tint)
					.accessibilityIdentifier("phoneIcon")

				Text("Device ID:")
					.accessibilityIdentifier("deviceIDLabel")
			}
			Text(viewModel.deviceID)
				.accessibilityIdentifier("deviceIDValue")
		}
		.padding(8)
		.alert(isPresented: $viewModel.showAlert) {
			Alert(
				title: Text("Error"),
				message: Text(viewModel.alertMessage),
				dismissButton: .default(Text("OK"))
			)
		}
	}
}

#Preview {
	ContentView()
}
