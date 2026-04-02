# MOA Korean Reference Assets Design

## Goal

MOA 프로젝트 카드의 예시 이미지 영역이 사용자가 직접 정리한 한글명 참조 이미지들만 사용하도록 정리하고, 목표 이미지 스케칭 GIF를 반드시 포함한다.

## Requirements

- 화면 예시 영역에서는 `MOA` 폴더 하위 한글명 참조 이미지들만 사용한다.
- GIF는 `목표이미지 스케칭`이라는 이름으로 반드시 포함한다.
- 기존 영문 스크린샷 파일은 더 이상 예시 영역에서 사용하지 않는다.
- 현재 모바일 카드 레이아웃 톤은 유지한다.

## Chosen Approach

1. 영문 GIF 파일을 한글명 `목표이미지 스케칭.gif`로 복사해 참조 자산 이름을 통일한다.
2. 모바일 화면 3장은 `지출그래프.jpg`, `저축이력.jpg`, `AI코칭.jpg`를 사용한다.
3. 하단 보드는 `여행 목표.jpg`, `목표이미지 생성.jpg`, `목표이미지 스케칭.gif`로 구성한다.
4. 합성 overview 이미지도 같은 한글명 자산만 사용해 재생성한다.

## Why This Approach

- 사용자가 의도적으로 정리한 자산명을 그대로 반영할 수 있다.
- 서비스 흐름상 `분석 -> 목표/저축 -> AI코칭 -> 생성/스케칭`이 자연스럽게 읽힌다.
- 현재 카드 구조를 크게 흔들지 않고 요구사항만 정확히 반영할 수 있다.

## Affected Files

- `index.html`
- `tests/moa-project-card.test.ps1`
- `assets/images/MOA/moa-overview.png`
