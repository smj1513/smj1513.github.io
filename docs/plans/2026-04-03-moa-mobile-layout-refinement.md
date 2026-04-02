# MOA Mobile Layout Refinement Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Refine the MOA project card so mobile screenshots keep their vertical composition and add explicit Attention Pooling vs CLS Pooling reasoning to the project write-up.

**Architecture:** Keep the current project-card structure, replace the screenshot area with a phone-style screen layout, then extend the technical contribution copy in the model section. Update the regression test first so the new structure is verified before HTML/CSS changes.

**Tech Stack:** HTML, CSS, PowerShell tests

---

### Task 1: Update regression expectations

**Files:**
- Modify: `tests/moa-project-card.test.ps1`

**Step 1: Write the failing test**

Add checks for:
- `moa-mobile-strip`
- `moa-mobile-shot`
- `object-fit: contain` related layout class references
- `CLS Pooling`
- `Attention Pooling`

**Step 2: Run test to verify it fails**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\moa-project-card.test.ps1`

Expected: FAIL because the new layout hooks and text do not exist yet.

**Step 3: Commit**

Skip commit for now; keep changes staged for implementation.

### Task 2: Refine MOA screenshot layout

**Files:**
- Modify: `index.html`
- Modify: `css/style.css`

**Step 1: Write minimal implementation**

- Replace the current MOA screenshot block with a mobile-first strip that keeps screenshots vertical.
- Add CSS for a 3-column phone-style layout on desktop and 1-column stacking on mobile.
- Preserve the representative image and overall card tone.

**Step 2: Run test to verify it passes**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\moa-project-card.test.ps1`

Expected: PASS

### Task 3: Add model-design reasoning copy

**Files:**
- Modify: `index.html`

**Step 1: Write minimal implementation**

Add a short explanation in the technical contributions/challenges area covering:
- why CLS Pooling was a candidate
- why Attention Pooling was selected
- what signal characteristics of transaction text drove the choice

**Step 2: Run tests**

Run:
- `powershell -ExecutionPolicy Bypass -File .\tests\moa-project-card.test.ps1`
- `powershell -ExecutionPolicy Bypass -File .\tests\profile-privacy-mask.test.ps1`

Expected: PASS

### Task 4: Visual verification

**Files:**
- No source changes required

**Step 1: Render local page**

Open the local portfolio page and verify the MOA card shows vertical screenshots without severe cropping.

**Step 2: Capture evidence**

Use a headless browser screenshot or equivalent local validation artifact.
