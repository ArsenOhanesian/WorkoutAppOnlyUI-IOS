//
//  NavigationBarController.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import UIKit

final class NavigationBarController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: R.Colors.titleGray,
            .font: R.Fonts.helvelticaRegular(with: 17)
        ]
        
        navigationBar.addBottomBorder(with: R.Colors.separator, height: 1)
        
    }
}
