# emacs.d
My emacs setup

# deleting git history

## Remove the history from

```bash
rm -rf .git
```

## Recreate the repos from the current content only

```bash
git init
git add .
git commit -m "init"
```

## Push to the github remote repos ensuring you overwrite history

```bash
git remote add origin git@github.com:<YOUR ACCOUNT>/<YOUR REPOS>.git
git push -u --force origin master
```