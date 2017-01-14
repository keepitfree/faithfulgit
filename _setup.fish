#!/bin/fish

#   install post-commit hook
#   register faithful merge script for all marked files in .gitattributes
#   show info
set gitconfig .git/config
set faithfuldir .faithful
set mergedriver faithful

#   memory current working dir and change to top level of git repo
set mydir (pwd)
cd (git rev-parse --show-toplevel)

#   install merge driver
if test -z (cat .git/config | sed -n 's/\[merge \"'$mergedriver'\"\][\n \t]*/found/p')
    echo "[faithful] installing merge driver to $gitconfig"

    echo "[merge \"faithful\"]" >> $gitconfig
    echo "    driver = fish \$(git rev-parse --show-toplevel)'/.faithful/merge.fish' %O %A %B %L %P" >> $gitconfig
end

#   install post-commit hook
if test -e .git/hooks/post-commit
else
    echo "#!/bin/bash" > .git/hooks/post-commit
    #   chmod +x .git/hooks/post-commit
end
if test -z (cat .git/hooks/post-commit | sed -n 's/\.faithful\/post-commit/found/p')
    echo "[faithful] installing post-commit hook to .git/hooks/post-commit"
    echo "fish \$(git rev-parse --show-toplevel)'/.faithful/post-commit'" >> .git/hooks/post-commit
end

#   memory current branch
set mybranch (git branch | sed '/^[^*]/d;s/^[*][ ]\([a-z]\)/\1/')

#   deactivate hook for initialization
chmod -x .git/hooks/post-commit

#   get all branches, put own at the beginning of that list
set branches $mybranch (git branch | sed 's/^[ *][ ]\([a-z0-9A-Z].*\)/\1/;s/'$mybranch'//' | sed -n 's/\([a-z0-9A-Z].*\)/\1/p')

#   install faithful dir on all branches
git add installfaithfulgit.fish > /dev/null
for branch in $branches
    git checkout --quiet $branch
    
    mkdir $faithfuldir
    writefiles

    git add $faithfuldir > /dev/null
    git commit -m '[faithful] setup' > /dev/null 
end

chmod +x .git/hooks/post-commit
.git/hooks/post-commit

git checkout --quiet $mybranch > /dev/null
cd $mydir


echo
echo "If there were no error messages, faithful should work now."
echo "Installation has to be done in all commiting instances of this repo."
echo "Config in .faithful/config.fish"
echo
echo "To make a file FILE dependent on the branch, do the following"
echo "1     put a line in .gitattributes FILE merge=faithful"
echo "      this installs the merge driver for that files"
echo "2     put a line in FILE that contains the unquoted string '[faithful]'"
echo "      this line will be changed automatically before each commit and before some merges."
echo
echo "For developer and version info, see any file in .faithful/"
