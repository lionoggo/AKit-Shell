#!/bin/sh

git filter-branch --env-filter '
# 原来的邮箱
OLD_EMAIL="xxx@xxx.com"
# 现在的名字
CORRECT_NAME="lionoggo"
# 现在的邮箱
CORRECT_EMAIL="lionoggo@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' -f --tag-name-filter cat -- --branches --tags
