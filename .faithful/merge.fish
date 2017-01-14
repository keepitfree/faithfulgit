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
#!/bin/fish
# echo (date) >> "/home/mfa/vorgaenge/0161_GITFAITHFULBRANCHES/git/log"
# echo (pwd) >> "/home/mfa/vorgaenge/0161_GITFAITHFULBRANCHES/git/log"
# true

#   load config
source (git rev-parse --show-toplevel)"/.faithful/config.fish"

# $argv is %O %A %B %L %P (see below)
set O $argv[1]
set A $argv[2]
set B $argv[3]
set L $argv[3]
set P $argv[3]

set Aname (cat $A | sed -n 's/'$faithfulregexp'[ ]\\([^:]*:[^ ]*\)[ ][0-9]*/\2/p')
set Bname (cat $B | sed -n 's/'$faithfulregexp'[ ]\\([^:]*:[^ ]*\)[ ][0-9]*/\2/p')

#   if two versions of the same branch are merged, forward this job to git
if test $Bname = $Aname
    log "[faithful] merging theirs "$Bname

    #   avoid merge conflicts resulting from faithful timestamps
    set synceddate (date +%Y%m%d%H%M%S%N)[1]
    sed -i 's/'$faithfulregexp'\\([ ][^:]*:[^ ]*\).*/\1 \2 '$synceddate'/' $A
    sed -i 's/'$faithfulregexp'\\([ ][^:]*:[^ ]*\).*/\1 \2 '$synceddate'/' $B
    sed -i 's/'$faithfulregexp'\\([ ][^:]*:[^ ]*\).*/\1 \2 '$synceddate'/' $O

    git merge-file $A $B $O
else
    #   otherwise, ignore the merge
    log "[faithful] keeping ours "$Aname
    true
end


#   FROM https://git-scm.com/docs/gitattributes
# The merge.*.driver variable’s value is used to construct a command to run to merge ancestor’s version (%O), current version (%A) and the other branches' version (%B). These three tokens are replaced with the names of temporary files that hold the contents of these versions when the command line is built. Additionally, %L will be replaced with the conflict marker size (see below).

# The merge driver is expected to leave the result of the merge in the file named with %A by overwriting it, and exit with zero status if it managed to merge them cleanly, or non-zero if there were conflicts.

# The merge.*.recursive variable specifies what other merge driver to use when the merge driver is called for an internal merge between common ancestors, when there are more than one. When left unspecified, the driver itself is used for both internal merge and the final merge.

# The merge driver can learn the pathname in which the merged result will be stored via placeholder %P.#!/bin/fish
# echo (date) >> "/home/mfa/vorgaenge/0161_GITFAITHFULBRANCHES/git/log"
# echo (pwd) >> "/home/mfa/vorgaenge/0161_GITFAITHFULBRANCHES/git/log"
# true
