//
//  EffectView.swift
//  MyCamera5
//
//  Created by 芥川浩平 on 2023/12/04.
//

import SwiftUI

struct EffectView: View {
    @Binding var isShowSheet: Bool
    @State private var showImage: UIImage?
    @State private var filterSelectNumber = 0

    let captureImage: UIImage
    //フィルタ名を列挙した配列(Array)
    //0.モノクロ
    //1.Chrome
    //2.Fade
    //3.Instant
    //4.Noir
    //5.Process
    //6.Tonal
    //7.Transfer
    //8.SepiaTone
    private let filterArray = [
        "CIPhotoEffectMono",
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CISepiaTone"
    ]

    var body: some View {
        VStack {
            Spacer()

            if let showImage {
                Image(uiImage: showImage)
                    .resizable()
                    .scaledToFit()
            }

            Spacer()
            Button {
                let filterName = filterArray[filterSelectNumber]
                filterSelectNumber += 1
                if filterSelectNumber == filterArray.count {
                    filterSelectNumber = 0
                }

                let rotate = captureImage.imageOrientation
                let inputImage = CIImage(image: captureImage)

                guard let effectFilter = CIFilter(name: filterName) else {
                    return
                }
                effectFilter.setDefaults()
                effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
                guard let outputImage = effectFilter.outputImage else {
                    return
                }
                let ciContext = CIContext(options: nil)
                guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
                    return
                }
                showImage = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)

            } label: {
                Text("エフェクト")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .padding()

            if let showImage {
               let shareImage = Image(uiImage: showImage)
                ShareLink(item: shareImage, subject: nil, message: nil,
                          preview: SharePreview("Photo", image: shareImage)) {
                    Text("シェア")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .multilineTextAlignment(.center)
                        .background(.blue)
                        .foregroundColor(.white)
                }
                    .padding()
            }
            Button {
                isShowSheet.toggle()
            } label: {
                Text("閉じる")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .onAppear {
            showImage = captureImage
        }
    }
}

#Preview {
    EffectView(
        isShowSheet: .constant(true), captureImage: UIImage(named: "preview_use")!
    )
}
