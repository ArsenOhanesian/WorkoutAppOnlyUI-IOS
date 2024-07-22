//
//  TimerPercentView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

extension TimerView{
    class PercentView: WABaseView{
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helvelticaRegular(with: 23)
            label.textColor = R.Colors.titleGray
            label.textAlignment = .center
            return label
            
        }()
        
        private let subtitleLabel: UILabel = {
           let label = UILabel()
            label.font = R.Fonts.helvelticaRegular(with: 10)
            label.textColor = R.Colors.inactive
            return label
        }()
        
        func setupConfigure(title: String, andValue value: Int){
            subtitleLabel.text = title
            percentLabel.text = "\(value)%"
        }
        
    }
    
}

extension TimerView.PercentView{
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
        
        [percentLabel,subtitleLabel].forEach { stackView.addArrangedSubview($0)}
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
    
    
}
