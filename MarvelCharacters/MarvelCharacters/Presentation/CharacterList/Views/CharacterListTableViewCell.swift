//
//  CharacterListTableViewCell.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import TinyConstraints
import UIKit
import SDWebImage

class CharacterListTableViewCell: UITableViewCell, ReusableView {
    private var containerView: UIView?
    private var characterImageView: UIImageView?
    private var characterNameLabel: UILabel?
    
    enum Constants {
        static let characterImageSize: CGFloat = 50
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
        
    }
    /// Return Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension CharacterListTableViewCell {
    private func setupUI() {
        guard containerView == nil else { return }
        
        self.backgroundColor = Colors.clearColor
        
        let containerView = UIView()
        containerView.backgroundColor = Colors.backgroundColor
        addSubview(containerView)
        containerView.edgesToSuperview()
        
        let characterImageView = UIImageView()
        characterImageView.layer.cornerRadius = Constants.characterImageSize/2
        characterImageView.clipsToBounds = true
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.backgroundColor = Colors.systemGrayColor
        containerView.addSubview(characterImageView)
        characterImageView.height(Constants.characterImageSize)
        characterImageView.width(Constants.characterImageSize)
        characterImageView.leftToSuperview(offset: Spacing.s4)
        characterImageView.topToSuperview(offset: Spacing.s4)
        characterImageView.bottomToSuperview(offset: -Spacing.s4)
        
        let characterNameLabel = UILabel()
        characterNameLabel.textAlignment = .left
        characterNameLabel.textColor = Colors.primaryFontColor
        characterNameLabel.font = Fonts.primaryFont
        containerView.addSubview(characterNameLabel)
        characterNameLabel.leftToRight(of: characterImageView, offset: Spacing.s3)
        characterNameLabel.rightToSuperview(offset: -Spacing.s4)
        characterNameLabel.centerY(to: characterImageView)
        
        self.containerView = containerView
        self.characterImageView = characterImageView
        self.characterNameLabel = characterNameLabel
    }
    
    func setupCellData(name: String?, imageUrl: String?) {
        self.characterImageView?.loadImageUsingUrlString(urlString: imageUrl)
        self.characterNameLabel?.text = name
    }
}
