# StoryboardSegueHelper

The StoryboardSegueHelper class which help you to describe 'performSegue()' and processing in 'prepare()' in one place.

## How to use

An example,

```swift
class FirstViewController: UIViewController {
	private var segueHelper: StoryboardSegueHelper!

	required init?(coder dcoder: NSCoder) {
		super.init(coder: dcoder)
		segueHelper = StoryboardSegueHelper(source: self)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		_ = segueHelper.prepare(segue: segue)
	}

	@IBAction func action(_ sender: Any) {
		segueHelper.perform(withIdentifier: "showSecondViewController") { (destination) in
			let vc = destination as! SecondViewController
			vc.parameter = "..."
		}
	}
}

class SecondViewController: UIViewController {
	var parameter: String?
}
```

Please read `FirstViewController.swift` for more detail.


## Requirements

* macOS 10.12
* iOS 10.2
* Xcode 8.2
* Swift 3.0.1


## License

Please read [this file](LICENSE).
