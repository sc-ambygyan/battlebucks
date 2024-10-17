//
//  battlebucksUITests.swift
//  battlebucksUITests
//
//  Created by Ambarish Gyanendra on 16/10/24.
//

import XCTest

final class battlebucksUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
 }

    func test_PhotoTap() throws {
        let app = XCUIApplication()
        app.launch()
        
        let grid = app.otherElements["photoGrid"]
        XCTAssertTrue(grid.waitForExistence(timeout: 5), "The Grid should exist")
        
        let predicate = NSPredicate(format: "identifier CONTAINS 'photoId_'")
        let gridItems = grid.buttons.containing(predicate)
        
        gridItems.firstMatch.tap()
        
        let titlePredicate = NSPredicate(format: "label CONTAINS 'Title:'")
        let urlPredicate = NSPredicate(format: "label CONTAINS 'Url:'")
        
        XCTAssertTrue(app.staticTexts.containing(titlePredicate).element.exists)
        XCTAssertTrue(app.staticTexts.containing(titlePredicate).element.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
