//
//  Created by Netology.
//

import XCTest

class NetologyUITests: XCTestCase {

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        let username = "username"
        
        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)
        
        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        let loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()
        
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", username)
        let text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)
        
        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
    
    func testLoginDisabled() throws {
        let app = XCUIApplication()
        app.launch()
        
        let username = "username"
        
        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)
        
        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        loginTextField.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        app.collectionViews/*@START_MENU_TOKEN@*/.menuItems["Cut"].staticTexts["Cut"]/*[[".menuItems[\"Cut\"].staticTexts[\"Cut\"]",".staticTexts[\"Cut\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        let loginButton = app.buttons["login"]
        XCTAssertFalse(loginButton.isEnabled)
    }
    
    func testLoginTwoTimes() throws {
        let app = XCUIApplication()
        app.launch()
        
        let username = "username"
        
        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)
        
        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")
        
        let loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()
        
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", username)
        let text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)
        
        app.navigationBars["Profile"].buttons["Login"].tap()
        
        loginTextField.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        app.collectionViews/*@START_MENU_TOKEN@*/.menuItems["Cut"].staticTexts["Cut"]/*[[".menuItems[\"Cut\"].staticTexts[\"Cut\"]",".staticTexts[\"Cut\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        let username2 = "login"
        loginTextField.typeText(username2)
        loginButton.tap()
        
        let predicate2 = NSPredicate(format: "label CONTAINS[c] %@", username2)
        let text2 = app.staticTexts.containing(predicate2)
        XCTAssertNotNil(text2)
    }
}
