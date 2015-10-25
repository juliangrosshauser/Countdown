//
//  CountdownController.swift
//  Countdown
//
//  Created by Julian Grosshauser on 19/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class CountdownController: UIViewController {

    //MARK: Properties

    private let viewModel: CountdownViewModel

    //MARK: Initialization

    init(viewModel: CountdownViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UIViewController

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if viewModel.age == nil {
            showViewController(UINavigationController(rootViewController: BirthdayController(viewModel: viewModel)), sender: self)
        }
    }
}
