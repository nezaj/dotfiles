# Changelog
Place for recording major changes and some thoughts on updating my Vim configuration

### 06/26/16 (Sunday)
Summary:
* Spent about 2-3 hours exploring ways to improve my JS setup
* Followed along this post: https://davidosomething.com/blog/vim-for-javascript/
* In the end I tried several things but only made a few changes
* Should be primarily beneficial for working on a large codebase

Improvements:
* Faster fuzzy keyword and file search thanks to ag
* Nicer tab autocomplete behavior thanks to SuperTab
* Added hg wrapper so I can see who wrote what code and when, for work
* Added flow syntax highlighting via vim-javascript
* Minor formatting fixes

New plugins:
* vim-lawrencium: HG wrapper for vim. Similar to fugutive
* SuperTab: Better tab autocompletion behavior

Plugins I tried:
* junegunn/vim-plug: Plugin manager. This looks pretty good but I don't see how it adds any benefit over my current pathogen setup which I quite like.
* othree/yajs.vim: Javascript syntax highlighter, was put off by the github page's warning there are performance issues. Since I'm working on a huge code-base this is a deal-breaker. Sticking with vim-javascript
* marijnh/tern_for_vim: Code intelligence for JS projects. No out-of-box support for React, React Native, GraphQL, or Relay. So not really useful for me at this time.
* moll/vim-node: Fast file navigation. Useful for jumping to files imported via `require`, again though this doesn't work with the FB setup so not useful for me.
