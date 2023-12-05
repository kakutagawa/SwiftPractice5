//
//  SafariView.swift
//  MyOkashi5
//
//  Created by 芥川浩平 on 2023/12/05.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        <#code#>
    }
}
