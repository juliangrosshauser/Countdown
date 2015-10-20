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
    private let userDefaults: NSUserDefaults

    //MARK: Initialization

    init(viewModel: CountdownViewModel, userDefaults: NSUserDefaults) {
        self.viewModel = viewModel
        self.userDefaults = userDefaults
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
