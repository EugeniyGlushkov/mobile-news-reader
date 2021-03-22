//
// Created by evgen on 22.03.2021.
//

import Foundation

class MockedChannelDao: ChannelDaoProtocol {
    var channels: [ChannelTO] = []

    func add(channel: ChannelTO) {
        channels.append(channel)
    }

    func remove(byId id: String, byName name: String) {
        channels.removeAll { channel in
            return channel.id == id && channel.name == name
        }
    }

    func update(channel: ChannelTO) {
        guard let updatedIndex = (channels.firstIndex { ch in
            return ch.id == channel.id && ch.name == channel.name
        }) else {
            return
        }

        channels[updatedIndex] = ChannelTO.copyOf(channel: channel)
    }

    func get(byId id: String, byName name: String) -> ChannelTO? {
        guard let gettingChannel = (channels.first { ch in
            return ch.id == id && ch.name == name
        }) else {
            return nil
        }

        return ChannelTO.copyOf(channel: gettingChannel)
    }

    func getAll() -> [ChannelTO] {
        return channels.map {
            return ChannelTO.copyOf(channel: $0)
        }
    }

    func getFavourites() -> [ChannelTO] {
        return channels.filter { channel in
                    return channel.favourite!
                }
                .map {
                    return ChannelTO.copyOf(channel: $0)
                }
    }

}
