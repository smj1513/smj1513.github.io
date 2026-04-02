# MOA Mobile Layout Refinement Design

## Goal

MOA 프로젝트 카드에서 세로형 모바일 화면이 과하게 잘리는 문제를 줄이고, 사용자가 실제 앱 흐름을 더 자연스럽게 읽을 수 있도록 배치를 조정한다. 동시에 모델 설계 고민 섹션에 Attention Pooling과 CLS Pooling 비교 맥락을 보강한다.

## Context

현재 MOA 카드는 대표 이미지 아래에 보조 이미지와 갤러리를 두고 있지만, 모바일 캡처가 카드 썸네일 규격에 맞춰 잘리면서 핵심 UI가 충분히 보이지 않는다. 사용자는 모바일 화면을 배치한다는 느낌으로 재구성하길 원한다.

## Chosen Approach

1. 대표 이미지는 유지한다.
2. 실제 앱 화면은 `모바일 프레임/세로 카드` 느낌으로 3열 레이아웃을 만들고, 각 이미지는 `object-fit: contain`으로 보여 잘림보다 가독성을 우선한다.
3. 추가 이미지들은 2열 보조 갤러리로 두되, 역시 세로 스크린샷 특성에 맞춰 `contain` 중심으로 보여준다.
4. 기술 기여 섹션에 Attention Pooling과 CLS Pooling 비교, 선택 이유, 실험 관점의 고민을 서술한다.

## Why This Approach

- 기존 포트폴리오 카드 톤은 유지하면서 MOA만 과하게 다른 컴포넌트로 보이지 않는다.
- 세로형 모바일 UI 특성을 그대로 살려 서비스 맥락이 더 잘 전달된다.
- 모델 설계 고민을 텍스트로 보강해 단순 성능 수치보다 판단 과정이 드러난다.

## Affected Files

- `index.html`
- `css/style.css`
- `tests/moa-project-card.test.ps1`
