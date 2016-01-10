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
        datePicker.datePickerMode = .Date
        let components = NSDateComponents()
        components.year = 1900
        components.month = 1
        components.day = 1
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian) ?? NSCalendar.currentCalendar()
        datePicker.minimumDate = calendar.dateFromComponents(components)
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

    @objc
    private func cancel(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
