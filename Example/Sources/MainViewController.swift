//
//  MainViewController.swift
//  Example
//
//  Created by DongHeeKang on 30/01/2019.
//  Copyright © 2019 k-lpmg. All rights reserved.
//

import UIKit

import FluidHighlighter

final class MainViewController: UIViewController {
    
    private enum Const {
        static let cellId = "cell"
    }
    
    private let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()
    private let control: UIControl = {
        let control = UIControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.layer.borderColor = UIColor.gray.cgColor
        control.layer.borderWidth = 0.5
        return control
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        return button
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: Const.cellId)
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setFluidHighlighter()
        view.addSubview(view1)
        view.addSubview(control)
        view.addSubview(button)
        view.addSubview(tableView)
        layout()
    }
    
    private func setFluidHighlighter() {
        view1.fh.enable(normalColor: .white, highlightedColor: UIColor.gray.withAlphaComponent(0.5))
        control.fh.enable(normalColor: .white, highlightedColor: UIColor.yellow.withAlphaComponent(0.5))
        button.fh.enable(normalColor: .white, highlightedColor: UIColor.darkGray.withAlphaComponent(0.5))
    }
    
}

extension MainViewController {
    
    private func layout() {
        view1.trailingAnchor.constraint(equalTo: control.leadingAnchor, constant: -8).isActive = true
        view1.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 16).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        control.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        control.topAnchor.constraint(equalTo: view1.topAnchor).isActive = true
        control.heightAnchor.constraint(equalTo: view1.heightAnchor).isActive = true
        control.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.leadingAnchor.constraint(equalTo: control.trailingAnchor, constant: 8).isActive = true
        button.centerYAnchor.constraint(equalTo: view1.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 32).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellId, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}
