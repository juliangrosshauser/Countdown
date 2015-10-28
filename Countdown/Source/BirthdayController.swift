//
//  BirthdayController.swift
//  Countdown
//
//  Created by Julian Grosshauser on 19/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import Timepiece

class BirthdayController: UIViewController {

    //MARK: Properties

    private let viewModel: CountdownViewModel

    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .Date
        datePicker.minimumDate = NSDate.date(year: 1900, month: 1, day: 1)
        datePicker.maximumDate = NSDate()
        return datePicker
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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "save:")
        view.addSubview(datePicker)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        datePicker.center = view.center
    }

    //MARK: Button Actions

    @objc
    private func save(sender: UIBarButtonItem) {
        viewModel.birthday = datePicker.date
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
