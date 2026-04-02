# GitHub Portfolio Voice Alignment Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** GitHub 프로필 README와 포트폴리오 상단 소개 문구를 같은 문제 해결형 톤으로 정렬한다.

**Architecture:** 포트폴리오 레이아웃과 GitHub README의 배지 중심 구조는 유지한다. 대신 GitHub README의 인사말/관심사와 포트폴리오 상단 한 줄 소개만 수정해, 두 문서 모두 `문제 정의`, `검증`, `근거 있는 선택`, `AI+백엔드 구현`의 축을 공유하도록 만든다.

**Tech Stack:** HTML, Markdown, GitHub MCP

---

### Task 1: 정렬 대상 문구 확정

**Files:**
- Review: `index.html`
- Review remote: `smj1513/README.md`

**Step 1: 포트폴리오의 핵심 서사 축을 기준 문장으로 정리한다**

- 기준 축을 `문제 정의`, `판단 기준`, `검증`, `실제 구현`으로 고정한다.

**Step 2: GitHub README에서 교체할 영역을 한정한다**

- 인사말 1개 문단
- `Interests` 3개 불릿

**Step 3: 포트폴리오에서 조정할 영역을 한정한다**

- 프로필 카드의 quote 1문장

### Task 2: 포트폴리오 상단 한 줄 소개 수정

**Files:**
- Modify: `index.html`

**Step 1: 기존 quote 문장을 확인한다**

- 현재 문장: `꾸준한 배움을 통해 소통하며 성장하는 개발자 성민제입니다.`

**Step 2: 프로젝트/About me와 연결되는 새 문장으로 교체한다**

- 새 문장은 짧게 유지하되 `문제 정의`와 `검증`이 드러나야 한다.

**Step 3: 본문 흐름과 어색하지 않은지 확인한다**

- 바로 아래 `About me v2`와 중복되더라도 톤이 충돌하지 않는지 본다.

### Task 3: GitHub 프로필 README 문구 수정

**Files:**
- Modify remote: `smj1513/README.md`

**Step 1: 인사말을 포트폴리오 톤에 맞게 재작성한다**

- `관심이 많습니다` 중심 소개를 줄이고, 문제 해결 방식이 보이는 문장으로 교체한다.

**Step 2: Interests 항목을 포트폴리오 서사와 맞춘다**

- 예시 축:
  - `Problem Structuring & Validation`
  - `AI-Native Backend Systems`
  - `Search / RAG / LLM Ops`

**Step 3: 배지/통계/스택 구조는 그대로 유지한다**

- 구조 변경 없이 텍스트만 수정한다.

### Task 4: 변경 검증

**Files:**
- Verify: `index.html`
- Verify remote: `smj1513/README.md`

**Step 1: 로컬 포트폴리오 문구를 검색으로 확인한다**

Run: `rg -n "문제|검증|근거 있는 선택|quote" index.html`

Expected: 새 quote 문구가 확인된다.

**Step 2: 원격 README 반영 결과를 다시 조회한다**

- GitHub MCP로 `smj1513/README.md`를 재조회해 소개 문구와 `Interests`가 기대한 내용으로 바뀌었는지 확인한다.

**Step 3: 두 문서의 첫인상 축이 일치하는지 점검한다**

- 둘 다 `문제 정의`, `검증`, `실제 구현` 쪽 인상을 주는지 확인한다.
