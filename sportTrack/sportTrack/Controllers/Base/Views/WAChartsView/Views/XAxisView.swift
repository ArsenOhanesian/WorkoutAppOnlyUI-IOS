//
//  WABarView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

final class XAxisView: WABaseView{
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]){
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        data.forEach {
            let label = UILabel()
            label.font = R.Fonts.helvelticaRegular(with: 9)
            label.textColor = R.Colors.inactive
            label.textAlignment = .center
            label.text = $0.title.uppercased()
            stackView.addArrangedSubview(label)
        }
    }
}

extension XAxisView{
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
