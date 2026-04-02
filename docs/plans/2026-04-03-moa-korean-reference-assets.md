# MOA Korean Reference Assets Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Update the MOA project card so it only uses Korean-named reference assets in the example section and includes the goal-image sketching GIF.

**Architecture:** Lock the new asset rules in tests first, then switch the HTML references to Korean-named files, create a Korean-named GIF asset alias, and regenerate the overview board from the same allowed inputs.

**Tech Stack:** HTML, PowerShell tests, image asset generation

---

### Task 1: Add regression expectations

**Files:**
- Modify: `tests/moa-project-card.test.ps1`

**Step 1: Write the failing test**

Add checks that:
- Korean-named image references are present
- `목표이미지 스케칭.gif` is present
- previous `Screenshot_...` references used in the example area are absent

**Step 2: Run test to verify it fails**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\moa-project-card.test.ps1`

Expected: FAIL

### Task 2: Update MOA card asset references

**Files:**
- Modify: `index.html`

**Step 1: Write minimal implementation**

- Replace current English-named screenshot references with Korean-named references only.
- Add the sketching GIF panel.

**Step 2: Run tests**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\moa-project-card.test.ps1`

Expected: PASS or reduced failures

### Task 3: Regenerate overview asset

**Files:**
- Modify: `assets/images/MOA/moa-overview.png`
- Create: `assets/images/MOA/목표이미지 스케칭.gif`

**Step 1: Create Korean-named GIF alias**

Copy the existing GIF to the Korean name.

**Step 2: Regenerate overview**

Use only Korean-named assets for the board composition.

**Step 3: Verify**

Run:
- `powershell -ExecutionPolicy Bypass -File .\tests\moa-project-card.test.ps1`
- `powershell -ExecutionPolicy Bypass -File .\tests\profile-privacy-mask.test.ps1`

Expected: PASS
