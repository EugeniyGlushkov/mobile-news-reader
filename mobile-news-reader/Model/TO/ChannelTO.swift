//
//  ChannelTO.swift
//  mobile-news-reader
//
//  Created by evgen on 14.03.2021.
//

import Foundation

struct ChannelTO {
    let id: String?
    let name: String?
    var favourite: Bool?

    static func copyOf(channel: ChannelTO) -> ChannelTO {
        return ChannelTO(id: channel.id, name: channel.name, favourite: channel.favourite)
    }

    static func valueOf(channel: Channel) -> Self {
        return ChannelTO(id: channel.id, name: channel.name, favourite: channel.favourite)
    }

    static func valueOf(source: Source) -> Self {
        return ChannelTO(id: source.id, name: source.name, favourite: false)
    }

    static func valuesFrom(sources: Sources) -> [ChannelTO] {
        guard let safeSources = sources.sources else {
            return []
        }

        return safeSources.map {
            source in
            return valueOf(source: source)
        }
    }
}

extension ChannelTO: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
                && lhs.name == rhs.name
                && lhs.favourite == rhs.favourite
    }
}
