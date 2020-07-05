//
//  Article.swift
//  How To Rocket
//
//  Created by Zeeshan Hooda on 7/3/20.
//

import Foundation

struct Article: Codable, Identifiable {
    let id = UUID()
    let imageName: String = "article-image-3"
    var title: String
    var url: String
    var published_date: String
    var news_site_long: String
    var featured_image: String
}

//#if DEBUG
//let testArticleData = [
//    Article(headline: "Rocket Lab successfully reaches orbit and deploys payloads", imageName: "article-image-2", body: "Rocket Lab has successfully reached orbit with the test flight of its second Electron orbital launch vehicle, Still Testing. Electron lifted-off at 14:43 NZDT from Rocket Lab Launch Complex 1 on the Māhia Peninsula in New Zealand.\n\nFollowing successful first and second stage burns, Electron reached orbit and deployed customer payloads at 8 minutes and 31 seconds after lift-off."),
//    Article(headline: "Boom! SpaceX pops huge Starship SN7 test tank on purpose in pressure test", imageName: "article-image-3", body: "SpaceX pushed a massive tank for its latest Starship prototype beyond its limits Tuesday (June 23) in an intentionally explosive test in South Texas.\n\nThe Starship SN7 prototype tank ruptured during a pressure test at SpaceX's Boca Chica proving grounds, the second in just over a week for the spacecraft component. But where a June 15 test resulted in a leak, Tuesday's test was a bit more dramatic."),
//    Article(headline: "SpaceX Simultaniously Lands Boosters of Falcon Heavy", imageName: "article-image-1", body: "YOU MIGHT THINK the coolest part of the SpaceX Falcon Heavy test was the Tesla with a spaceman riding inside, flying out into space. Yeah, sure, that part was cool. But for me, the best part was this footage of the Heavy's two side boosters returning to the launch pad. \n\nThere are a bunch of cool physics things you can do with a video like this. For me, I'm going to answer two questions. First, how far away was this camera from the boosters when they turned on the engines? Second, what kind of acceleration did the boosters have while slowing down?"),
//    Article(headline: "Rocket Lab successfully reaches orbit and deploys payloads", imageName: "article-image-2", body: "Rocket Lab has successfully reached orbit with the test flight of its second Electron orbital launch vehicle, Still Testing. Electron lifted-off at 14:43 NZDT from Rocket Lab Launch Complex 1 on the Māhia Peninsula in New Zealand.\n\nFollowing successful first and second stage burns, Electron reached orbit and deployed customer payloads at 8 minutes and 31 seconds after lift-off."),
//    Article(headline: "Boom! SpaceX pops huge Starship SN7 test tank on purpose in pressure test", imageName: "article-image-3", body: "SpaceX pushed a massive tank for its latest Starship prototype beyond its limits Tuesday (June 23) in an intentionally explosive test in South Texas.\n\nThe Starship SN7 prototype tank ruptured during a pressure test at SpaceX's Boca Chica proving grounds, the second in just over a week for the spacecraft component. But where a June 15 test resulted in a leak, Tuesday's test was a bit more dramatic."),
//    Article(headline: "SpaceX Simultaniously Lands Boosters of Falcon Heavy", imageName: "article-image-1", body: "YOU MIGHT THINK the coolest part of the SpaceX Falcon Heavy test was the Tesla with a spaceman riding inside, flying out into space. Yeah, sure, that part was cool. But for me, the best part was this footage of the Heavy's two side boosters returning to the launch pad. \n\nThere are a bunch of cool physics things you can do with a video like this. For me, I'm going to answer two questions. First, how far away was this camera from the boosters when they turned on the engines? Second, what kind of acceleration did the boosters have while slowing down?"),
//]
//#endif
