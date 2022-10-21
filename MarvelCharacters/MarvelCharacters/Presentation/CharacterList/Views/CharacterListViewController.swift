//
//  CharacterListViewController.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 16/10/22.
//

import UIKit
import TinyConstraints

class CharacterListViewController: UIViewController {
    private let loader = UIActivityIndicatorView(style: .large)
    private var characterListTableView: UITableView?
    
    enum Constants {
        static let screenTitle: String = "Marvel Characters"
    }
    
    var viewModel: CharacterListViewModel? {
        didSet {
            viewModel?.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialState()
        viewModel?.start()
    }
}

extension CharacterListViewController: CharacterListViewModelViewDelegate {
    func setInitialState() {
        self.title = Constants.screenTitle
        self.view.backgroundColor = Colors.backgroundColor
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
    
    func showAlertViewFor(title: String, subtitle: String?) {
        
    }
    
    func reloadData() {
        characterListTableView?.reloadData()
    }
}

extension CharacterListViewController {
    func setupBaseUI() {
        let tableView = UITableView()
        tableView.backgroundColor = Colors.clearColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterListTableViewCell.self, forCellReuseIdentifier: CharacterListTableViewCell.identifier)
        
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.edgesToSuperview()
        
        self.characterListTableView = tableView
    }
    
    func setupLoader() {
        loader.color = Colors.systemBlueColor
        view.addSubview(loader)
        loader.centerInSuperview()
    }
}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.characterList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListTableViewCell.identifier, for: indexPath) as? CharacterListTableViewCell, let character = viewModel?.characterList?[indexPath.row] else { return UITableViewCell() }
        
        cell.setupCellData(name: character.name, imageUrl: character.thumbnail?.path)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.loadCharacterDetailsScreen(index: indexPath.row)
    }
}
