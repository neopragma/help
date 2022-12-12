[Contents](contents.md) | [KWIC Index](kwic-index.md)

# Notes for Git and related tools and services

* [git](#git)
    * [change default branch to main](#change-default-branch-to-main)
    * [hprof file prevents push](#hprof-file-prevents-push)
    * [rename master branch to main](#rename-master-branch-to-main)
    * [stop tracking files](#stop-tracking-files)
* [github](#github)
    * [list your repositories](#list-your-repositories)
    * [personal access token](#personal-access-token)

## git

### change default branch to main 

```shell
git config --global init.defaultBranch main
```

### hprof file prevents push 

Files named java_pid99999.hprof are due to issues with heap memory being exceeded. If this happens in your project, you won't be able to push to github. Use this command to clean up the local history (substituting the real filename):

```shell 
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch java_pid26029.hprof' 
``` 

Add this to .gitignore and commit it: 

```shell 
*.hprof 
``` 

### rename master branch to main 

```shell
git branch -m master main
```

### stop tracking files

Symptom: ```git status``` shows files you don't want to track.

Solution: Update ```.gitignore``` with filenames to ignore and then:

```shell
git rm -r --cached .
git add .
git commit -m "Cleaned up cached untracked files"
```

## github

### list your repositories

List the names of your repositories in alphabetical order.

```shell
curl "https://api.github.com/users/$GIT_USER/repos?access_token=$GIT_ACCESS_TOKEN&per_page=1000&type=all" | grep '"name":' | sort
```

### personal access token 

After generating a personal access token on Github, for Ubuntu you must enter this:

```shell
git config --global credential.helper store
```

On the next push, it will prompt for a password. Enter the personal access token instead of your password.
