# ProjecTree

## 개요
### 시스템의 목표
ProjecTree는 "막막한 프로젝트 기획의 길잡이"이자 "나를 가장 잘 아는 포트폴리오 작가"가 되는 것을 목표로 합니다.

많은 초보 개발자들이 프로젝트를 시작할 때 '무엇을, 어떻게, 어떤 순서로' 만들어야 할지 기획 단계에서 어려움을 겪습니다. 또한 프로젝트가 끝난 후에는 '내가 무엇을 기여했는지'를 정리하여 포트폴리오로 녹여내는 데에 많은 시간을 쏟습니다.

ProjecTree는 이러한 문제를 해결하기 위해 다음과 같은 가치를 제공합니다.

1.  AI 기반의 맥락 인식형 프로젝트 설계:
    -   단순한 할 일 생성을 넘어, 프로젝트의 목표, 기술 스택, 팀 규모, 개발 기간 등 전반적인 맥락을 이해하는 AI가 참여합니다.
    -   이러한 맥락을 바탕으로 대주제 → 요구사항 → 세부 작업으로 이어지는 계층적 구조를 논리적으로 분해하고 제안합니다.
    -   이를 통해 사용자는 체계적인 WBS를 손쉽게 구축할 수 있습니다.

2.  과정 중심의 포트폴리오 자동화:
    -   개발 과정에서 자연스럽게 축적된 태스크와 기술적 의사결정을 AI가 분석합니다.
    -   단순 나열식이 아닌, 문제 해결 과정과 기술적 깊이가 드러나는 스토리텔링형 포트폴리오를 자동으로 생성합니다.

3.  실시간 협업과 데이터 동기화:
    -   CRDT 기술을 통해 팀원들이 동시에 기획하고 수정하는 내용을 충돌 없이 실시간으로 동기화하여 쾌적한 협업 환경을 보장합니다.

4.  의사결정을 돕는 기술 스택 추천:
    -   단순한 "추천"을 넘어, 왜 이 기술을 써야 하는지에 대한 논리적 근거를 제공합니다.
    -   프론트엔드/백엔드등 각 분야별 전문가가 투입되어, 동일 레이어 내의 경쟁 기술 3가지를 심층 비교 분석합니다.
    -   선택 장애를 겪는 주니어 개발자들에게 기술적 트레이드오프를 고려한 의사결정 경험을 제공합니다.

- 트리 구조의 직관적인 프로젝트 시각화: 복잡한 프로젝트 구조를 한눈에 파악할 수 잇습니다.
- 실시간 협업: CRDT 기술을 적용하여 팀원 간의 실시간 동기화를 지원합니다.
- AI 기반 포트폴리오 자동 생성: 사용자가 수행한 태스크와 기술적 메모를 분석하여 자동으로 포트폴리오 초안을 작성합니다.

## 프로젝트 구조
(배치 다이어그램 추가)

---
## 역할 및 기여

### 1. 기획 프로세스를 반영한 Context-Aware 에이전트 설계
**문제 상황**
단순히 "이 기능 만들어줘"라고 했을 때 뚝딱 코드를 짜주는 AI는 많지만, 프로젝트의 전체적인 맥락을 이해하고 기획부터 함께 해주는 AI는 드뭅니다. 저는 실제 개발팀이 기획하는 프로세스를 AI에게 학습시키고 싶었습니다.

**해결 과정**
AI에게 'Senior PM → Product Owner → Tech Lead'로 이어지는 수직적인 역할을 부여했습니다. Senior PM은 프로젝트의 목표와 비즈니스 가치를 정의하고, Product Owner는 이를 사용자 요구사항으로 구체화하며, Tech Lead는 실제 구현 가능한 기술 단위로 작업을 세분화하도록 설계했습니다. 또한 피드백 루프를 구현하여 생성된 결과물이 JSON Schema에 부합하지 않거나 논리적 오류가 있을 경우, 이를 즉시 감지하고 스스로 수정하도록 하여 에이전트의 안정성을 확보했습니다.

이러한 수직적 역할 부여와 피드백 시스템 덕분에 AI가 단순히 텍스트를 생성하는 것을 넘어, 마치 팀원처럼 프로젝트의 흐름을 이해하고 제안하는 사용자 경험을 제공할 수 있었습니다.

```python
# app/agents/node/prompts/system/process_prompts.py
EPIC_PROCESS_PROMPT = "당신은 수석 프로젝트 매니저(Senior PM)입니다... 비즈니스 가치를 고려하세요."
```

### 2. CRDT 폴링을 활용한 실시간 피드백 시스템 구축
**문제 상황**
LangGraph 기반의 에이전트는 복잡한 연산을 수행하기 때문에 응답 시간이 길어질 수밖에 없습니다. 화면이 멈춘 채로 로딩 스피너만 돌아가면 사용자는 진행 상황을 알 수 없어 막연한 불안감을 느끼게 됩니다.

**해결 과정**
AI의 '생각하는 과정'을 사용자에게 투명하게 보여주기로 했습니다. 별도의 SSE 서버를 구축하는 대신, 이미 실시간 데이터 동기화를 위해 구축된 CRDT 서버를 활용하기로 결정했습니다. LangChain의 콜백 핸들러를 커스터마이징하여, 에이전트의 상태 변화(도구 실행, 생각 중 등)가 감지될 때마다 CRDT 서버에 폴링(Polling) 방식으로 업데이트 요청을 보내도록 구성했습니다.

"프론트엔드 기술 스택을 분석 중입니다...", "관련 문서를 검색하고 있습니다..." 같은 메시지가 실시간으로 중계되니, 사용자는 기다리는 시간을 지루해하지 않고 오히려 AI가 열심히 일하고 있다는 신뢰를 얻을 수 있었습니다.

```python
# app/core/callback.py
async def on_tool_start(self, ...):
    # 이벤트 발생 시 CRDT 서버로 상태 전송 (Polling Request)
    await self.crdt_client.send({
        "body": { "content": "🔧 도구를 실행 중입니다..." }
    })
```

### 3. 비용 최적화를 위한 이중(Two-Pass) 파이프라인 개발
**문제 상황**
사용자가 남긴 모든 활동 로그를 무턱대고 AI에게 넘기니 토큰 비용이 감당하기 힘들 정도로 발생했습니다. 게다가 오타 수정 같은 사소한 변경 사항까지 포함되니 정작 중요한 기술적 성과가 희석되는 문제도 있었습니다.

**해결 과정**
작업을 두 단계로 나누는 Two-Pass Pipeline을 도입했습니다.
1. Filtering Phase: 가볍고 빠른 모델(GPT-4o-mini)로 전체 로그를 훑으며 "이게 기술적으로 의미 있는 내용인가?"를 판단하게 합니다.
2. Generation Phase: 여기서 선별된 핵심 데이터만 고성능 모델에게 넘겨 포트폴리오 작성을 맡깁니다.

파이프라인을 분리함으로써 API 비용은 대폭 줄이면서도, 포트폴리오의 내용적 밀도는 훨씬 높일 수 있었습니다.

### 4. 검색 도메인 제어를 위한 커스텀 미들웨어 개발
**문제 상황**
초급 개발자분들에게는 공식 문서보다는 진입장벽이 낮은 '양질의 기술 블로그'를 추천해주고 싶었습니다. 하지만 LLM에게 "블로그 위주로 찾아줘"라고 프롬프트로 아무리 강조해도, 방대한 공식 문서나 단편적인 커뮤니티(StackOverflow 등) 글을 가져오는 경우가 빈번했습니다.

**해결 과정**
확실한 통제를 위해 LangChain의 Custom Middleware를 도입하여 시스템 레벨에서 검색 범위를 강제했습니다. 모델이 검색 도구를 호출하는 순간을 미들웨어가 가로채서, 사전에 검증된 도메인 화이트 리스트를 검색 인자에 주입해버리는 방식입니다. 덕분에 에이전트는 제가 의도한 양질의 정보 내에서만 답변을 생성하게 되었고, 결과적으로 사용자에게 신뢰도 높은 기술 아티클을 제공할 수 있게 되었습니다.

```python
# app/agents/recommend/middleware.py
class SearchDomainMiddleware(AgentMiddleware):
    def wrap_tool_call(self, request: ToolCallRequest, handler):
        if request.tool_call['name'] == 'restricted_search':
            request.tool_call['args']['include_domains'] = self.allowed_domains
        return handler(request)
```

### 5. 기술 스택 제외 및 비교 분석 로직 구현
**접근 방법**
단순히 "이 기술이 좋습니다"라고 추천하는 것은 주니어 개발자의 성장에 도움이 되지 않는다고 생각했습니다. 또한 LLM이 인기 있는 기술만 반복적으로 추천하는 경향이 있어, 사용자가 다양한 기술을 접할 기회가 부족했습니다.

이를 해결하기 위해 Negative Constraint와 Layer Comparison 기법을 도입했습니다. 이미 추천받은 기술 목록을 프롬프트에 제외 조건으로 명시하여 새로운 대안을 찾도록 유도했으며, "WebSocket vs SSE" 처럼 같은 계층에 있는 경쟁 기술들을 비교 분석하도록 했습니다. 이를 통해 사용자는 단순히 정답을 얻는 것이 아니라, "왜 내 프로젝트에 이 기술이 적합한가?"에 대한 논리적 근거를 확보할 수 있게 되었습니다.

### 6. Langfuse 기반 LLM Observability 환경 구축
**문제 상황**
LLM 애플리케이션은 입력과 출력 사이의 과정이 불투명한 '블랙박스'와 같습니다. "왜 에이전트가 이런 엉뚱한 답을 했지?", "어떤 단계에서 병목이 발생해 응답이 느려진 거지?"와 같은 문제를 디버깅하기가 매우 어려웠습니다.
특히 개발 초기, 에이전트의 모델로 gpt-5-nano와 gpt-5-mini 모델을 사용했습니다. 해당 모델을 베이스로 하여 ReAct에이전트를 구성하였을 때, 동일한 도구를 10번 가까이 호출하며 응답 시간이 5분 이상 걸리는 문제가 있었습니다.

**해결 과정**
Langfuse를 도입하여 에이전트의 모든 실행 과정을 시각화하고 추적할 수 있는 MLOps 환경을 구축했습니다. 결과적으로 특정 태스크에서 모델의 내장 추론 기능과 ReAct에이전트의 시스템프롬프트로 제공한 추론 지시가 충돌을 일으켜 동일한 도구를 여러번 사용하는 루프에 빠진 것을 확인하고 명시적 통제를 위해 모델의 자체 추론 기능을 억제하여 문제를 해결하며 지시한 상황에서만 추론을 하도록 유도하여 응답 시간을 30초까지 단축시켰습니다.
<img width="2862" height="1440" alt="image" src="https://github.com/user-attachments/assets/09cf2e88-8c95-4a49-a1e0-142b59f9e9e2" />


**성과**
이를 통해 문제 발생 시 트레이스를 역추적하여 원인을 빠르게 파악할 수 있게 되었고, 프롬프트 개선을 통한 성능 향상 효과를 정량적으로 측정할 수 있는 환경을 마련했습니다.
결과적으로 ReAct 에이전트의 응답 시간을 5분 -> 30초로 단축시켰습니다.


### 7. GitHub OAuth2 이메일 누락 대응 및 사용자 정보 동기화
**문제 상황**
GitHub 소셜 로그인을 구현하는 과정에서, 일부 사용자의 이메일 정보가 `null`로 저장되는 현상을 발견했습니다. 원인을 분석해보니, GitHub 계정 설정에서 이메일을 'Private'로 설정한 경우 기본 API 응답에 이메일이 포함되지 않는 것이 문제였습니다.

**해결 과정**
이를 해결하기 위해 `CustomOAuth2UserService`를 구현하여, 기본 프로필 조회 후 이메일이 없는 경우 GitHub의 이메일 전용 API(`https://api.github.com/user/emails`)를 추가로 호출하도록 로직을 개선했습니다. 단순히 아무 이메일이나 가져오는 것이 아니라, 응답값 중 `primary: true`로 설정된 주 사용 이메일을 필터링하여 정확한 연락처를 확보했습니다.

이메일 정보 누락 없는 안정적인 회원가입 프로세스를 구축하여, 추후 이메일 기반의 알림 서비스나 계정 복구 기능을 문제없이 제공할 수 있는 기반을 마련했습니다.

### 8. JPA Inheritance(JOINED)를 활용한 확장성 있는 엔티티 설계
**문제 상황**
프로젝트의 핵심 도메인인 Epic, Story, Task는 서로 위계가 다른 개념이지만, ID, 제목, 상태, 담당자 등 공통적인 속성을 많이 공유하고 있습니다. 이를 각각 별도의 테이블로 만들면 중복 코드가 많아지고 유지보수가 어려워질뿐더러 데이터의 일관성을 관리하기 어려웠습니다.

**해결 과정**
코드의 재사용성과 데이터베이스 정규화를 위해 JPA의 `InheritanceType.JOINED` 전략을 사용했습니다. 공통 속성은 `Node`라는 부모 엔티티로 정의하여 관리하고, 각 타입별 고유한 비즈니스 로직과 속성은 자식 엔티티인 Epic, Story, Task로 분리했습니다. 결과적으로 애플리케이션 코드에서는 객체지향의 다형성을 활용하여 유연한 비즈니스 로직 처리가 가능해졌고, 데이터베이스 스키마는 불필요한 중복을 제거한 깔끔한 구조를 갖추게 되었습니다.

### 9. Closure Table 도입을 통한 계층 조회 성능 최적화 (12초 → 0.8초)
**문제 상황**
초기에는 자기 참조(Self-Referencing) 방식을 사용했으나, 데이터를 약 5,500만 건으로 늘려 테스트 하였을 때 계층이 깊어질수록(5단계) 재귀 쿼리의 부하가 심해졌습니다. 특정 프로젝트의 하위 트리를 모두 조회하는 데 약 12초(12,070ms)가 소요되어 실시간 트리 렌더링이 불가능 했습니다.

**해결 과정**
조회 성능 개선을 위해 **Closure Table** 패턴을 도입하여 모든 조상-후손 관계를 별도의 테이블로 풀어냈습니다. 또한 `descendant_id` 컬럼에 인덱스를 적용하여 조인 성능을 극대화했습니다. 

**성과**
동일 데이터 환경에서 조회 시간을 **0.8초(804ms)**로 단축시키며 **약 15배의 성능 향상**을 이뤄냈습니다. 쓰기 비용이 다소 증가하더라도, 읽기 빈도가 압도적으로 높은 서비스 특성에 부합하는 최적의 설계를 찾아냈습니다.

### 10. 복잡한 비즈니스 요구사항을 처리하는 Node API 개발
**주요 기능**
다양한 노드 타입(Epic, Story, Task)을 일관된 방식으로 생성하기 위해 팩토리 메서드 패턴(`createByNodeType`)을 적용하고, `InferenceService`와 연동하여 AI가 생성한 기획 내용을 실제 DB 엔티티로 변환하는 복잡한 로직을 구현했습니다. 또한 `NodeCrdtService`를 통해 노드 생성 및 수정 이벤트를 CRDT 서버로 실시간 전송하여, 협업 중인 팀원들에게 즉각적으로 변경 사항이 반영되도록 처리했습니다.


## 화면 시안
### 메인 화면
<img width="2848" height="1446" alt="메인화면 1" src="https://github.com/user-attachments/assets/e1a7515c-c5eb-49d1-be42-71f8825899e4" />
<img width="2846" height="1458" alt="메인화면 2" src="https://github.com/user-attachments/assets/d4f79b89-af06-45d2-8f70-7d3eaf6d0022" />
<img width="2834" height="1448" alt="메인화면3" src="https://github.com/user-attachments/assets/f76f378e-a8eb-4aca-a0a3-51665e949223" />

### 워크스페이스 페이지
<img width="2124" height="1186" alt="트리에디터" src="https://github.com/user-attachments/assets/821737ee-eb58-481c-b07e-b596f1d13a16" />
<img width="2124" height="1144" alt="기능명세서" src="https://github.com/user-attachments/assets/8e55eee4-6366-4920-a19a-9d61678c0c01" />

### 노드 상세 페이지
<img width="2832" height="1468" alt="image" src="https://github.com/user-attachments/assets/6b08c6a4-d757-4e5a-b2e7-b4af3140ed91" />
<img width="2842" height="1464" alt="image" src="https://github.com/user-attachments/assets/0bb24bec-c8db-49ab-b556-f45b11a1dd1c" />
<img width="2268" height="1170" alt="image" src="https://github.com/user-attachments/assets/440333bc-e26a-408a-a988-e3d61455e88c" />

### 노드 상세 설명 페이지 - 에픽
<img width="2872" height="1422" alt="image" src="https://github.com/user-attachments/assets/4583adb6-3877-4d3d-b680-2afd7363205e" />

### 노드 상세 설명 페이지 - 스토리
<img width="2880" height="1464" alt="image" src="https://github.com/user-attachments/assets/43266f9f-c3b7-40ed-aa5c-6e2217110e25" />


### 노드 상세 설명 페이지 - 태스크
<img width="2260" height="1328" alt="image" src="https://github.com/user-attachments/assets/1872b2c2-4498-4b59-b556-5d8e3027ec7d" />



### 포트폴리오 생성 페이지
<img width="2876" height="1470" alt="포트폴리오 페이지" src="https://github.com/user-attachments/assets/78396e50-8c80-43dc-add1-c41262d4f5ca" />
<img width="2876" height="1434" alt="포트폴리오" src="https://github.com/user-attachments/assets/0af7618b-c028-4eb7-8aa5-25ecbe429258" />
<img width="2868" height="1460" alt="포트폴리오2" src="https://github.com/user-attachments/assets/0b8b3377-69c6-4420-8074-7ce8b83a7b33" />
<img width="2842" height="1440" alt="포트폴리오3" src="https://github.com/user-attachments/assets/82761db3-623a-4a6c-a377-48194e087fd0" />

### 기능명세서 페이지
<img width="2124" height="1144" alt="기능명세서" src="https://github.com/user-attachments/assets/da8960e5-2110-44b1-9461-4264fbcf6bd1" />

### 로그인 페이지
<img width="2852" height="1458" alt="로그인 화면" src="https://github.com/user-attachments/assets/cabe631b-106d-428e-9aa4-2dede5db6557" />

### 워크스페이스 생성
<img width="2862" height="1448" alt="워크스페이스 생성" src="https://github.com/user-attachments/assets/8fd2822c-3c2b-4bf7-8efe-ff21feeb9e8b" />
<img width="2854" height="1460" alt="워크스페이스 생성2" src="https://github.com/user-attachments/assets/f0e1927a-ae77-4e52-8fe5-e4571a62b834" />
<img width="2852" height="1458" alt="워크스페이스 생성5" src="https://github.com/user-attachments/assets/e4bd16ff-f609-4b85-ae8f-158812fe52f4" />
<img width="2864" height="1460" alt="워크스페이스 생성3" src="https://github.com/user-attachments/assets/581edb1b-70fd-44ad-ab9d-56076021c8b9" />
<img width="2862" height="1466" alt="워크스페이스 생성4" src="https://github.com/user-attachments/assets/e1c6fbe4-e440-4ad3-bc30-f2e142176502" />
<img width="2852" height="1472" alt="워크스페이스 생성6" src="https://github.com/user-attachments/assets/c3ea52a0-0dae-42fb-8e13-3379aab14e1c" />

### 워크스페이스 라운지
<img width="2868" height="1448" alt="워크스페이스라운지" src="https://github.com/user-attachments/assets/7ad67f98-4bef-4e06-8670-4121c4f6e253" />

