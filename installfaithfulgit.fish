#!/bin/fish
# ========================================================
# FAITHFUL GIT / path dependent files
# --------------------------------------------------------
# author    Maximilian Appel    faithfulgit@maxappel.de
# version   2017-01-14 beta
# licence   MIT (see below)
#
# Copyright 2017 Maximilian Appel
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# --------------------------------------------------------

function writefiles
# ========================================================
# FOR CONVENIENCE, SAVE THE WHOLE PROGRAM IN THIS FILE
# --------------------------------------------------------
# .faithful/merge.fish
# --------------------------------------------------------
echo "# ========================================================" >> .faithful/merge.fish
echo "# FAITHFUL GIT / path dependent files" >> .faithful/merge.fish
echo "# --------------------------------------------------------" >> .faithful/merge.fish
echo "# author    Maximilian Appel    faithfulgit@maxappel.de" >> .faithful/merge.fish
echo "# version   2017-01-14 beta" >> .faithful/merge.fish
echo "# licence   MIT (see below)" >> .faithful/merge.fish
echo "#" >> .faithful/merge.fish
echo "# Copyright 2017 Maximilian Appel" >> .faithful/merge.fish
echo "# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:" >> .faithful/merge.fish
echo "#" >> .faithful/merge.fish
echo "# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software." >> .faithful/merge.fish
echo "#" >> .faithful/merge.fish
echo "# THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." >> .faithful/merge.fish
echo "# --------------------------------------------------------" >> .faithful/merge.fish
echo "#!/bin/fish" >> .faithful/merge.fish
echo "# echo (date) >> \"/home/mfa/vorgaenge/0161_GITFAITHFULBRANCHES/git/log\"" >> .faithful/merge.fish
echo "# echo (pwd) >> \"/home/mfa/vorgaenge/0161_GITFAITHFULBRANCHES/git/log\"" >> .faithful/merge.fish
echo "# true" >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "#   load config" >> .faithful/merge.fish
echo "source (git rev-parse --show-toplevel)\"/.faithful/config.fish\"" >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "# \$argv is %O %A %B %L %P (see below)" >> .faithful/merge.fish
echo "set O \$argv[1]" >> .faithful/merge.fish
echo "set A \$argv[2]" >> .faithful/merge.fish
echo "set B \$argv[3]" >> .faithful/merge.fish
echo "set L \$argv[3]" >> .faithful/merge.fish
echo "set P \$argv[3]" >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "set Aname (cat \$A | sed -n 's/'\$faithfulregexp'[ ]\([^:]*:[^ ]*\)[ ][0-9]*/\2/p')" >> .faithful/merge.fish
echo "set Bname (cat \$B | sed -n 's/'\$faithfulregexp'[ ]\([^:]*:[^ ]*\)[ ][0-9]*/\2/p')" >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "#   if two versions of the same branch are merged, forward this job to git" >> .faithful/merge.fish
echo "if test \$Bname = \$Aname" >> .faithful/merge.fish
echo "    log \"[faithful] merging theirs \"\$Bname" >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "    #   avoid merge conflicts resulting from faithful timestamps" >> .faithful/merge.fish
echo "    set synceddate (date +%Y%m%d%H%M%S%N)[1]" >> .faithful/merge.fish
echo "    sed -i 's/'\$faithfulregexp'\([ ][^:]*:[^ ]*\).*/\1 \2 '\$synceddate'/' \$A" >> .faithful/merge.fish
echo "    sed -i 's/'\$faithfulregexp'\([ ][^:]*:[^ ]*\).*/\1 \2 '\$synceddate'/' \$B" >> .faithful/merge.fish
echo "    sed -i 's/'\$faithfulregexp'\([ ][^:]*:[^ ]*\).*/\1 \2 '\$synceddate'/' \$O" >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "    git merge-file \$A \$B \$O" >> .faithful/merge.fish
echo "else" >> .faithful/merge.fish
echo "    #   otherwise, ignore the merge" >> .faithful/merge.fish
echo "    log \"[faithful] keeping ours \"\$Aname" >> .faithful/merge.fish
echo "    true" >> .faithful/merge.fish
echo "end" >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "#   FROM https://git-scm.com/docs/gitattributes" >> .faithful/merge.fish
echo "# The merge.*.driver variable’s value is used to construct a command to run to merge ancestor’s version (%O), current version (%A) and the other branches' version (%B). These three tokens are replaced with the names of temporary files that hold the contents of these versions when the command line is built. Additionally, %L will be replaced with the conflict marker size (see below)." >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "# The merge driver is expected to leave the result of the merge in the file named with %A by overwriting it, and exit with zero status if it managed to merge them cleanly, or non-zero if there were conflicts." >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "# The merge.*.recursive variable specifies what other merge driver to use when the merge driver is called for an internal merge between common ancestors, when there are more than one. When left unspecified, the driver itself is used for both internal merge and the final merge." >> .faithful/merge.fish
echo "" >> .faithful/merge.fish
echo "# The merge driver can learn the pathname in which the merged result will be stored via placeholder %P.#!/bin/fish" >> .faithful/merge.fish
echo "# echo (date) >> \"/home/mfa/vorgaenge/0161_GITFAITHFULBRANCHES/git/log\"" >> .faithful/merge.fish
echo "# echo (pwd) >> \"/home/mfa/vorgaenge/0161_GITFAITHFULBRANCHES/git/log\"" >> .faithful/merge.fish
echo "# true" >> .faithful/merge.fish

# --------------------------------------------------------
# .faithful/post-commit
# --------------------------------------------------------
echo "# ========================================================" >> .faithful/post-commit
echo "# FAITHFUL GIT / path dependent files" >> .faithful/post-commit
echo "# --------------------------------------------------------" >> .faithful/post-commit
echo "# author    Maximilian Appel    faithfulgit@maxappel.de" >> .faithful/post-commit
echo "# version   2017-01-14 beta" >> .faithful/post-commit
echo "# licence   MIT (see below)" >> .faithful/post-commit
echo "#" >> .faithful/post-commit
echo "# Copyright 2017 Maximilian Appel" >> .faithful/post-commit
echo "# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:" >> .faithful/post-commit
echo "#" >> .faithful/post-commit
echo "# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software." >> .faithful/post-commit
echo "#" >> .faithful/post-commit
echo "# THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." >> .faithful/post-commit
echo "# --------------------------------------------------------" >> .faithful/post-commit
echo "#!/bin/fish" >> .faithful/post-commit
echo "#set gitdir \"\$(git rev-parse --git-dir)\"" >> .faithful/post-commit
echo "#hook=\"\$gitdir/hooks/post-commit\"" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   load config" >> .faithful/post-commit
echo "source (git rev-parse --show-toplevel)\"/.faithful/config.fish\"" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   deactivate this script to break the infinite loop" >> .faithful/post-commit
echo "chmod -x \".git/hooks/post-commit\"" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   memory current working directory and branch" >> .faithful/post-commit
echo "set mydir (pwd)" >> .faithful/post-commit
echo "set mybranch (git branch | sed '/^[^*]/d;s/^[*][ ]\([a-z]\)/\1/')" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   cd to root of this git repository" >> .faithful/post-commit
echo "cd (git rev-parse --show-toplevel)" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   get path of faithful files" >> .faithful/post-commit
echo "set faithfulfiles (sed -n 's/\([a-zA-Z0-9\/\*_\.]*\).*[ ]*merge[ \t]*=[ \t]*'\$mergedriver'.*\$/\1/p' \$gitattributes)" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   get names of branches" >> .faithful/post-commit
echo "set branches (git branch | sed -n 's/^[ *][ ]\(\)/\1/p')" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   create merge conflicts: update faithful files on all branches" >> .faithful/post-commit
echo "for branch in \$branches" >> .faithful/post-commit
echo "    git checkout --quiet \$branch" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "    for faithfulfile in \$faithfulfiles" >> .faithful/post-commit
echo "        log \"[faithful] updating \$branch:\$faithfulfile\"" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "        #   update timestamp in files" >> .faithful/post-commit
echo "        sed -i 's/\$faithfulregexp.*/\1 '\$branch':'(echo \$faithfulfile | sed 's/\//\\\//g')' '(date +%Y%m%d%H%M%S%N)[1]'/' \$faithfulfile" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "        #   add faithful files to current commit" >> .faithful/post-commit
echo "        git add \$faithfulfile > /dev/null" >> .faithful/post-commit
echo "    end" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "    git commit --allow-empty --quiet -m '[faithful] auto commit'" >> .faithful/post-commit
echo "end" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   back to starting dir and branch" >> .faithful/post-commit
echo "git checkout --quiet \$mybranch" >> .faithful/post-commit
echo "cd \$mydir" >> .faithful/post-commit
echo "" >> .faithful/post-commit
echo "#   reactivate this script" >> .faithful/post-commit
echo "chmod +x \".git/hooks/post-commit\"" >> .faithful/post-commit

# --------------------------------------------------------
# .faithful/config.fish
# --------------------------------------------------------
echo "# ========================================================" >> .faithful/config.fish
echo "# FAITHFUL GIT / path dependent files" >> .faithful/config.fish
echo "# --------------------------------------------------------" >> .faithful/config.fish
echo "# author    Maximilian Appel    faithfulgit@maxappel.de" >> .faithful/config.fish
echo "# version   2017-01-14 beta" >> .faithful/config.fish
echo "# licence   MIT (see below)" >> .faithful/config.fish
echo "#" >> .faithful/config.fish
echo "# Copyright 2017 Maximilian Appel" >> .faithful/config.fish
echo "# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:" >> .faithful/config.fish
echo "#" >> .faithful/config.fish
echo "# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software." >> .faithful/config.fish
echo "#" >> .faithful/config.fish
echo "# THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." >> .faithful/config.fish
echo "# --------------------------------------------------------" >> .faithful/config.fish
echo "set faithfulkey \"\[faithful\]\"" >> .faithful/config.fish
echo "#   regexp used to find the line that this script can modify" >> .faithful/config.fish
echo "set faithfulregexp \"\([^\[]*\"\$faithfulkey\"\)\"" >> .faithful/config.fish
echo "" >> .faithful/config.fish
echo "#   arbitrary name of the mergedriver" >> .faithful/config.fish
echo "set mergedriver faithful" >> .faithful/config.fish
echo "" >> .faithful/config.fish
echo "#   path of gitattributes (should never change)" >> .faithful/config.fish
echo "set gitattributes .gitattributes" >> .faithful/config.fish
echo "" >> .faithful/config.fish
echo "#   this function is used by all faithful scripts to message the user" >> .faithful/config.fish
echo "function log" >> .faithful/config.fish
echo "    echo \$argv" >> .faithful/config.fish
echo "end" >> .faithful/config.fish
end


# ========================================================
# SETUP SCRIPT
# --------------------------------------------------------
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
