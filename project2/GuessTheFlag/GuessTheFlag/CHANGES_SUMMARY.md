# GuessTheFlag 애니메이션 구현 변경사항 요약

## 과제 요구사항

1. 플래그를 탭하면 Y축으로 360도 회전
2. 선택하지 않은 두 플래그는 25% 투명도로 페이드아웃
3. 선택하지 않은 플래그에 세 번째 효과 추가 (크기 축소)

## 구현된 변경사항

### 1. 애니메이션 상태 변수 추가 (라인 28-31)

```swift
@State private var animationAmount = 0.0
@State private var opacityAmount = 1.0
@State private var scaleAmount = 1.0
@State private var selectedFlag: Int?
```

### 2. 플래그 탭 애니메이션 로직 수정 (라인 58-68)

```swift
withAnimation(.easeInOut(duration: 1)) {
    selectedFlag = number
    animationAmount += 360
    opacityAmount = 0.25
    scaleAmount = 0.8
}

DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    flagTapped(number)
}
```

### 3. Y축 360도 회전 애니메이션 (라인 72-75)

```swift
.rotation3DEffect(
    selectedFlag == number ? .degrees(animationAmount) : .degrees(0),
    axis: (x: 0, y: 1, z: 0)
)
```

### 4. 투명도 애니메이션 (라인 76-77)

```swift
.opacity(selectedFlag == nil ? 1.0 : (selectedFlag == number ? 1.0 : opacityAmount))
```

### 5. 크기 축소 애니메이션 (라인 78-79)

```swift
.scaleEffect(selectedFlag == nil ? 1.0 : (selectedFlag == number ? 1.0 : scaleAmount))
```

### 6. 애니메이션 상태 초기화 (라인 125-129)

```swift
selectedFlag = nil
animationAmount = 0.0
opacityAmount = 1.0
scaleAmount = 1.0
```

## 애니메이션 동작 설명

1. **선택된 플래그**: Y축으로 360도 회전하며 원래 크기와 투명도 유지
2. **선택되지 않은 플래그들**:
   - 투명도가 25%로 감소 (페이드아웃)
   - 크기가 80%로 축소 (스케일 다운)
3. **애니메이션 지속시간**: 1초
4. **점수 알림**: 애니메이션 완료 후 1초 지연하여 표시

## 파일 구조

- `ContentView.swift`: 수정된 메인 파일
- `Solution.swift`: 완전한 솔루션 파일
- `CHANGES_SUMMARY.md`: 이 요약 문서
