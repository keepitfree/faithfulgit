# faithfulgit
Branch dependent files in git repos

This set of scripts enables files that will not change on merges with other branches.

Assume two branches master and second, both containing the faithful file with branch dependent content.

1) merging master on second won't change the faithful file

2) commiting will work as before, version control is still available.

3) merging master of repo one on master of repo two will merge the faithful file



The implemented solution works as follows

1) Create a custom merge driver that will ignore merge conflicts for the respective files. The driver has to be registered for each file in .gitattributes

2) Create merge conflicts at each commit in those files (otherwise, the merge is trivial and the merge driver will not be used). This is done by a post-commit hook in .git/hooks/post-commit that changes those files in each branch after each commit.

# dependencies
fish shell

# installation
For each branch dependent file FILE, do
1) add the merge driver to .gitattributes
`FILE merge=faithful`
2) add a line to FILE containing the a keyword (do this on each branch). Default is [faithful] you can edit this in .faithful/config.fish. This line will be changed automatically on each commit.
~~~~
...
# [faithful]
...
~~~~

Put installfaithfulgit.fish in your repo and execute it. This will install a custom merge driver and a post-commit hook. A hidden directory .faithfulgit will be created and filled.

To make new files faithful, temporarily disable faithful using
`chmod -x .git/hooks/post-commit`

Then, add the file to every branch and put the keyword in the files, update .gitattributes and make the file executable again.


# disclaimer
This is a recent development. Please try this on a clone of your repo first.
