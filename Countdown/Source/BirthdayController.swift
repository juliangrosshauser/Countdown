//
//  BirthdayController.swift
//  Countdown
//
//  Created by Julian Grosshauser on 19/10/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import CountdownKit

class BirthdayController: UIViewController {

    //MARK: Properties

    private let viewModel: CountdownViewModel

    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .Date
        datePicker.minimumDate = NSDate.date(day: 1, month: 1, year: 1900)
        datePicker.maximumDate = NSDate()
        return datePicker
    }()

    //MARK: Initialization

    init(viewModel: CountdownViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = NSLocalizedString("Birthday", comment: "Title of birthday date picker")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: "save:")
        view.addSubview(datePicker)

        if let birthday = viewModel.birthday {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancel:")
            datePicker.setDate(birthday, animated: true)
        }

        NSLayoutConstraint(item: datePicker, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: datePicker, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0).active = true
    }

    //MARK: Button Actions

    @objc
    private func save(sender: UIBarButtonItem) {
        viewModel.birthday = datePicker.date
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

    @objc
    private func cancel(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
