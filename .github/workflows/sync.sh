# School仓库每次更新后自动推送至Gitee

#!/bin/bash

# 设置环境变量（可选，推荐用于保护敏感信息）
export GITEE_TOKEN=6b240fa79d1089eb635fdb355b468493

# 进入本地仓库目录
cd /path/to/your/local/repo || { echo "进入仓库目录失败"; exit 1; }

# 从 GitHub 的 main 分支拉取最新代码
git pull origin main || { echo "从 GitHub 拉取代码失败"; exit 1; }

# 强制推送到 Gitee 仓库
git push --force https://LuvGaze:${GITEE_TOKEN}@gitee.com/LuvGaze/school.git || { echo "推送到 Gitee 失败"; exit 1; }
