//
//  SecondViewController.swift
//  StoryboardSegueHelper
//
//  Created by Hiroki Ishiura on 2017/01/15.
//  Copyright © 2017年 Hiroki Ishiura. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

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

#if true
	// MARK: - Using StoryboardSegueHelper style

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		_ = segueHelper.prepare(segue: segue)
	}

	@IBAction func didTapBackButton(_ sender: Any) {
		segueHelper.perform(withIdentifier: "backToFirstViewController") { [weak self] (destination) in
			let controller = destination as! FirstViewController
			controller.text = self?.textField.text
		}
	}

#else
	// MARK: - Using Apple standard style

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "backToFirstViewController" {
			let controller = segue.destination as! FirstViewController
			controller.text = textField.text
		}
	}

	@IBAction func didTapBackButton(_ sender: Any) {
		performSegue(withIdentifier: "backToFirstViewController", sender: self)
	}

#endif

}
