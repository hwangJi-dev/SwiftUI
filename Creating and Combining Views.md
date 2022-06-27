
# 1️⃣ Creating and Combining Views

  

### 💡 What About

  

- **SwiftUI 구조**

  

    ```
    App / Scene / View



    App

      —— Body(Scene)

          —— WindowGroup(View)



    App 내 > body 내(Scene) > 뷰(View)들로 구성된 윈도우 그룹(WindowGroup)
    ```



    🍑 **protocol** **App**



    - 앱의 콘텐츠를 나타내는 장면 유형

    - SwiftUI 앱 라이프 사이클을 사용하는 앱은 ✅ **App 프로토콜**을 준수하는 구조를 가지고 있다.

    - 사용자 지정 앱을 만들 때 Swift는 필수 `SwiftUI/App/body-swift.property` 속성 구현에서 이 유형을 유추한다.

    - @main 속성은 앱의 시작점을 나타낸다.



    </br>

    🥑 **associatedtype Body : Scene**



    - **앱의 콘텐츠 및 동작**

    - 구조체의 body 속성에서는 하나 이상의 장면을 반환하고, 차례로 표시할 콘텐츠를 제공한다.

    - **`associatedtype`** 이란?

    - 진짜 타입을 주는것이 아니라 타입의 견본(placeholder)을 주는 것

    - 사용할 실제 타입은 프로토콜이 적용되기 전까지 지정되지 않는다.



    </br>

----------

  

</br>

### 기본적으로 SwiftUI의 view 파일은 두 가지 구조체를 선언한다.

  

1️⃣ View 프로토콜을 준수하여 **뷰의 컨텐츠와 레이아웃을 구성**하는 구조체

  

- `View` 프로토콜을 따르고 보기의 내용과 레이아웃을 설명

  ```swift

  struct ContentView: View {
      var body: some View {
          Text("Hi! I'm Borabong!!")
              .padding()
      }
  }

  ```

  

2️⃣ previewProvider 프로토콜을 준수하는 **미리보기** 구조체

  

- 두 번째 구조는 해당 보기에 대한 미리보기를 선언

  

  ```swift

  // MARK: - ContentView_Previews
  // 컨텐츠 미리보기 provider
  struct ContentView_Previews: PreviewProvider {
      static var previews: some View {
          ContentView()
      }
  }  

  ```

    </br>

    <img width="375" alt="스크린샷 2022-06-28 오전 2 02 28" src="https://user-images.githubusercontent.com/63224278/175996087-987ac5dc-4645-402a-8d09-23debc252f4e.png">
