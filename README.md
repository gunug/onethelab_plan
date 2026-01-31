# onethelab_plan

모바일 게임 수익화 전략 연구 및 프로젝트 기획 문서 저장소입니다.

## 프로젝트 개요

이 저장소는 두 가지 주요 구성요소를 포함합니다:

### 1. 모바일 게임 광고 수익화 연구 (`plan_obsidian/`)

안드로이드 양산형 게임의 광고 수익화 모델에 대한 심층 분석 문서입니다. Obsidian 형식의 마크다운으로 작성되어 있습니다.

**포함 문서:**
- **안드로이드 양산형 게임과 광고** - 양산형 게임과 광고 모델에 대한 기본 고찰
- **모바일 게임 CPI와 LTV 데이터** - 광고 비용(CPI)과 사용자 생애 가치(LTV) 실제 데이터 분석
- **배너 광고 CPI와 LTV 분석** - 배너 광고만으로 수익화 가능 여부 검토
- **Skip-Its 광고 스킵 수익화 모델** - 광고 스킵 유료화 모델 분석
- **미니게임 모음형 CPI 공유 전략** - 미니게임 모음 앱으로 CPI를 공유하여 LTV를 높이는 전략
- **Simon Tatham's Puzzles 수익 구조 분석** - 완전 무료/광고 없음/오픈소스 전략 사례 연구

### 2. Chat Socket (`chat_socket/`)

Claude Code CLI를 웹 브라우저에서 사용할 수 있는 로컬 WebSocket 서버 프로젝트입니다.

자세한 내용은 [chat_socket/README.md](chat_socket/README.md)를 참조하세요.

## 폴더 구조

```
onethelab_plan/
├── README.md
├── CLAUDE.md              # 프로젝트 변경 기록
├── plan_obsidian/         # Obsidian 형식 기획 문서
│   ├── 안드로이드 양산형 게임과 광고.md
│   ├── 모바일 게임 CPI와 LTV 데이터.md
│   ├── 배너 광고 CPI와 LTV 분석.md
│   ├── Skip-Its 광고 스킵 수익화 모델.md
│   ├── 미니게임 모음형 CPI 공유 전략.md
│   ├── Simon Tatham's Puzzles 수익 구조 분석.md
│   └── .obsidian/         # Obsidian 설정
└── chat_socket/           # WebSocket 채팅 서버
    ├── server.py
    ├── index.html
    └── ...
```

## 사용 방법

### Obsidian으로 문서 열기

1. [Obsidian](https://obsidian.md/)을 설치합니다.
2. `plan_obsidian` 폴더를 Obsidian vault로 엽니다.
3. 문서 간 링크를 통해 연관된 내용을 탐색할 수 있습니다.

## 라이선스

이 저장소는 개인 연구 및 기획 목적으로 작성되었습니다.
