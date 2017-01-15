//
//  StoryboardSegueHelper.swift
//  StoryboardSegueHelper
//
//  Created by Hiroki Ishiura on 2017/01/15.
//  Copyright © 2017年 Hiroki Ishiura. All rights reserved.
//

import UIKit

/// This class which help you to describe 'performSegue()' and processing in 'prepare()' in one place.
class StoryboardSegueHelper {

	typealias PrepareHandler = (_ destination: UIViewController) -> Void

	private let source: UIViewController
	private var prepares: [String: PrepareHandler] = [:]

	init(source: UIViewController) {
		self.source = source
	}

	func perform(withIdentifier identifier: String, _ prepare: @escaping PrepareHandler) {
		prepares[identifier] = prepare
		source.performSegue(withIdentifier: identifier, sender: source)
	}

	func prepare(segue: UIStoryboardSegue) -> Bool {
		guard let identifier = segue.identifier else {
			return false // ignored.
		}
		guard let handler = prepares[identifier] else {
			return false // ignored.
		}

		handler(segue.destination)
		prepares.removeValue(forKey: identifier)
		return true // consumed.
	}

}
