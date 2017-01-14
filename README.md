# faithfulgit
Branch dependent files in git repos

This set of scripts enables files that will not change on merges with other branches.

Assume two branches master and second, both containing the faithful file with branch dependent content.
1) merging master on second won't change the faithful file
2) commiting will work as before, version control is still available.
3) merging master of repo one on master of repo two will merge the faithful file

# dependencies
fish shell

# installation
Put installfaithfulgit.fish in your repo and execute it. This will install a custom merge driver and a post-commit hook. A hidden directory .faithfulgit will be created and filled.

# usage
For each branch dependent file FILE, do
1) add the merge driver to .gitattributes
`FILE merge=faithful`
2) add a line to FILE containing the a keyword (do this on each branch). Default is [faithful] you can edit this in .faithful/config.fish. This line will be changed automatically on each commit.
~~~~
...
# [faithful]
...
~~~~

# disclaimer
This is a recent development. Please try this on a clone of your repo first.
