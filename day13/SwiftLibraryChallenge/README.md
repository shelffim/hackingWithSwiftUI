
# Swift 실무 응용 과제: 디지털 라이브러리 관리 시스템 만들기 (CLI)

Hacking with Swift Day 13에서 학습한 `Protocols`와 `Extensions` 개념을 활용하여, 순수 Swift만으로 동작하는 커맨드 라인 기반의 디지털 라이브러리 관리 시스템을 만들어 보세요.

## 과제 목표

- `protocol`을 사용하여 여러 데이터 타입에 대한 공통 인터페이스를 정의하고 활용합니다.
- `protocol extension`을 사용하여 프로토콜에 기본 구현을 제공하는 방법을 이해합니다.
- `extension`을 사용하여 기존 타입에 새로운 기능을 추가합니다.
- `Equatable` 및 `Comparable` 프로토콜을 사용하여 객체를 비교하고 정렬하는 능력을 보여줍니다.

## 요구사항

1.  **`Media.swift`** 파일을 생성하고, 다음 요구사항을 만족하는 프로토콜과 데이터 타입을 만드세요.

    *   **`Media` 프로토콜**
        *   `id` (UUID, 읽기 전용): 각 미디어를 고유하게 식별하는 프로퍼티.
        *   `title` (String, 읽기/쓰기): 미디어의 제목.
        *   `author` (String, 읽기/쓰기): 저자 또는 제작자.
        *   `getDetails()` -> String: 미디어의 상세 정보를 문자열로 반환하는 메소드.

    *   **`Book` 구조체**
        *   `Media` 프로토콜을 채택해야 합니다.
        *   `pageCount` (Int) 프로퍼티를 추가로 가져야 합니다.
        *   `getDetails()` 메소드는 책의 제목, 저자, 페이지 수를 포함한 정보를 반환해야 합니다.

    *   **`Magazine` 구조체**
        *   `Media` 프로토콜을 채택해야 합니다.
        *   `issueNumber` (Int) 프로퍼티를 추가로 가져야 합니다.
        *   `getDetails()` 메소드는 잡지의 제목, 저자, 호수(issue number)를 포함한 정보를 반환해야 합니다.

2.  **`Library.swift`** 파일을 생성하고, 다음 요구사항을 만족하는 구조체를 만드세요.

    *   **`Library` 구조체**
        *   `items` ([Media]) 프로퍼티: `Media` 프로토콜을 따르는 모든 타입의 객체를 저장할 배열.
        *   `add(media: Media)`: 라이브러리에 새 미디어를 추가하는 메소드.
        *   `listAllMedia()`: 라이브러리의 모든 미디어에 대해 `getDetails()`를 호출하여 출력하는 메소드.

3.  **프로토콜 확장 (Protocol Extensions)**

    *   `Media` 프로토콜의 `extension`을 만들어, `id` 프로퍼티에 대한 기본값을 `UUID()`로 제공하세요. 이렇게 하면 `Book`과 `Magazine`에서 `id`를 직접 구현할 필요가 없어집니다.
    *   `Media` 프로토콜을 `Equatable`을 상속하도록 수정하고, `extension`을 통해 `id`가 같으면 두 미디어가 같은 것으로 간주하는 `==` 연산자를 구현하세요.

4.  **타입 확장 (Type Extensions)**

    *   `Library` 구조체의 `extension`을 만들어, `listAuthors()` 라는 새로운 메소드를 추가하세요. 이 메소드는 라이브러리에 있는 모든 미디어의 저자 이름을 중복 없이 출력해야 합니다.

5.  **`main.swift` 에서 시스템 실행**

    *   `Library` 인스턴스를 생성하세요.
    *   여러 권의 `Book`과 `Magazine`을 생성하여 라이브러리에 추가하세요.
    *   `listAllMedia()`를 호출하여 모든 미디어 정보를 확인하세요.
    *   `listAuthors()`를 호출하여 모든 저자 목록을 확인하세요.
    *   (보너스) `Media` 프로토콜이 `Comparable`을 따르도록 하고, 제목(title)을 기준으로 미디어를 정렬하는 기능을 `Library`에 추가해 보세요.

## 제출 방법

- 이 프로젝트를 완성한 후, `solution.swift` 파일의 주석 처리된 정답 코드와 자신의 코드를 비교하며 학습한 내용을 점검하세요.

