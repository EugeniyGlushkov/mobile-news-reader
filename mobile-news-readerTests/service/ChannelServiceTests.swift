//
//  ChannelServiceTests.swift
//  mobile-news-readerTests
//
//  Created by evgen on 13.03.2021.
//

import XCTest
@testable import mobile_news_reader

class ChannelServiceTests: XCTestCase {
    static let TEST_CHANNEL_1 = ChannelTO(id: "testChannel_1", name: "TestChannel_1", favourite: true)
    static let TEST_CHANNEL_2 = ChannelTO(id: "testChannel_2", name: "TestChannel_2", favourite: false)

    var repository: ChannelDaoProtocol!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repository = MockedChannelDao()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        repository = nil
    }

    func testAddChannel() {
        whenChannelAdded(channel: Self.TEST_CHANNEL_1)
        thenTestChannel_1ExistsInRepositoryAfterAdding()
    }

    func testRemoveChannel() {
        givenChannelsAdded(channels: Self.TEST_CHANNEL_1)
        whenTestChannel_1Removed()
        thenChannelIsNotExist(channel: Self.TEST_CHANNEL_1)
    }

    func testUpdateChannel() {
        givenChannelsAdded(channels: Self.TEST_CHANNEL_1)

        var updatedChannel = ChannelTO.copyOf(channel: Self.TEST_CHANNEL_1)
        updatedChannel.favourite = false
        whenChannelUpdated(channel: updatedChannel)

        thenTestChannel_1Updated(to: updatedChannel)
    }

    func testGetAll() {
        givenChannelsAdded(channels: Self.TEST_CHANNEL_1, Self.TEST_CHANNEL_2)

        thenGetAllReturnsTwoElements()
    }

    func testGetFavourites() {
        givenChannelsAdded(channels: Self.TEST_CHANNEL_1, Self.TEST_CHANNEL_2)

        thenGetFavouritesReturnsOnlyTestChannel_1()
    }

    func givenChannelsAdded(channels: ChannelTO...) {
        channels.forEach { channel in
            repository.add(channel: channel)
        }
    }

    func whenChannelAdded(channel: ChannelTO) {
        repository.add(channel: channel)
    }

    func whenTestChannel_1Removed() {
        repository.remove(byId: Self.TEST_CHANNEL_1.id!, byName: Self.TEST_CHANNEL_1.name!)
    }

    func whenChannelUpdated(channel: ChannelTO) {
        repository.update(channel: channel)
    }

    func thenTestChannel_1ExistsInRepositoryAfterAdding() {
        let numberOfChannelsAfterAdding = 1
        let expectedChannel = Self.TEST_CHANNEL_1
        let actualChannel = repository.get(byId: Self.TEST_CHANNEL_1.id!, byName: Self.TEST_CHANNEL_1.name!)
        XCTAssertEqual(numberOfChannelsAfterAdding, repository.getAll().count)
        XCTAssertEqual(expectedChannel, actualChannel)
    }

    func thenChannelIsNotExist(channel: ChannelTO) {
        XCTAssertNil(repository.get(byId: channel.id!, byName: channel.name!), "Channel is exist, but must don't")
    }

    func thenChannelIsExist(channel: ChannelTO) {
        XCTAssertNotNil(repository.get(byId: channel.id!, byName: channel.name!), "Channel is not exist, but must do")
    }

    func thenTestChannel_1Updated(to channel: ChannelTO) {
        let updatedChannel = repository.get(byId: Self.TEST_CHANNEL_1.id!, byName: Self.TEST_CHANNEL_1.name!)
        XCTAssertEqual(channel, updatedChannel!)
    }

    func thenGetAllReturnsTwoElements() {
        XCTAssert(2 == repository.getAll().count)
    }

    func thenGetFavouritesReturnsOnlyTestChannel_1() {
        XCTAssert(1 == repository.getFavourites().count)
        XCTAssertEqual(Self.TEST_CHANNEL_1, repository.getFavourites()[0])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
