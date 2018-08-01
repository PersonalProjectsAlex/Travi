//
//  Objeto.swift
//  travi
//
//  Created by Administrador on 6/05/18.
//

import Foundation
struct Bases : Codable {
    let itemRequestID : Int?
    let itemName : String?
    let itemCoverUrl : String?
    let itemWeight : Double?
    let itemWeightUnit : Int?
    let itemDueDate : String?
    let itemOriginCountryID : Int?
    let itemOriginStateID : Int?
    let itemOriginCityID : Int?
    let itemDestinationCountryID : Int?
    let itemDestinationStateID : Int?
    let itemDestinationCityID : Int?
    let itemPrice : Int?
    let itemRevenue : Int?
    let itemQtyRequested : Int?
    let itemComment : String?
    let itemUserID : Int?
    let itemURLReference : String?
    let itemCreatedAt : String?
    let itemUpdatedAt : String?
    let itemStatus : Int?
    let itemIMG2 : String?
    let itemIMG3 : String?
    let itemIMG4 : String?
    let itemIMG5 : String?
    let itemCoversCount : Int?
    let itemCategoryID : Int?
    let requestType : Int?
    let itemAddressID : Int?
    let itemSuggestedFare : Int?
    let itemSuggestedFareID : Int?
    let itemOriginDisplayCountry : String?
    let itemOriginDisplayState : String?
    let itemOriginDisplayCity : String?
    let itemDestDisplayCountry : String?
    let itemDestDisplayState : String?
    let itemDestDisplayCity : String?
    let itemUserRequesterName : String?
    let itemUnitName : String?
    
    enum CodingKeys: String, CodingKey {
        
        case itemRequestID = "itemRequestID"
        case itemName = "itemName"
        case itemCoverUrl = "itemCoverUrl"
        case itemWeight = "itemWeight"
        case itemWeightUnit = "itemWeightUnit"
        case itemDueDate = "itemDueDate"
        case itemOriginCountryID = "itemOriginCountryID"
        case itemOriginStateID = "itemOriginStateID"
        case itemOriginCityID = "itemOriginCityID"
        case itemDestinationCountryID = "itemDestinationCountryID"
        case itemDestinationStateID = "itemDestinationStateID"
        case itemDestinationCityID = "itemDestinationCityID"
        case itemPrice = "itemPrice"
        case itemRevenue = "itemRevenue"
        case itemQtyRequested = "itemQtyRequested"
        case itemComment = "itemComment"
        case itemUserID = "itemUserID"
        case itemURLReference = "itemURLReference"
        case itemCreatedAt = "itemCreatedAt"
        case itemUpdatedAt = "itemUpdatedAt"
        case itemStatus = "itemStatus"
        case itemIMG2 = "itemIMG2"
        case itemIMG3 = "itemIMG3"
        case itemIMG4 = "itemIMG4"
        case itemIMG5 = "itemIMG5"
        case itemCoversCount = "itemCoversCount"
        case itemCategoryID = "itemCategoryID"
        case requestType = "requestType"
        case itemAddressID = "itemAddressID"
        case itemSuggestedFare = "itemSuggestedFare"
        case itemSuggestedFareID = "itemSuggestedFareID"
        case itemOriginDisplayCountry = "itemOriginDisplayCountry"
        case itemOriginDisplayState = "itemOriginDisplayState"
        case itemOriginDisplayCity = "itemOriginDisplayCity"
        case itemDestDisplayCountry = "itemDestDisplayCountry"
        case itemDestDisplayState = "itemDestDisplayState"
        case itemDestDisplayCity = "itemDestDisplayCity"
        case itemUserRequesterName = "itemUserRequesterName"
        case itemUnitName = "itemUnitName"
    }
    
    
}
