# SoH_AIAgent

## Quick start
```
pip install -r front/requirements.txt
streamlit run front/app.py
```

## Running with Docker
### Builds
도커 이미지를 빌드하고 업로드 하는 스크립트 파일들이 포함되어 있습니다.

* **build.sh**: Dockerfile을 실행하며 이미지를 빌드합니다. (현재 username, password 불필요)
    ```
    build/build.sh \
        -u | --username ${docker-registry-username} \
        -p | --password ${docker-registry-password} \
        --cache \
        -b | --git-branch ${git-branch} \
        -t | --tag {docker-image-tag} \
    ```

## Scripts
개발 및 운영에 필요한 스크립트 파일들이 포함되어 있습니다.

* **docker_run.sh**: Docker image를 기반으로 Streamlit 서버를 실행하는 컨테이너를 띄웁니다.
    ```
    scripts/docker_run.sh \
        -t | --tag {docker-image-tag}
    ```

* **docker_bash.sh**: Docker image를 기반으로 Bash를 실행하는 컨테이너를 띄웁니다.
    ```
    scripts/docker_bash.sh \
        -t | --tag {docker-image-tag}
    ```

* **exec_bash.sh**: 이미 띄워져 있는 컨테이너의 Bash를 실행합니다.
    ```
    scripts/exec_bash.sh
    ```

* **install.sh**: 본 레포지토리의 환경 구축을 위한 패키지들을 설치합니다.
    ```
    scripts/exec_bash.sh
    ```

* **run.sh**: Streamlit 서버를 실행합니다.
    ```
    scripts/exec_bash.sh
    ```