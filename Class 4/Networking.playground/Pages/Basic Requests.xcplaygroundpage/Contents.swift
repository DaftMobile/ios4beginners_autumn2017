//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

//: # Basic network request

PlaygroundPage.current.needsIndefiniteExecution = true

let urlString = "https://user-images.githubusercontent.com/1230922/31862042-c045dba0-b737-11e7-98bf-e816ad04ad73.png"

/*:
##	Task 1:

### Download this image and diplay a UIImage object in the simplest possible way

1. Create a URL

2. Use the `Data(contensOf: URL) throws` initializer - remember to use a background Queue!!!!

3. Use the `UIImage(data: Data)` initializer
*/



//: ## Solution:
let url = URL(string: urlString)!
DispatchQueue.global().async {
	do {
		let data = try Data(contentsOf: url)
		DispatchQueue.main.async {
			UIImage(data: data)
			PlaygroundPage.current.finishExecution()
		}
	} catch {
		print(error)
		PlaygroundPage.current.finishExecution()
	}
}
