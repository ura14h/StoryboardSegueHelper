//
//  FirstViewController.swift
//  StoryboardSegueHelper
//
//  Created by Hiroki Ishiura on 2017/01/15.
//  Copyright © 2017年 Hiroki Ishiura. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

	@IBOutlet weak var textField: UITextField!

	var text: String?
	
	private var segueHelper: StoryboardSegueHelper!

	required init?(coder dcoder: NSCoder) {
		super.init(coder: dcoder)
		segueHelper = StoryboardSegueHelper(source: self)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		textField.text = text
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

	// A connection point for unwind-segue.
	@IBAction func didBackToFirstViewController(segue: UIStoryboardSegue) {
		textField.text = text
	}

#if true
	// MARK: - Using StoryboardSegueHelper style

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		_ = segueHelper.prepare(segue: segue)
	}

	@IBAction func didTapNextButton(_ sender: Any) {
		segueHelper.perform(withIdentifier: "showSecondViewController") { [weak self] (destination) in
			let controller = destination as! SecondViewController
			controller.text = self?.textField.text
		}
	}

#else
	// MARK: - Using Apple standard style

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showSecondViewController" {
			let controller = segue.destination as! SecondViewController
			controller.text = textField.text
		}
	}

	@IBAction func didTapNextButton(_ sender: Any) {
		performSegue(withIdentifier: "showSecondViewController", sender: self)
	}
	
#endif

}
