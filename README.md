# docker-ja-zipcode-amazon-s3

## 概要

日本郵便の郵便番号データ(CSVファイル)をダウンロードし、指定したS3バケットにアップロードします。  
また、Athena等に取り込みやすいよう、文字コードをShift-JISからUTF-8に変換しています。

## 構築方法

### Docker Hubから取得する場合

1. Docker HubからDockerイメージをプルします。

    ```shell
    docker pull cmfujikawa/ja-zipcode-amazon-s3
    ```

### ローカルでビルドする場合

1. Dockerイメージをビルドします。

    ```shell
    docker build . -t local/ja-zipcode-amazon-s3
    ```

## 使用方法

1. 環境変数をセットします。

    ```shell
    export BUCKET_NAME=<bucket_name>
    export AWS_ACCESS_KEY_ID=<aws_access_key_id>
    export AWS_SECRET_ACCESS_KEY=<aws_secret_access_key>
    ```

1. Dockerコンテナを起動します。郵便番号データをダウンロードし、S3にアップロードします。

    ```shell
    docker run --rm \
        -e BUCKET_NAME -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
        local/ja-zipcode-amazon-s3
    ```

1. 次のコマンドで、S3にファイルがアップロードされていることを確認できます。  
  ※AWS CLIが必要です。

    ```shell
    aws s3 ls s3://$BUCKET_NAME/zipcode/ --profile HOGEHOGE
    ```
