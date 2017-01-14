#!/bin/fish

# ========================================================
# FAITHFUL FILES FOR GIT
# branch dependent file content
# --------------------------------------------------------
# TODO
#   o developer and license in each file
#   o be quiet option in config to supress faithful outputs
#   o uninstall script
# --------------------------------------------------------

# SETUP COMPILER
set target installfaithfulgit.fish

function archivefile
    cat developerinfo $argv[1] | sed 's/\$/\\\$/g;s/\"/\\\"/g;s/\(.*\)/echo \"\1\" >> \.faithful\/'(echo $argv[1] | sed 's/\./\\\./g')'/' >> $argv[2]
end
# s/\\\\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/

# COMPILE
rm $target

echo "#!/bin/fish" >> $target
cat developerinfo >>  $target
echo >> $target

echo "function writefiles" >> $target
echo "# ========================================================" >> $target
echo "# FOR CONVENIENCE, SAVE THE WHOLE PROGRAM IN THIS FILE"     >> $target
echo "# --------------------------------------------------------" >> $target
echo "# .faithful/merge.fish"                                     >> $target
echo "# --------------------------------------------------------" >> $target
archivefile merge.fish $target
echo >> $target
echo >> $target
echo "# --------------------------------------------------------" >> $target
echo "# .faithful/post-commit"                                    >> $target
echo "# --------------------------------------------------------" >> $target
archivefile post-commit $target
echo >> $target
echo >> $target
echo "# --------------------------------------------------------" >> $target 
echo "# .faithful/config.fish"                                    >> $target
echo "# --------------------------------------------------------" >> $target
archivefile config.fish $target
echo "end" >> $target

echo >> $target
echo >> $target
echo "# ========================================================" >> $target
echo "# SETUP SCRIPT"                                             >> $target
echo "# --------------------------------------------------------" >> $target
cat _setup.fish >> $target

chmod a+x $target