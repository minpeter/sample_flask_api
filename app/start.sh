pip install -r requirements.txt
python3 app.py

#!/usr/bin/env bash

REPOSITORY=/home/ubuntu/build

echo "> 현재 구동 중인 애플리케이션 pid 확인"

CURRENT_PID=$(pgrep -fl action | grep java | awk '{print $1}')

echo "현재 구동 중인 애플리케이션 pid: $CURRENT_PID"

if [ -z "$CURRENT_PID" ]; then
  echo "현재 구동 중인 애플리케이션이 없으므로 종료하지 않습니다."
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> 새 애플리케이션 배포"

PY_FILE=$(ls -tr $REPOSITORY/*.py | tail -n 1)

echo "> PY NAME: $PY_FILE"

echo "> $PY_FILE 에 실행권한 추가"

chmod +x $PY_FILE

echo "> $PY_FILE 실행"

nohup python3 $PY_FILE > $REPOSITORY/nohup.out 2>&1 &