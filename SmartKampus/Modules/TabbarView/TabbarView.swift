//
//  TabbarView.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//

import SwiftUI

struct TabbarView: View {
    @StateObject var vm = TabbarViewModel()
    @StateObject var vmLogin: LoginViewModel
    @State private var selectedTab = 0
    @State var isShowingScanner:Bool = false
    @State private var scannedCode: String?
    var body: some View {
        TabView(selection: $selectedTab) {
           HomeView()
                .tabItem {
                    Image(selectedTab != 0 ? "homeTabWhite" : "homeTab")
                }
                .tag(0)

            Button("Scan QR Code") {
                self.isShowingScanner = true
            }
            .padding()
            .sheet(isPresented: $isShowingScanner) {
                QRCodeReader(scannedCode: $scannedCode, isShowingScanner: $isShowingScanner, readingSuccessful: .constant(true))
            }
                .tabItem {
                    Image(vm.tab2Image)
                }
                .tag(1)

            ProfileView(vmLogin: vmLogin)
                .tabItem {
                    Image(selectedTab != 0 ? "profileGreen" : "profile")
                }
                .tag(2)
        }
      
        .background(Color.red)
    }
}

#Preview {
    TabbarView(vmLogin:LoginViewModel())
}
import SwiftUI
import AVFoundation

struct QRCodeReader: UIViewControllerRepresentable {
    @Binding var scannedCode: String?
    @Binding var isShowingScanner: Bool
    @Binding var readingSuccessful: Bool

    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        var parent: QRCodeReader

        init(parent: QRCodeReader) {
            self.parent = parent
        }

        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            if let metadataObject = metadataObjects.first {
                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                guard let stringValue = readableObject.stringValue else { return }

                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                parent.scannedCode = stringValue

                parent.isShowingScanner = false
                parent.readingSuccessful = true
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<QRCodeReader>) -> UIViewController {
        let viewController = UIViewController()
        let session = AVCaptureSession()

        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return viewController }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: captureDevice)
        } catch {
            return viewController
        }

        if (session.canAddInput(videoInput)) {
            session.addInput(videoInput)
        } else {
            return viewController
        }

        let metadataOutput = AVCaptureMetadataOutput()

        if (session.canAddOutput(metadataOutput)) {
            session.addOutput(metadataOutput)

            metadataOutput.setMetadataObjectsDelegate(context.coordinator, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            return viewController
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = viewController.view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        viewController.view.layer.addSublayer(previewLayer)

        DispatchQueue.global().async {
            session.startRunning()
        }

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<QRCodeReader>) {
        
    }
}

#Preview {
    QRCodeReader(scannedCode: .constant(""), isShowingScanner: .constant(true), readingSuccessful: .constant(true))
}
