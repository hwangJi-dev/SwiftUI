//
//  LandmarkList.swift
//  Landmarks
//
//  Created by hwangJi on 2022/06/30.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // ① 각 요소의 keyPath를 전달하는 방법
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        // ② 데이터 유형(Landmark)이 Identifiable 프로토콜에 적합하도록 하여 코드 단순화
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Preview: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
