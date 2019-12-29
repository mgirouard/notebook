# notebook -- a stupid-simple markdown notebook

You don't need an entire system to generate that static site of yours. Just use
`make` as it was originally intended (hint: you know, to _make_ files).

Initial Setup

    $ cd path/to/your/project
    $ curl https://github.com/mgirouard/notebook/blob/master/notebook.mk >> Makefile

If your project already has a Makefile, just include it (you may need to adjust
your `docs` target accordingly).

Give the Makefile a quick onceover for instructions on customizing the output.
If you're using git to track your content, there's a `post-commit` hook ready
for you.

