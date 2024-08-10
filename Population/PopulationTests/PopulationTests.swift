//
//  PopulationTests.swift
//  PopulationTests
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import XCTest
@testable import Population

final class PopulationTests: XCTestCase {

    func test_configureWindow_setsWindowAsKeyAndVisible() {
        let window = UIWindowSpy()
        let sut = SceneDelegate()
        sut.window = window
        
        sut.configureWindow()
        
        XCTAssertEqual(window.makeKeyAndVisibleCallCount, 1, "Expected to make window key and visible")
    }
    
    func test_viewController_hasTitle() {
        let sut = makeSUT()

        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, sut.viewModel?.title)
    }
    
    func test_viewModel_loadDataFromAPI() {
        let sut = makeSUT()
        
        sut.viewModel?.loadData()
        sut.viewModel?.fetchedData = TestHelper.anySuccessResponse
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.viewModel?.fetchedData?.data?.count, TestHelper.anySuccessResponse.data?.count)
    }
    
    // MARK: - Helpers

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> NationViewController {
        let sut = NationComposer.nationComposedWith(nationLoader: NationNetworkService())
        trackForMemoryLeaks(sut)
        return sut
    }
}

private class UIWindowSpy: UIWindow {
    var makeKeyAndVisibleCallCount = 0
    
    override func makeKeyAndVisible() {
        makeKeyAndVisibleCallCount += 1
    }
}
