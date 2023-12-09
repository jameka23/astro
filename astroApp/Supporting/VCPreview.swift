//
//  VCPreview.swift
//  astroApp
//
//  Created by Jameka Echols on 11/19/23.
//

import SwiftUI

struct VCPreview<T: UIViewController>: UIViewControllerRepresentable {
    let viewController: T
    
    init(_ viewControllerBuilder: @escaping () -> T) {
        viewController = viewControllerBuilder()
    }
    
    func makeUIViewController(context: Context) -> T {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: T, context: Context) {}
    
}
