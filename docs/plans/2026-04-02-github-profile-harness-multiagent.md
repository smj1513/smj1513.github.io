# GitHub Profile Harness Engineering Update Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** GitHub 프로필 README에 하네스 엔지니어링과 멀티에이전트 시스템 관심사를 자연스럽게 추가한다.

**Architecture:** 기존 README 구조는 유지하고, 소개 문단 마지막 문장과 `Interests` 3개 항목만 조정한다. 새 키워드는 기존의 `문제 정의`, `검증`, `AI+백엔드`, `검색/RAG/LLM 운영` 흐름과 충돌하지 않도록 `실제 서비스`, `운영 품질`, `설계` 문맥 안에 배치한다.

**Tech Stack:** Markdown, Git, GitHub

---

### Task 1: 소개 문단에 하네스 엔지니어링 반영

**Files:**
- Modify: `C:\Users\SSAFY\portfolio\smj1513-profile\README.md`

**Step 1: 현재 소개 문단의 마지막 문장을 확인한다**

- `검색/RAG/LLM 시스템`과 `운영 품질`을 다루는 문장이 있는지 본다.

**Step 2: 하네스 엔지니어링과 멀티에이전트 시스템을 자연스럽게 포함한 문장으로 교체한다**

- `에이전트 하네스 엔지니어링`
- `멀티에이전트 시스템 설계`
- `실제 사용자 경험과 운영 품질`

이 세 축이 함께 드러나도록 쓴다.

**Step 3: 문단 길이가 과하게 늘어나지 않는지 확인한다**

- 문장 수는 유지하고, README 첫머리가 무겁지 않은지 점검한다.

### Task 2: Interests 항목 구체화

**Files:**
- Modify: `C:\Users\SSAFY\portfolio\smj1513-profile\README.md`

**Step 1: 3개 항목 수를 유지한다**

- 구조는 그대로 둔다.

**Step 2: 하네스 엔지니어링과 멀티에이전트 시스템을 항목명에 반영한다**

- 예시 방향:
  - `Problem Structuring, Validation & Performance Tuning`
  - `AI-Native Backend Systems, Harness Engineering & LLM Integration`
  - `Search, RAG, and Multi-Agent Systems for Real Services`

**Step 3: 전체 톤이 포트폴리오와 어긋나지 않는지 확인한다**

- 너무 유행어처럼 보이지 않고, 실제 작업 영역처럼 읽히는지 본다.

### Task 3: 변경 검증 및 원격 반영 확인

**Files:**
- Verify: `C:\Users\SSAFY\portfolio\smj1513-profile\README.md`

**Step 1: diff로 변경 범위를 확인한다**

Run: `git diff -- README.md`

Expected: 소개 문단 마지막 문장과 `Interests` 항목만 조정된 diff가 보인다.

**Step 2: 커밋과 푸시를 수행한다**

Run: `git add README.md`
Run: `git commit -m "docs: add harness and multi-agent interests to profile README"`
Run: `git push origin main`

Expected: `main` 브랜치 푸시 성공

**Step 3: 원격 README를 재조회한다**

- 원격 `smj1513/README.md`에서 새 문구가 실제로 반영되었는지 확인한다.
