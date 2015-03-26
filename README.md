Build books with bookbuilder.

I haven't quite figured out how to use this with like a Gemfile and stuff, but the gist is:

    ruby -rredcarpet bookbuilder.rb > build.html

This traverses a file tree in the *src/* folder in alphabetical order and basically reads all files as markdown files...

So I would recommend a file tree like this or something:

```
+ src
+-+ 0_Introduction/
| +-+ 0_introduction.md
|   + 1_acknowledgements.md
+-+ 1_FirstChapter/
  ...

```

You get the gist. Cool.

