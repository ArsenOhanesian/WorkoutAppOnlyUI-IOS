//
//  WABarView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

extension WABarView{
    struct Data{
        let value: String
        let heightMultiplier: Double
        let title: String
        
    }
}

final class WABarView: WABaseView{
    private let heightMultiplier: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 13)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let barView: UIView = {
       let view = UIView()
        view.backgroundColor = R.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 9)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    init(data: Data){
        self.heightMultiplier = data.heightMultiplier
        super.init(frame: .zero)
       
        titleLabel.text = data.title.uppercased()
        valueLabel.text = data.value
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }
}

extension WABarView{
    override func setupViews() {
        super.setupViews()
        
        addView(valueLabel)
        addView(barView)
        addView(titleLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 7),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier * 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
}
