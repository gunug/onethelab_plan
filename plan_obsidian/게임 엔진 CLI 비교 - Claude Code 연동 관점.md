# 게임 엔진 CLI 비교 - Claude Code 연동 관점

> **핵심 질문**: Claude Code로 게임 개발을 자동화할 수 있는가?

## 결론 요약

| 엔진 | CLI 지원 | Claude Code 연동 | 추천도 |
|------|----------|------------------|--------|
| **Godot** | ⭐⭐⭐⭐⭐ | 최적 | 🥇 1위 |
| **Unity** | ⭐⭐⭐⭐ | 우수 | 🥈 2위 |
| **Defold** | ⭐⭐⭐⭐ | 우수 | 🥉 3위 |
| **Cocos Creator** | ⭐⭐⭐ | 양호 | 4위 |
| **Unreal Engine** | ⭐⭐⭐ | 제한적 | 5위 |

---

## 1. Godot Engine

### CLI 지원 현황
```bash
# 프로젝트 빌드 (headless 모드)
godot --headless --path /project --export-release "Android" game.apk

# 스크립트 실행
godot --headless --script res://build_script.gd

# 에디터 열기 (특정 씬)
godot --path /project --editor res://main.tscn
```

### Claude Code 연동 평가: ⭐⭐⭐⭐⭐ (최적)

**장점:**
- **완전한 headless 모드**: GUI 없이 빌드/실행 가능
- **GDScript = 텍스트 기반**: 모든 코드가 일반 텍스트 파일
- **씬 파일(.tscn) = 텍스트**: Claude가 직접 수정 가능
- **리소스 파일(.tres) = 텍스트**: 설정 파일도 편집 가능
- **오픈소스 & 무료**: 라이선스 걱정 없음

**CLI 명령어:**
| 명령 | 설명 |
|------|------|
| `--headless` | 디스플레이 없이 실행 |
| `--export-release <preset> <path>` | 릴리즈 빌드 |
| `--export-debug <preset> <path>` | 디버그 빌드 |
| `--script <path>` | 스크립트 실행 |
| `--quit` | 작업 후 자동 종료 |

**Claude Code 워크플로우 예시:**
```bash
# 1. 코드 수정 (Claude가 직접 .gd 파일 편집)
# 2. 빌드
godot --headless --path . --export-release "Android" builds/game.apk
# 3. 결과 확인
```

### 제한사항
- Godot 4.3에서 .godot 폴더 없이 headless 빌드 시 멈춤 현상 보고됨
- 에디터 전용 기능(비주얼 셰이더 등)은 CLI로 제어 불가

---

## 2. Unity

### CLI 지원 현황
```bash
# 배치 모드 빌드
Unity.exe -quit -batchmode -projectPath /project -executeMethod Builder.Build -logFile build.log

# 테스트 실행
Unity.exe -runTests -batchmode -projectPath /project -testResults results.xml
```

### Claude Code 연동 평가: ⭐⭐⭐⭐ (우수)

**장점:**
- **강력한 batchmode**: GUI 없이 빌드 가능
- **C# 스크립트**: 텍스트 기반 코드
- **방대한 문서 및 커뮤니티**
- **Unity CLI 패키지**: 추가 자동화 도구

**단점:**
- **씬 파일(.unity)이 바이너리/YAML 혼합**: 직접 수정 어려움
- **프리팹(.prefab)**: YAML이지만 복잡한 구조
- **라이선스 비용**: Personal은 무료지만 제한 있음
- **에디터 필요**: 일부 작업은 에디터 실행 필요

**CLI 명령어:**
| 명령 | 설명 |
|------|------|
| `-batchmode` | 배치 모드 (GUI 없음) |
| `-quit` | 작업 후 자동 종료 |
| `-executeMethod <method>` | 정적 메서드 실행 |
| `-buildTarget <target>` | 빌드 타겟 지정 |
| `-logFile <path>` | 로그 파일 지정 |

**Claude Code 워크플로우:**
```bash
# 1. C# 스크립트 수정 (Claude가 .cs 파일 편집)
# 2. 빌드 스크립트 실행
Unity.exe -quit -batchmode -projectPath . -executeMethod BuildScript.Build
# 3. 로그 확인
```

### 제한사항
- Unity 에디터 설치 필수
- 일부 기능은 라이선스 필요
- 씬/프리팹 직접 수정은 위험

---

## 3. Defold

### CLI 지원 현황
```bash
# bob.jar로 빌드
java -jar bob.jar --archive --platform armv7-android resolve build bundle

# 여러 플랫폼 동시 빌드
java -jar bob.jar --platform x86_64-win32,x86_64-linux bundle
```

### Claude Code 연동 평가: ⭐⭐⭐⭐ (우수)

**장점:**
- **bob.jar**: 완전한 CLI 빌드 도구
- **모든 파일이 텍스트**: 스크립트, 씬, 설정 모두
- **Lua 스크립팅**: 간단한 문법
- **완전 무료**: 로열티 없음
- **경량**: 작은 게임에 최적

**단점:**
- **Java 필요**: JDK 설치 필수
- **작은 커뮤니티**: 자료가 상대적으로 적음
- **2D 특화**: 3D 게임에는 부적합

**CLI 명령어:**
| 명령 | 설명 |
|------|------|
| `--archive` | 아카이브 빌드 |
| `--platform <platform>` | 타겟 플랫폼 |
| `--bundle-output <dir>` | 출력 디렉토리 |
| `resolve` | 의존성 해결 |
| `build` | 빌드 |
| `bundle` | 번들 생성 |

---

## 4. Cocos Creator

### CLI 지원 현황
```bash
# Windows
CocosCreator.exe --path projectPath --build "platform=android;debug=true"

# 자동 컴파일 포함
CocosCreator.exe --path projectPath --build "autoCompile=true"
```

### Claude Code 연동 평가: ⭐⭐⭐ (양호)

**장점:**
- **JavaScript/TypeScript**: 텍스트 기반 코드
- **JSON 설정 파일**: 빌드 설정 내보내기/가져오기 가능
- **무료**: 오픈소스

**단점:**
- **GUI 환경 필요**: Jenkins에서도 에이전트 모드 필요
- **씬 파일 복잡**: JSON이지만 구조가 복잡
- **문서 부족**: CLI 관련 문서가 상대적으로 적음

---

## 5. Unreal Engine

### CLI 지원 현황
```bash
# UAT로 빌드
RunUAT.bat BuildCookRun -project=MyGame.uproject -platform=Android -clientconfig=Shipping -build -cook -stage -archive

# 에디터 커맨드릿
UE4Editor.exe MyGame.uproject -run=MyCommandlet
```

### Claude Code 연동 평가: ⭐⭐⭐ (제한적)

**장점:**
- **UAT (Unreal Automation Tool)**: 강력한 빌드 파이프라인
- **Blueprint to C++ 변환**: 코드 기반 작업 가능
- **커맨드릿 시스템**: 커스텀 CLI 명령 생성 가능

**단점:**
- **바이너리 에셋**: 대부분의 에셋이 바이너리
- **Blueprint = 바이너리**: 시각적 스크립트 편집 불가
- **무거운 빌드**: 빌드 시간이 김
- **복잡한 설정**: CLI 옵션이 매우 복잡
- **대용량**: 엔진 자체가 수십 GB

---

## Claude Code 연동을 위한 최종 추천

### 🥇 1위: Godot Engine

**추천 이유:**
1. **모든 파일이 텍스트** - Claude가 코드, 씬, 리소스 모두 직접 수정 가능
2. **완벽한 headless 모드** - GUI 없이 모든 작업 가능
3. **간단한 CLI** - 명령어가 직관적
4. **무료 & 오픈소스** - 비용 걱정 없음
5. **가벼움** - 빠른 반복 개발 가능

```bash
# Claude Code 이상적인 워크플로우
claude "Player.gd에 점프 기능 추가해줘"
# Claude가 Player.gd 파일 직접 수정
godot --headless --export-debug "Android" test.apk
```

### 🥈 2위: Unity (C# 코드 중심 작업에 적합)

**추천 이유:**
1. C# 스크립트 편집은 완벽하게 지원
2. 시장 점유율 1위 - 취업/외주에 유리
3. 방대한 에셋 스토어

**제한:**
- 씬/프리팹 직접 수정은 피해야 함
- 코드 기반 작업으로 제한하면 효과적

### 🥉 3위: Defold (2D 게임 특화)

**추천 이유:**
1. 모든 파일이 텍스트
2. 완전 무료
3. bob.jar로 완전한 CLI 빌드

---

## 실용적 팁: Claude Code와 게임 엔진 연동

### Godot 프로젝트 설정
```bash
# .claude/settings.json에 추가
{
  "build_command": "godot --headless --export-release 'Android' builds/game.apk",
  "test_command": "godot --headless --script res://tests/run_tests.gd"
}
```

### Unity 프로젝트 설정
```bash
# BuildScript.cs 생성 후
# Claude Code에서 호출
Unity.exe -quit -batchmode -projectPath . -executeMethod BuildScript.PerformBuild
```

### 주의사항
1. **바이너리 파일 수정 금지**: 씬, 프리팹, 에셋은 에디터로
2. **텍스트 파일만 Claude로**: 스크립트, 설정 파일
3. **빌드 테스트 자동화**: CLI 빌드 후 결과 확인

---

## 참고 자료

- [Godot Command Line Tutorial](https://docs.godotengine.org/en/stable/tutorials/editor/command_line_tutorial.html)
- [Unity Command-line Arguments](https://docs.unity3d.com/Manual/CommandLineArguments.html)
- [Defold Bob Manual](https://defold.com/manuals/bob/)
- [Cocos Creator CLI Publishing](https://docs.cocos.com/creator/3.8/manual/en/editor/publish/publish-in-command-line.html)
- [Unreal Engine UAT Reference](https://ikrima.dev/ue4guide/build-guide/ubt/automationtool-exe-unrealbuildtool-exe-reference/)

---

## 관련 문서

- [[안드로이드 양산형 게임과 광고]]
- [[모바일 게임 CPI와 LTV 데이터]]
- [[미니게임 모음형 CPI 공유 전략]]
