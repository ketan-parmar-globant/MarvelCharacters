//
//  CharacterDetailsViewController.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import UIKit
import TinyConstraints

class CharacterDetailsViewController: UIViewController {
    private let loader = UIActivityIndicatorView(style: .large)
    private var characterImageView: UIImageView?
    private var characterDescriptionLabel: UILabel?
    private var referenceUrlsLabel: UILabel?
    private var characterDetailsCollectionView: UICollectionView?
    
    var viewModel: CharacterDetailsViewModel? {
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    enum Constant {
        static let characterImageViewHeight: CGFloat = 200.0
        static let aspectRatio: CGFloat = 1.0
        static let characterImageViewCornerRadius = characterImageViewHeight/2
        static let collectionViewLineSpacing: CGFloat = 10.0
        static let collectionViewCellWidth: CGFloat = 100.0
        static let collectionViewCellHeight: CGFloat = 40.0
        static let collectionViewHeight: CGFloat = 40.0
        static let referenceUrlText = "Reference URLs 👇"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialState()
        viewModel?.start()
    }
}

extension CharacterDetailsViewController: CharacterDetailsViewModelViewDelegate {
    func setInitialState() {
        self.title = viewModel?.characterName
        self.view.backgroundColor = Colors.backgroundColor
        self.navigationItem.largeTitleDisplayMode = .never
        setupBaseUI()
        setupLoader()
    }
    
    func setIndicatorTo(show: Bool) {
        if show {
            loader.isHidden = false
            loader.startAnimating()
            view.bringSubviewToFront(loader)
        } else {
            loader.isHidden = true
            loader.stopAnimating()
        }
    }
    
    func reloadData() {
        characterImageView?.loadImageUsingUrlString(urlString: viewModel?.characterImageUrl)
        characterDescriptionLabel?.text = viewModel?.characterDescription
        referenceUrlsLabel?.text = Constant.referenceUrlText
        characterDetailsCollectionView?.reloadData()
    }
}

extension CharacterDetailsViewController {
    func setupBaseUI() {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(usingSafeArea: true)
        
        let containerView = UIView()
        containerView.backgroundColor = Colors.backgroundColor
        scrollView.addSubview(containerView)
        
        containerView.edgesToSuperview()
        containerView.widthToSuperview()
        containerView.heightToSuperview(priority: .defaultLow)
        
        let characterImageView = UIImageView()
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
        characterImageView.layer.cornerRadius = Constant.characterImageViewCornerRadius
        containerView.addSubview(characterImageView)
        
        characterImageView.height(Constant.characterImageViewHeight)
        characterImageView.aspectRatio(Constant.aspectRatio)
        characterImageView.topToSuperview(offset: Spacing.s5)
        characterImageView.centerXToSuperview()
        
        let characterDescriptionLabel = UILabel()
        characterDescriptionLabel.numberOfLines = 0
        characterDescriptionLabel.font = Fonts.secondaryFont
        characterDescriptionLabel.textColor = Colors.primaryFontColor
        characterDescriptionLabel.textAlignment = .center
        characterDescriptionLabel.lineBreakMode = .byWordWrapping
        containerView.addSubview(characterDescriptionLabel)
        
        characterDescriptionLabel.topToBottom(of: characterImageView, offset: Spacing.s5)
        characterDescriptionLabel.leftToSuperview(offset: Spacing.s5)
        characterDescriptionLabel.rightToSuperview(offset: -Spacing.s5)
        
        let referenceUrlsLabel = UILabel()
        referenceUrlsLabel.font = Fonts.secondaryFont
        referenceUrlsLabel.textColor = Colors.primaryFontColor
        referenceUrlsLabel.textAlignment = .left
        referenceUrlsLabel.lineBreakMode = .byWordWrapping
        containerView.addSubview(referenceUrlsLabel)
        
        referenceUrlsLabel.topToBottom(of: characterDescriptionLabel, offset: Spacing.s7)
        referenceUrlsLabel.leftToSuperview(offset: Spacing.s5)
        referenceUrlsLabel.rightToSuperview(offset: -Spacing.s5)
        
        
        let collectionView = setupCollectionView()
        containerView.addSubview(collectionView)
        
        collectionView.topToBottom(of: referenceUrlsLabel, offset: Spacing.s5)
        collectionView.height(Constant.collectionViewHeight)
        collectionView.leftToSuperview(offset: Spacing.s5)
        collectionView.rightToSuperview(offset: -Spacing.s5)
        collectionView.bottomToSuperview(offset: -Spacing.s5)
        
        self.characterImageView = characterImageView
        self.characterDescriptionLabel = characterDescriptionLabel
        self.referenceUrlsLabel = referenceUrlsLabel
        self.characterDetailsCollectionView = collectionView
    }
    
    func setupLoader() {
        loader.color = Colors.systemBlueColor
        view.addSubview(loader)
        loader.centerInSuperview()
    }
    
    func setupCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constant.collectionViewLineSpacing
        layout.minimumInteritemSpacing = Constant.collectionViewLineSpacing
        layout.itemSize = CGSize(width: Constant.collectionViewCellWidth, height: Constant.collectionViewHeight)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CharacterDetailsCollectionViewCell.self,
                                forCellWithReuseIdentifier: CharacterDetailsCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }
}

extension CharacterDetailsViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.characterDetails?.urls?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterDetailsCollectionViewCell.identifier, for: indexPath) as? CharacterDetailsCollectionViewCell, let urlType = viewModel?.urls?[indexPath.item].type else { return UICollectionViewCell() }
        cell.setupCellData(urlType: urlType)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = viewModel?.urls?[indexPath.item].url {
            openSafariViewController(url: url)
        }
    }
}
