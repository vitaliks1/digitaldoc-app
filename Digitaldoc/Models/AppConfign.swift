//
//  AppConfign.swift
//  Digitaldoc
//
//  Created by Manoj on 11/03/22.
//

import Foundation

struct AppParser: Codable {
    var stackTemplate: StackTemplateConfig?
    enum CodingKeys: String, CodingKey {
        case stackTemplate = "stackTemplate"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        stackTemplate = try values.decodeIfPresent(StackTemplateConfig.self, forKey: .stackTemplate)
    }
}

struct StackTemplateConfig: Codable {
    var banner: Banner?
    var collectionList: CollectionListResponse?
    enum CodingKeys: String, CodingKey {
        case banner = "banner"
        case collectionList = "collectionList"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        banner = try values.decodeIfPresent(Banner.self, forKey: .banner)
        collectionList = try values.decodeIfPresent(CollectionListResponse.self, forKey: .collectionList)
    }
}

struct Banner: Codable {
    var title: String?
    enum CodingKeys: String, CodingKey {
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}

struct CollectionListResponse: Codable {
    var shelf: [ShelfResponse]?
    enum CodingKeys: String, CodingKey {
        case shelf = "shelf"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shelf = try values.decodeIfPresent([ShelfResponse].self, forKey: .shelf) ?? []
    }
}

struct ShelfResponse: Codable {
    var header: HeaderTitle?
    var section: SectionData?
    
    enum CodingKeys: String, CodingKey {
        case header = "header"
        case section = "section"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        header = try values.decodeIfPresent(HeaderTitle.self, forKey: .header)
        section = try values.decodeIfPresent(SectionData.self, forKey: .section)
    }
}
struct HeaderTitle: Codable {
    var title: String?
    enum CodingKeys: String, CodingKey {
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}
struct SectionData: Codable {
    var lockup: [LockUpResponse]
    enum CodingKeys: String, CodingKey {
        case lockup = "lockup"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lockup = try values.decodeIfPresent([LockUpResponse].self, forKey: .lockup) ?? []
    }
}
struct LockUpResponse: Codable {
    var attributesVideo: VideoURL?
    var img: SectionImg?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case attributesVideo = "@attributes"
        case img = "img"
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attributesVideo = try values.decodeIfPresent(VideoURL.self, forKey: .attributesVideo)
        img = try values.decodeIfPresent(SectionImg.self, forKey: .img)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}

struct VideoURL: Codable {
    var videoURLs: String?
    enum CodingKeys: String, CodingKey {
        case videoURLs = "videoURLs"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        videoURLs = try values.decodeIfPresent(String.self, forKey: .videoURLs)
    }
}

struct SectionImg: Codable {
    var attributes: SectionImgProperty?
    var shelf: [ShelfResponse]?
    enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        attributes = try values.decodeIfPresent(SectionImgProperty.self, forKey: .attributes)
    }
}
struct SectionImgProperty: Codable {
    var src: String?
    enum CodingKeys: String, CodingKey {
        case src = "src"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        src = try values.decodeIfPresent(String.self, forKey: .src)
    }
}
