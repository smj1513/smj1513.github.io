# GitHub Profile Copy Expansion Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** GitHub 프로필 README의 소개 문단과 `Interests`를 더 풍성하게 확장해 포트폴리오 톤과 더 자연스럽게 맞춘다.

**Architecture:** GitHub 프로필 README의 전체 레이아웃은 유지하고, 소개 문단만 3문장 흐름으로 확장한다. `Interests`는 항목 수를 유지하되 더 구체적인 실무형 키워드로 교체해, 포트폴리오의 `문제 정의`, `검증`, `AI+백엔드`, `검색/RAG/LLM 운영` 축과 자연스럽게 연결되도록 만든다.

**Tech Stack:** Markdown, Git, GitHub

---

### Task 1: 소개 문단 확장

**Files:**
- Modify: `C:\Users\SSAFY\portfolio\smj1513-profile\README.md`

**Step 1: 현재 소개 문단을 확인한다**

- 현재 문구가 `태도` 중심인지, `기술 영역`과 `작업 방식`까지 충분히 드러나는지 점검한다.

**Step 2: 소개 문단을 3문장 흐름으로 재작성한다**

- 1문장: 문제 정의와 검증을 중시하는 태도
- 2문장: AI와 백엔드를 연결해 실제 서비스로 구현하는 방식
- 3문장: 검색/RAG/LLM 시스템을 운영 품질과 사용자 경험까지 포함해 다듬는 관심사

**Step 3: README에 반영한다**

- 소개 문단 아래 배지, 통계, 스택 레이아웃은 그대로 유지한다.

### Task 2: Interests 구체화

**Files:**
- Modify: `C:\Users\SSAFY\portfolio\smj1513-profile\README.md`

**Step 1: 기존 Interests 3개를 유지한다**

- 항목 수는 늘리지 않는다.

**Step 2: 항목명을 더 구체적인 실무 언어로 교체한다**

- 예시 방향:
  - `Problem Structuring, Validation & Performance Tuning`
  - `AI-Native Backend Systems & LLM Integration`
  - `Search, RAG, and LLM Ops for Real Services`

**Step 3: 포트폴리오 톤과 연결되는지 확인한다**

- 너무 추상적이지 않고, 프로젝트 경험이 자연스럽게 연상되는지 점검한다.

### Task 3: 변경 검증 및 원격 반영 확인

**Files:**
- Verify: `C:\Users\SSAFY\portfolio\smj1513-profile\README.md`

**Step 1: diff로 텍스트 변경 범위를 확인한다**

Run: `git diff -- README.md`

Expected: 소개 문단과 `Interests` 블록만 수정된 diff가 보인다.

**Step 2: 변경 사항을 커밋하고 푸시한다**

Run: `git add README.md`
Run: `git commit -m "docs: enrich profile README intro and interests"`
Run: `git push origin main`

Expected: `main` 브랜치 푸시 성공

**Step 3: 원격 파일을 재조회해 실제 반영 여부를 확인한다**

- GitHub에서 `smj1513/README.md`를 다시 읽어 새 문구가 보이는지 확인한다.
