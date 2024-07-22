//
//  CellView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

enum CellRoundedType{
    case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell{
    static let id = "TrainingCellView"

    private let checkmarkView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Overview.checkmarkNotDone
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let rightArrowView: UIImageView = {
        let view = UIImageView()
        view.image = R.Images.Overview.rightArrow
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupView()
        constraintViews()
        configureAppearance()
    }
    
    func configure(with title: String, subtitle: String, isDone: Bool, roundeType: CellRoundedType){
        self.title.text = title
        self.subTitle.text = subtitle
        
        checkmarkView.image = isDone ? R.Images.Overview.checkmarkDone : R.Images.Overview.checkmarkNotDone
        
        switch roundeType{
        case .all: self.roundCorners(.allCorners, radius: 5)
        case .bottom: self.roundCorners([.bottomLeft, .bottomRight], radius: 5)
        case .top: self.roundCorners([.topLeft, .topRight], radius: 5)
        case .notRounded: self.roundCorners(.allCorners, radius: 0)
        }
    }
}

private extension TrainingCellView {
    func setupView(){
        addView(checkmarkView)
        addView(stackView)
        addView(rightArrowView)
        
        [title, subTitle].forEach(stackView.addArrangedSubview)
    }
    
    func constraintViews(){
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 13),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7),
            
        ])
    }
                                    
    func configureAppearance(){
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = R.Colors.separator.cgColor
        
    }
}
