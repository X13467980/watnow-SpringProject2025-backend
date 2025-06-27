#!/bin/bash

# セッション管理のテストスクリプト

echo "=== ユーザー作成テスト ==="
curl -X POST http://localhost:3000/api/v1/signup \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "name": "テストユーザー",
      "email": "test@example.com",
      "password": "password123",
      "age": 25,
      "height": 170.0,
      "weight": 65.0
    }
  }'

echo -e "\n\n=== ログインテスト ==="
curl -X POST http://localhost:3000/api/v1/sessions \
  -H "Content-Type: application/json" \
  -c cookies.txt \
  -d '{
    "email": "test@example.com",
    "password": "password123"
  }'

echo -e "\n\n=== 現在のユーザー確認 ==="
curl -X GET http://localhost:3000/api/v1/sessions/current \
  -H "Content-Type: application/json" \
  -b cookies.txt

echo -e "\n\n=== トレーニング記録作成テスト ==="
curl -X POST http://localhost:3000/api/v1/users_trainings \
  -H "Content-Type: application/json" \
  -b cookies.txt \
  -d '{
    "users_training": {
      "menu_id": 1,
      "weight": 50,
      "reps": 10,
      "set_count": 3,
      "training_date": "2025-06-28T12:00:00.000Z",
      "memo": "テスト記録"
    }
  }'

echo -e "\n\n=== テスト完了 ==="
