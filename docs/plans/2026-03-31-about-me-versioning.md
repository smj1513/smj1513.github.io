# About Me Versioning Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** 기존 `About me` 문구를 `v1`으로 보관하고, 하단 이력의 방향성과 맞춘 `v2` 문구를 현재 화면에 노출한다.

**Architecture:** `index.html`의 `About me` 섹션을 버전별 문단 구조로 분리하고, `css/style.css`에서 활성 버전만 표시되도록 제어한다. 변경 범위는 정적 마크업과 스타일에 한정하며, 기존 내용은 삭제하지 않고 보존한다.

**Tech Stack:** HTML, CSS

---

### Task 1: 문구 버전 구조 추가

**Files:**
- Modify: `index.html`

**Step 1: 기존 About me 문구를 v1 블록으로 감싼다**

- `About me` 섹션의 기존 문단을 `data-version="v1"` 속성을 가진 보관용 블록으로 이동한다.

**Step 2: 새 About me v2 문구를 추가한다**

- 동일 섹션 안에 `data-version="v2"` 속성을 가진 활성 블록을 추가한다.
- `v2`는 기존 문체와 길이를 유지하면서도 `판단 기준`, `검증`, `문제 구조화`, `AI와 백엔드 구현`을 반영한다.

**Step 3: 현재 노출 버전을 v2로 지정한다**

- `v1`은 숨김 처리 가능한 클래스와 속성을 부여하고, `v2`에는 활성 클래스만 적용한다.

### Task 2: 스타일 정리

**Files:**
- Modify: `css/style.css`

**Step 1: About me 버전 관리용 클래스 추가**

- 숨김 버전과 활성 버전을 구분할 수 있는 최소한의 클래스를 추가한다.

**Step 2: 기존 텍스트 스타일과 충돌 없는지 확인한다**

- 기존 `.content-text p` 규칙을 유지하면서 새 클래스가 현재 레이아웃을 깨지 않도록 한다.

### Task 3: 변경 검증

**Files:**
- Modify: `index.html`
- Modify: `css/style.css`

**Step 1: 변경 내용을 검색으로 확인한다**

- `rg -n "data-version=\"v1\"|data-version=\"v2\"|about-version" index.html css/style.css`

**Step 2: 최종 표시 상태를 점검한다**

- `v1`이 코드에 남아 있고 `v2`가 활성 상태로 지정되었는지 확인한다.
