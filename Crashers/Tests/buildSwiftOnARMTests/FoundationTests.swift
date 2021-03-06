import XCTest
import Foundation

class FoundationTests: XCTestCase {

    func testSuccess(){
	XCTAssertTrue(true)
    }

    func testContentsOfFile(){
	if let str = try? String(contentsOfFile: "inputs/testfile") {
    	  XCTAssertEqual(str,"content")
	}
    }

    func testWriteToFile(){
	try! "Some content".write(toFile:"outputs/testfile", atomically: false, encoding: .utf8)
	if let str = try? String(contentsOfFile: "outputs/testfile") {
    	  XCTAssertEqual(str,"Some content")
	}
    }

    func testURL(){
	class MakeAURL {
            func makeURL() {
                let _ = URL(string: "http://www.google.com")
            }
        }


	let _ = URL(string:"http://www.google.com")

	let makeAURL = MakeAURL()
	makeAURL.makeURL()
	XCTAssertTrue(true)
    }

    func testContentsOfURL(){
	do{
  	    let _ = try String(contentsOf: URL(string: "https://httpbin.org/get")!, encoding: .utf8)
	    XCTAssertTrue(true)
	}catch{
	    XCTAssertTrue(true)
	}
    }

    func testProcess(){
	let p = Process()
	p.launchPath = "/usr/bin/tail"
	p.arguments = ["-f", "/var/log/system.log"]
	p.launch()

	var elapsedSeconds = 10
	while p.isRunning && elapsedSeconds > 0  {
	    print("Running")
	    sleep(1)
  	    elapsedSeconds -= 1
	}

	XCTAssertTrue(true)
    }

    func testIfLinux(){
	#if os(Linux)
	    XCTAssertTrue(true)
	#else
	    XCTFail()
	#endif
    }

    static var allTests = [
	("testSuccess", testSuccess),
	("testContentsOfFile", testContentsOfFile),
	("testWriteToFile", testWriteToFile),
	("testURL", testURL),
	("testContentsOfURL", testContentsOfURL),
	("testProcess", testProcess),
	("testIfLinux", testIfLinux),
    ]
}



