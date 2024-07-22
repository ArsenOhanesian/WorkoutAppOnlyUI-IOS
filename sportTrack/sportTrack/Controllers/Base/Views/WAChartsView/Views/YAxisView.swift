//
//  WABarView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

final class YAxisView: WABaseView{
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]){
        
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        (0...9).reversed().forEach {
            let label = UILabel()
            label.font = R.Fonts.helvelticaRegular(with: 9)
            label.textColor = R.Colors.inactive
            label.textAlignment = .right
            label.text = "\($0*10)" // TODO: Remake with bigger value
            
            stackView.addArrangedSubview(label)
        }
    }
}

extension YAxisView{
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
}
