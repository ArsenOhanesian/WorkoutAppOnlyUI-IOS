//
//  SecondaryButton.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import UIKit

public enum WAButtonType{
    case primary
    case secondary
}

final class WAButton: UIButton{
    
    private var type: WAButtonType = .primary
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let iconView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return imgView
    }()
    
    init(with type: WAButtonType){
        super.init(frame: .zero )
        self.type = type
        
        setupViews()
        constraintViews()
        configureAppearance()
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureAppearance()
        
    }
    
    func setTitle(_ title: String?){
        label.text = title
    }
    
}

private extension WAButton{
    func setupViews() {
        addView(label)
        addView(iconView)
    }
    
    func constraintViews() {
        var horizontalOffset: CGFloat {
            switch type{
            case .primary: return 0
            case .secondary: return 10
            }
        }
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor,constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor,constant: horizontalOffset*2)
        ])
    }
    
    func configureAppearance() {
         
        switch type{
        case .primary:
            label.textColor = R.Colors.inactive
            label.font = R.Fonts.helvelticaRegular(with: 13)
            
            iconView.tintColor = R.Colors.inactive
            
        case .secondary:
            backgroundColor = R.Colors.secondary
            layer.cornerRadius = 14
            
            label.textColor = R.Colors.active
            label.font = R.Fonts.helvelticaRegular(with: 15)
            
            iconView.tintColor = R.Colors.active
        }
       
        makeSystem(self)
        
        
        
        
        
        
    
        
    }
}
