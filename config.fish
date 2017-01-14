set faithfulkey "\[faithful\]"
#   regexp used to find the line that this script can modify
set faithfulregexp "\([^\[]*"$faithfulkey"\)"

#   arbitrary name of the mergedriver
set mergedriver faithful

#   path of gitattributes (should never change)
set gitattributes .gitattributes

#   this function is used by all faithful scripts to message the user
function log
    echo $argv
end
