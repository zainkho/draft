//
//  APIResponse.swift
//  Draft
//
//  Created by Zain Khoja on 12/7/19.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    
    let success: Bool
    let data: T
    
}
