# faithfulgit
Branch dependent files in git repos

This set of scripts enables files that will not change on merges with other branches.

Assume two branches master and second, both containing the faithful file with branch dependent content.
1) merging master on second won't change the faithful file
2) commiting will work as before, version control is still available.
3) merging master of repo one on master of repo two will merge the faithful file

# dependecies
fish shell

# installation
Put installfaithfulgit.fish in your repo and execute it. This will install a custom merge driver and a post-commit hook. A hidden directory .faithfulgit will be created and filled.

# disclaimer
This is a recent development. Please try this on a clone of your repo first.