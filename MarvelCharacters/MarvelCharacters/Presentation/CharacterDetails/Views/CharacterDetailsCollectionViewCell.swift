//
//  CharacterDetailsCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import UIKit

class CharacterDetailsCollectionViewCell: UICollectionViewCell, ReusableView {
    private var containerView: UIView?
    private var urlTypeLabel: UILabel?
    
    enum Constant {
        static let cornerRadius: CGFloat = 20.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupCornerRadius()
        super.layoutSubviews()
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    static var identifier: String {
        return String(describing: self)
    }
}

extension CharacterDetailsCollectionViewCell {
    private func setupUI() {
        backgroundColor = .clear
        
        let container = UIView()
        container.backgroundColor = Colors.systemGrayColor
        addSubview(container)
        
        container.edgesToSuperview()
        
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = Colors.systemBlueColor
        titleLabel.font = Fonts.secondaryFont
        container.addSubview(titleLabel)
        titleLabel.edgesToSuperview()

        self.containerView = container
        self.urlTypeLabel = titleLabel
    }
    
    private func setupCornerRadius() {
        guard let container = containerView else { return }
        container.layer.cornerRadius = Constant.cornerRadius
    }
    
    func setupCellData(urlType: String) {
        self.urlTypeLabel?.text = urlType
    }
}
