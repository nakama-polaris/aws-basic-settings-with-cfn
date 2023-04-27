# 便利ツール

## set-mfa-env-iam.sh

### 概要

以下の4つの変数をプロセススコープで設定するスクリプト

```bash
AWS_PROFILE
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN
```

### 使い方

```bash
source tool/set-mfa-env.sh user 012345678901 default 424172
```

### 参考

- [MFA トークンを使用して、AWS CLI を通じて AWS リソースへのアクセスを認証するにはどうすればよいですか?](https://aws.amazon.com/jp/premiumsupport/knowledge-center/authenticate-mfa-cli/)  
  公式ドキュメント

## set-mfa-env-sso.sh

以下の4つの変数をプロセススコープで設定するスクリプト

```bash
AWS_PROFILE
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN
```
