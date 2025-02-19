# ubuntuのノーマルイメージ
# ↓↓↓これは Apple silicon搭載 Mac用
FROM --platform=linux/amd64 ubuntu:22.04

# 初期設定
RUN apt update -y
RUN apt install -y git make curl ssh vim emacs

# ユーザ作成 user moore / pw mooremoore
RUN useradd -m -s /bin/bash moore
RUN echo "moore:mooremoore" | chpasswd
# sudo でroot権限のコマンド実行
RUN gpasswd -a moore sudo

USER moore

WORKDIR /workspace