# Temporarily store uncommited changes
git stash

# Build site
make clean && make build

# Switch to master branch
git checkout master

# Overwrite existing files with new files
rsync -a --filter='P _site/'      \
         --filter='P _cache/'     \
         --filter='P .git/'       \
         --filter='P .gitignore'  \
         --filter='P .stack-work' \
         --delete-excluded        \
         _site/ .

# Commit
git add -A
git commit -m "$(git log --oneline -1 hakyll)"

# Push
git push origin master

# Switch back to hakyll branch
git checkout hakyll

# Pop stashed changes
git stash pop
