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
set faithfulkey "\\[faithful\]"
#   regexp used to find the line that this script can modify
set faithfulregexp "\\([^\[]*"$faithfulkey"\)"

#   arbitrary name of the mergedriver
set mergedriver faithful

#   path of gitattributes (should never change)
set gitattributes .gitattributes

#   this function is used by all faithful scripts to message the user
function log
    echo $argv
end
