//
//  CountdownController.swift
//  Countdown
//
//  Created by Julian Grosshauser on 19/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import CountdownKit
import ReactiveCocoa

class CountdownController: UIViewController {

    //MARK: Properties

    private let viewModel: CountdownViewModel
    private let ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.textColor = .blackColor()
        ageLabel.font = UIFont.monospacedDigitSystemFontOfSize(UIFont.systemFontSize(), weight: UIFontWeightBold)
        ageLabel.textAlignment = .Center
        return ageLabel
    }()

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

        if viewModel.birthday == nil {
            showViewController(UINavigationController(rootViewController: BirthdayController(viewModel: viewModel)), sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Settings", comment: "Settings Button Label"), style: .Plain, target: self, action: "showSettings:")
        view.addSubview(ageLabel)

        // Skip initial value
        viewModel.age.producer.observeOn(UIScheduler()).skip(1).startWithNext { [unowned self] age in
            self.ageLabel.text = String(format: "%.12f", age)
            self.ageLabel.sizeToFit()
        }

        NSLayoutConstraint(item: ageLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: ageLabel, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0).active = true
    }

    //MARK: Button Actions

    @objc
    private func showSettings(sender: UIBarButtonItem) {
        showViewController(UINavigationController(rootViewController: BirthdayController(viewModel: viewModel)), sender: self)
    }
}
