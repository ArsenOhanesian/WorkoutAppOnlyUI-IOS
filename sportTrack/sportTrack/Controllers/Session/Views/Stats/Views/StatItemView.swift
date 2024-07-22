//
//  StatItemView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

enum StatsItems{
    case avaragePace(value: String)
    case heartRate(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatsItemView.ItemData{
        switch self {
        case .avaragePace(let value):
            return .init(image: R.Images.Session.Stats.avaragePace,
                         value: value + " / km",
                         title: R.Strings.Session.avaragePace)
        case .heartRate(let value):
            return .init(image: R.Images.Session.Stats.heartRate,
                         value: value + " / bpm",
                         title: R.Strings.Session.heartRate)
        case .totalDistance(let value):
            return .init(image: R.Images.Session.Stats.totalDistance,
                         value: value,
                         title: R.Strings.Session.totalDistance)
        case .totalSteps(let value):
            return .init(image: R.Images.Session.Stats.totalSteps,
                         value: value + " km",
                         title: R.Strings.Session.totalSteps)
        }
    }
}

final class StatsItemView: WABaseView{
    
    struct ItemData{
        let image: UIImage
        let value: String
        let title: String
    }
    
    private let iconView = UIImageView()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 10)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
 
    func configure(with item: StatsItems){
        iconView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title
    }
}

extension StatsItemView{
    override func setupViews() {
        super.setupViews()
        
        addView(iconView)
        addView(stackView)
        
        [valueLabel,titleLabel].forEach(stackView.addArrangedSubview)
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 23),
            
            stackView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 15),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
}
