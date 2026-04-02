# MOA Project Card Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** `MOA` 전체 서비스 관점의 새 프로젝트 카드를 포트폴리오에 추가하고, `MOA-Inference` 서버 기여를 기존 카드 형식에 맞춰 정리한다.

**Architecture:** `index.html`에 새 프로젝트 섹션을 추가하고, `css/style.css`에는 MOA 전용 이미지 쇼케이스/갤러리 스타일만 최소 추가한다. `assets/images/MOA/`의 원본 모바일 스크린샷은 가로형 대표 이미지와 쇼케이스 이미지로 재가공해 기존 카드와 유사한 시각 흐름을 만든다.

**Tech Stack:** HTML, CSS, PowerShell verification script, Python Pillow

---

### Task 1: 실패하는 검증 추가

**Files:**
- Create: `tests/moa-project-card.test.ps1`

**Step 1: 새 카드 기대값을 검증하는 스크립트를 작성한다**

- `MOA` 카드 제목 존재
- 날짜 `2026.02 ~ 2026.04` 존재
- `MOA-Inference` GitHub 링크 존재
- 대표 이미지 `assets/images/MOA/moa-main.png` 존재
- 쇼케이스 이미지 `assets/images/MOA/moa-overview.png` 존재

**Step 2: 스크립트를 실행해 실패를 확인한다**

Run: `powershell -ExecutionPolicy Bypass -File .\\tests\\moa-project-card.test.ps1`

Expected: FAIL

### Task 2: 이미지 가공

**Files:**
- Create: `assets/images/MOA/moa-main.png`
- Create: `assets/images/MOA/moa-overview.png`

**Step 1: 진입화면 스크린샷으로 대표 이미지를 만든다**

- 가로형 카드 메인 이미지 비율에 맞게 정리한다.

**Step 2: 모바일 화면 3장을 묶은 쇼케이스 이미지를 만든다**

- 대시보드, 목표, AI 코치 흐름이 보이도록 배치한다.

### Task 3: 카드 마크업 추가

**Files:**
- Modify: `index.html`

**Step 1: `Projects` 맨 위에 MOA 카드 섹션을 추가한다**

- 기존 카드 구조를 최대한 그대로 따른다.

**Step 2: 전체 서비스 기준 설명과 AI 서버 기여를 함께 정리한다**

- 서비스 개요
- 내용
- 역할 및 기여
- 고민 및 구현
- 결과와 회고

### Task 4: 스타일 최소 보강

**Files:**
- Modify: `css/style.css`

**Step 1: MOA 전용 쇼케이스/갤러리 스타일을 추가한다**

- 기존 카드와 어울리는 톤 유지
- 모바일에서도 깨지지 않도록 반응형 처리

### Task 5: 검증

**Files:**
- Verify: `tests/moa-project-card.test.ps1`
- Verify: `index.html`
- Verify: `css/style.css`

**Step 1: 검증 스크립트를 다시 실행한다**

Run: `powershell -ExecutionPolicy Bypass -File .\\tests\\moa-project-card.test.ps1`

Expected: PASS

**Step 2: 브라우저에서 레이아웃을 확인한다**

- 대표 이미지 비율
- 카드 전체 길이
- 보조 갤러리 정렬
- 기존 카드와의 시각적 연결감
