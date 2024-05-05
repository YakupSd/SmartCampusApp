//
//  TabbarView.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//

import SwiftUI

struct TabbarView: View {
    @StateObject var vm = TabbarViewModel()
    @State private var selectedTab = 0
    @State var isShowingScanner:Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
           HomeView()
                .tabItem {
                    Image(selectedTab != 0 ? "homeTabWhite" : "homeTab")
                }
                .tag(0)

            Button(action: {
                isShowingScanner = true
            }, label: {
                Text("QR OKUT")
                    .font(.setCustomFont(name: .PoppinsBold,size: 50))
                    .foregroundColor(.black)
            })
                .tabItem {
                    Image(vm.tab2Image)
                }
                .tag(1)

            ProfileView(vmLogin: LoginViewModel())
                .tabItem {
                    Image(selectedTab != 0 ? "profileGreen" : "profile")
                }
                .tag(2)
        }
        .sheet(isPresented: $isShowingScanner) {
            QRCodeReader()
        }
       
        .background(Color.red)
    }
}

#Preview {
    TabbarView()
}



import SwiftUI
import AVFoundation

struct QRCodeReader: UIViewControllerRepresentable {
    @State var scannedCode: String = ""
    @State var isShowingScanner: Bool = false
    @State var LicenseSerialNo: String = ""
    @State var plate: String = ""
    @State var tc: String = ""
    @State var plateCountryCode: String = ""
    @State var LicenseDocumentCode: String = ""
    @State var readingSuccessful: Bool = false
    
    
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

                // QR kodu başarıyla tarandığında, Coordinator içindeki parseScannedCode fonksiyonunu kullanarak değerleri ayır
                let parsedValues = self.parseScannedCode(scannedCode: stringValue)
                self.parent.LicenseSerialNo = String(parsedValues.LicenseSerialNo.dropFirst(2))
                self.parent.plate = String(parsedValues.plate.dropFirst(2))
                self.parent.tc = parsedValues.tc
                self.parent.plateCountryCode = self.extractCountryCode(from: parsedValues.plate)
                self.parent.LicenseDocumentCode = self.extractLicenseCode(from: parsedValues.LicenseSerialNo)

                parent.isShowingScanner = false
                parent.readingSuccessful = true
            }
        }

        func parseScannedCode(scannedCode: String) -> (LicenseSerialNo: String, plate: String, tc: String) {
            let components = scannedCode.components(separatedBy: "-")

            guard components.count == 3 else {
                return ("Hatalı Format", "", "")
            }

            let LicenseSerialNo = components[0]
            let plate = components[1]
            let tc = components[2]

            return (LicenseSerialNo, plate, tc)
        }
        
        func extractCountryCode(from plate: String) -> String {
            let numericCharacters = plate.prefix { char in
                char.isNumber
            }
            return String(numericCharacters)
        }
        
        func extractLicenseCode(from licenseSerialNo: String) -> String {
            let letters = licenseSerialNo.prefix { char in
                char.isLetter
            }
            return String(letters)
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

