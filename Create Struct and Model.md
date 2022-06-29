# Section 1

## Create a Landmark Model (랜드마크 모델 생성하기)

**1️⃣ Landmark 구조체 생성 및 정의**

- 구조체와 데이터 파일 간 데이터를 더 귑게 이동할 수 있도록 Codable 적합성을 추가
- 이후 섹션에서 파일(Landmark.json)에서 데이터를 읽기 위해 Codable 프로토콜을 준수하는 Decodable 컴포넌트에 의존하게 될 것.
    
    ```swift
    import Foundation
    
    struct Landmark: Hashable, Codable {
        var id: Int
        var name: String
        var park: String
        var state: String
        var description: String
    }
    ```
    </br>

📌 `각 랜드마크와 연결된 이미지를 모델링`

**2️⃣ Landmark 구조체 내 image를 로드하는 이미지 속성 추가**

- 이미지 이름을 읽고 asset catalog에서 이미지를 로드하는 이미지 속성을 추가
    
    ```swift
    import Foundation
    import SwiftUI
    
    struct Landmark: Hashable, Codable {
        var id: Int
        var name: String
        var park: String
        var state: String
        var description: String
        
        private var imageName: String
        var image: Image {
            Image(imageName)
        }
    }
    ```
    

  </br>

📌 `랜드마크의 위치에 대한 정보를 관리`

**3️⃣ Landmark 구조체 내 좌표 속성을 추가**

- JSON data 에서 사용하는 coordinates 속성을 그대로 사용하여 추가
    - **Coordinates type** → latitude, longitude 좌표 유형을 사용

<img width="207" alt="스크린샷 2022-06-29 오후 10 32 52" src="https://user-images.githubusercontent.com/63224278/176449159-adcb2667-2ff9-412e-9ee3-2d5d4d6d673a.png">


```swift
private var coordinates: Coordinates
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
```

**4️⃣ MapKit 프레임워크와 상호 작용하는 데 유용한 locationCoordinate 속성을 계산**

```swift
import MapKit

var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
```

 </br>

📌 `파일에서 랜드마크로 초기화된 배열을 생성`

**5️⃣ 앱의 기본 번들에서 지정된 이름의 JSON 데이터를 가져오는 load(_:) 메서드를 만들기**

- load 메소드는 Codable 프로토콜의 한 구성요소인 Decodable 프로토콜에 대한 반환 유형의 준수에 의존한다.
    
    ```swift
    //
    //  Utils.swift
    //  Landmarks
    //
    //  Created by hwangJi on 2022/06/28.
    //
    
    import Foundation
    
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    ```
     </br>

**6️⃣ LandmarkData.json에서 초기화하는 랜드마크 배열을 만들기**

```swift
var landmarks: [Landmark] = load("landmarkData.json")
```
 </br>

7️⃣ **파일들 그룹핑하기**

⇒ Views, Resources, Model

<img width="192" alt="스크린샷 2022-06-29 오후 10 35 11" src="https://user-images.githubusercontent.com/63224278/176449652-ed3a10b0-f596-408a-ba38-2a3d9aebbbc6.png">

