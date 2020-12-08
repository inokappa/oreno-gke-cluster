# 俺の GKE cluster

## 準備

* 必要に応じて、プロジェクトを作成
* プロジェクト内にサービスアカウント作成
* サービスアカウントの鍵をダウンロード
* 手動で各種 API を有効化する
    * Identity and Access Management (IAM) API
    * Kubernetes Engine API
    * Cloud Resource Manager API

以下のように、サービスアカウントキーへのパスを環境変数 `GOOGLE_APPLICATION_CREDENTIALS` に指定する。

```sh
export GOOGLE_APPLICATION_CREDENTIALS=path/to/my-terraform-service-account.json
```

また、variables.tf の `master_auth_username` と `master_auth_password` を任意の値で設定する。

```hcl
variable "master_auth_username" {
  type    = string
  default = ""
}

variable "master_auth_password" {
  type    = string
  default = ""
}
```

## Apply

```sh
$ make plan
$ make apply
```

## Destroy

```sh
$ make destroy
```

