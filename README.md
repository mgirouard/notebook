# notebook -- a stupid-simple markdown notebook

You don't need an entire system to generate that static site of yours. Just use
`make` as it was originally intended (hint: you know, to _make_ files).

Initial Setup for stand-alone Makefiles

    $ cd path/to/your/project
    $ curl https://raw.githubusercontent.com/mgirouard/notebook/master/notebook.mk >> Makefile

If your project already has a Makefile, just include it (you may need to adjust
your `docs` target accordingly). Give the Makefile a quick once-over for
instructions on customizing the output.

    HEADER=tpl/head.html
    FOOTER=tpl/foot.html
    DEST=build/

    include notebook.mk

If you're using git to track your content, there's a `post-commit` hook ready
for you.

    $ make .git/hooks/post-commit
