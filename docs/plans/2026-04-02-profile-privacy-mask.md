# Profile Privacy Mask Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** 첫 카드에 개인정보 마스킹 버튼을 추가해 GitHub/Hugging Face를 제외한 프로필 정보를 토글로 숨기고 다시 보이게 만든다.

**Architecture:** `index.html`에 토글 버튼과 마스킹 대상 클래스를 추가하고, `css/style.css`에서 `profile-card.is-masked` 상태에 따른 표시 방식을 정의한다. 간단한 인라인 스크립트로 버튼 클릭 시 카드 클래스와 버튼 라벨만 토글한다.

**Tech Stack:** HTML, CSS, vanilla JavaScript, PowerShell verification script

---

### Task 1: 실패하는 검증 스크립트 추가

**Files:**
- Create: `tests/profile-privacy-mask.test.ps1`

**Step 1: 기대 마크업을 검증하는 스크립트를 작성한다**

- `privacy-toggle` 버튼 존재
- 마스킹 대상 클래스 존재
- `is-masked` 토글 스크립트 존재

**Step 2: 스크립트를 실행해 실패를 확인한다**

Run: `powershell -ExecutionPolicy Bypass -File .\\tests\\profile-privacy-mask.test.ps1`

Expected: 버튼/클래스/스크립트가 없어서 FAIL

### Task 2: 마크업과 스타일 구현

**Files:**
- Modify: `index.html`
- Modify: `css/style.css`

**Step 1: 프로필 카드에 토글 버튼을 추가한다**

- 버튼은 카드 상단에 배치한다.

**Step 2: 마스킹 대상 요소에 공통 클래스를 부여한다**

- 이미지, 이름, 영문 이름, 한 줄 소개, Birth, E-Mail

**Step 3: CSS 마스킹 상태를 구현한다**

- 이미지 블러/어둡게
- 텍스트 숨김 및 플레이스홀더 처리
- 비마스킹 대상 링크는 그대로 표시

### Task 3: 토글 스크립트 구현

**Files:**
- Modify: `index.html`

**Step 1: 버튼 클릭 시 `is-masked` 클래스를 토글하는 스크립트를 추가한다**

- 버튼 라벨도 상태에 맞게 바꾼다.

**Step 2: 접근성 속성을 함께 갱신한다**

- `aria-pressed`

### Task 4: 검증

**Files:**
- Verify: `tests/profile-privacy-mask.test.ps1`
- Verify: `index.html`
- Verify: `css/style.css`

**Step 1: 검증 스크립트를 다시 실행한다**

Run: `powershell -ExecutionPolicy Bypass -File .\\tests\\profile-privacy-mask.test.ps1`

Expected: PASS

**Step 2: 브라우저에서 토글 동작을 확인한다**

- 버튼 클릭 시 GitHub/Hugging Face를 제외한 첫 카드 섹션이 마스킹/복원되는지 확인한다.
