//
//  GlobalEnums.swift
//  Digitaldoc
//
//  Created by Manoj on 11/03/22.
//

import Foundation
import UIKit


enum StreamType {
    case Linear
    case Catset
}

enum ViewType {
    case MULTI
    case MULTISINGLE
    case SINGLE
    case VOD
    case POD
    case ABOUT
}
enum MenuType {
    case CAT
    case ABOUT
}

enum CDNType {
    case F
    case G
    case N
    case J
    //case T
    case W
    case Audio
    case Watch
    case Y
}

enum AlertButton {
    case Retry
    case Exit
}

enum ReachabilityType {
    case WWAN,
    WiFi,
    NotConnected
}

enum AlertType {
    case UPDATED_VERSION_AVAILABLE
    case APP_EXIT
    case PRE_Ad
    case MOB_ORIENTATION
    case REQUEST_TIMEOUT
    case GENRIC_EXCEPTION
    case REMOVED_CATEGORY_TV
    case REMOVED_CATEGORY_MOB
    case INTERNET_CONNECTION_ERR
    case PLAYER_ERR
    case DATA_PARSE_ERR
    case EMPTY_MULTI_LINEAR_URL_REPONSE
    case EMPTY_CATSET_LIST_TV
    case EMPTY_CATSET_LIST_MOB
    case EMPTY_FAVORITE_LIST
    case EMPTY_SUBMENU_DATA
    case EMPTY_VOD_LIST
    case EMPTY_POD_LIST
    case EMPTY_SEARCH_KEYWORD
    case EMPTY_SEARCH_RESULT
    case EMPTY_DATA_SOURCE
    case EMPTY_SETTINGS_DATA
    case MAIL_ERR_TITLE
    case MAIL_ERR_MESSAGE
}





