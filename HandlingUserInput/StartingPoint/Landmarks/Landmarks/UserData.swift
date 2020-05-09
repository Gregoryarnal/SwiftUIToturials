//
//  UserData.swift
//  Landmarks
//
//  Created by Gregory Arnal on 06/05/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI


import Combine

final class UserData: ObservableObject  {
    @Published var showFavoriteOnly = false
    @Published var landmarks = landmarkData
}
