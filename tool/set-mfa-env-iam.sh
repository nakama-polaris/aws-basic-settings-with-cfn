#!/bin/bash -eux
#
# set-mfa-env.sh
#
# 概要：
#   MFA認証トークンをプロセススコープの環境変数に設定する。
#
# 引数：
#   $1: IAM User名
#   $2: アカウントID
#   $3: プロファイル名
#   $4: 6桁のMFAコード
#
# 使用例：
#   $ bash tool/set-mfa-env.sh hoge 012345678901 default 654321
#

# 引数を表示
iam_user=$1
account_id=$2
aws_profile=$3
token_code=$4

echo "----------------------------------"
echo "# Argments"
echo "----------------------------------"
echo "IAM User: ${iam_user}"
echo "Accound ID: ${account_id}"
echo "Profile: ${aws_profile}"
echo "Token Code: ${token_code}"
echo ""

# プロファイルを設定
AWS_PROFILE="${aws_profile}"

# トークンを取得
raw_result=$(aws sts get-session-token --serial-number "arn:aws:iam::${account_id}:mfa/${iam_user}" --token-code "${token_code}" --profile "${aws_profile}" --output json)

# トークンを環境変数に設定
export AWS_ACCESS_KEY_ID
AWS_ACCESS_KEY_ID=$(echo "${raw_result}" | jq '.Credentials.AccessKeyId' | sed -e 's/\"//g')
export AWS_SECRET_ACCESS_KEY
AWS_SECRET_ACCESS_KEY=$(echo "${raw_result}" | jq '.Credentials.SecretAccessKey' | sed -e 's/\"//g')
export AWS_SESSION_TOKEN
AWS_SESSION_TOKEN=$(echo "${raw_result}" | jq '.Credentials.SessionToken' | sed -e 's/\"//g')

# 現在の環境変数を表示
echo "----------------------------------"
echo "# Configured Environment Variables"
echo "----------------------------------"
echo "AWS_PROFILE: ${AWS_PROFILE}"
echo "AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}"
echo "AWS_SECRET_ACCESS_KEY: ${AWS_SECRET_ACCESS_KEY}"
echo "AWS_SESSION_TOKEN: ${AWS_SESSION_TOKEN}"
