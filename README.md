# git
1. version control -- 타임머신.
2. branch -- 갈래를 만든다.

```bash
git config —list
#user.email
#user.name

git config —global user.name "Seo Jin Lee"
git config —global user.email "leeluna0476@inu.ac.kr"

git config —global core.editor “vim”

git init (repository init)
```

지난주와 똑같이 프로젝트 구조 만든다.

```bash
git status
git add include/func1.h # staging 영역에 파일 추가.
git commit -m "Initial commit - add definition of foo func" # git database에 기록.
git log
```

`git log`
```
leeluna0476@oss25:~/2025_opensw/lab7_git$ git log
commit 86f3f8268644f47f14251f03d42609741ac044d3 (HEAD -> main) <---- 이 부분이 hash code.
Author: Seo Jin Lee <leeluna0476@inu.ac.kr>
Date:   Thu Nov 6 05:20:08 2025 +0000

    Initial commit - add definition of foo func <---- 다시 돌아오려면 메시지 꼭 적어야 함. 무조건 영어로!
```

지난주와 똑같이 foo, goo 등등 만들어서 컴파일 후 실행해봄.

의미있는 변화가 있을 때 commit을 한다. (예: 함수를 하나 추가했다, 버그를 하나 잡았다...)

```bash
git checkout [hash] # 해시로 구분되는 특정 커밋으로 돌아간다. 타임머신...
git branch [branch name] # 수업 예시: newfunction
```

```
leeluna0476@oss25:~/2025_opensw/lab7_git$ git log --graph --oneline main newfunction
* bebec50 (newfunction) define func foofoo and foofoofoo
* c0722fc declare func foofoo and foofoofoo
| * 317e591 (HEAD -> main) define gitignore -- ignore executables, objects, and dependency files
|/
* 8a45500 define main
* f6ca2c5 include stdio.h which is needed to use printf
* d0f8b69 define func goo
* de9e0e8 define func foo
* 055a939 add declaration of func goo
* 86f3f82 Initial commit - add definition of foo func

leeluna0476@oss25:~/2025_opensw/lab7_git$ git merge newfunction # branch 합치기.
Merge made by the 'ort' strategy.
 include/func1.h | 2 ++
 src/foofoo.c    | 5 +++++
 src/foofoofoo.c | 5 +++++
 3 files changed, 12 insertions(+)
 create mode 100644 src/foofoo.c
 create mode 100644 src/foofoofoo.c
leeluna0476@oss25:~/2025_opensw/lab7_git$ git log --graph --oneline main newfunction
*   2c274a8 (HEAD -> main) Merge branch 'newfunction'
|\
| * bebec50 (newfunction) define func foofoo and foofoofoo
| * c0722fc declare func foofoo and foofoofoo
* | 317e591 define gitignore -- ignore executables, objects, and dependency files
|/
* 8a45500 define main
* f6ca2c5 include stdio.h which is needed to use printf
* d0f8b69 define func goo
* de9e0e8 define func foo
* 055a939 add declaration of func goo
* 86f3f82 Initial commit - add definition of foo func
```

```bash
# github에서 원격 레포지토리 만들고 연결하기.
git remote add origin git@github.com:leeluna0476/opensw2025_inu.git
git branch -M main
git push -u origin main # main branch를 github에 있는 origin에 push하겠다.
# github에서 원격 레포지토리 가져오기.
git clone git@github.com:leeluna0476/opensw2025_inu.git [name] # name은 optional.
git pull origin main # github의 내용을 로컬 환경에 업데이트하기.
```
