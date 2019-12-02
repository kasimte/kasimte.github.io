---
layout: post
title: "Testing Rails Routes in the Console"
tags: rails
---

I've found myself trying to test as quickly as possible if I have a
Rails route working properly and typically turn to the console,
expecting it to load all the relevant routes, but run into an error
like this:

```
Loading backup environment (Rails 4.2.11.1)
irb(main):001:0> root_path
Traceback (most recent call last):
        8: from bin/rails:4:in `<main>'
        7: from bin/rails:4:in `require'
        6: from /Users/Kasim/.rbenv/versions/2.5.5/lib/ruby/gems/2.5.0/gems/railties-4.2.11.1/lib/rails/commands.rb:17:in `<top (required)>'
        5: from /Users/Kasim/.rbenv/versions/2.5.5/lib/ruby/gems/2.5.0/gems/railties-4.2.11.1/lib/rails/commands/commands_tasks.rb:39:in `run_command!'
        4: from /Users/Kasim/.rbenv/versions/2.5.5/lib/ruby/gems/2.5.0/gems/railties-4.2.11.1/lib/rails/commands/commands_tasks.rb:68:in `console'
        3: from /Users/Kasim/.rbenv/versions/2.5.5/lib/ruby/gems/2.5.0/gems/railties-4.2.11.1/lib/rails/commands/console.rb:9:in `start'
        2: from /Users/Kasim/.rbenv/versions/2.5.5/lib/ruby/gems/2.5.0/gems/railties-4.2.11.1/lib/rails/commands/console.rb:110:in `start'
        1: from (irb):1
NameError (undefined local variable or method `root_path' for main:Object)
irb(main):002:0> 
```

Since I'm running this locally, I expect this to return `localhost:4000`. It turns out that all the routes are included under the `app` object, so instead I have to do this:

```
irb(main):004:0> app.root_url
=> "http://localhost:3000/"
irb(main):005:0> 
```

## More

* [On StackOverflow](https://stackoverflow.com/questions/1397644/testing-routes-in-the-console)


