Textilize
=========

As of version 3, Rails doesn't have the `textilize` and `textilize_without_paragraph`  helper methods. 
Textilize is a gem brings back the missing method for Rails 3, and *it includes the library RedCloth 3.0.4* (newest is at 4.X), which doesn't need to be compiled on server. 

The reason we need this gem is that we use :textilize at a few places in our apps, and we don't need super fast RedCloth, we just need a working version that don't force us to install C extensions on various production servers.
This could be useful for bundle-package usage, where you can rely on the bundle/cache gems.

BTW, Textilize is not always the top choice, there are some useful gems that are doing it great, but they will requires C extension due to higher version of RedCloth dependency: 

https://github.com/dtrasbo/formatize/

https://github.com/rohit/prarupa


Installation
------------

Put `gem 'textilize'` into your Gemfile and do a `bundle install`, and that's
it. 

Usage
-----

### The `textilize` & `textilize_without_paragraph` helper methods

    textilize("I _love_ ROR(Ruby on Rails)!")
    # => "<p>I <em>love</em> <acronym title="Ruby on Rails">ROR</acronym>!</p>"

    textilize_without_paragraph("I _love_ ROR(Ruby on Rails)!")
    # => "I <em>love</em> <acronym title="Ruby on Rails">ROR</acronym>!"


Test
------------

We will add some tests back later.


Credits
------------

whytheluckystiff: RedCloth library

David Heinemeier Hansson: the text helper.


Copyright & Licensing
---------------------

Copyright (c) 2012 Kudelabs

Released under the MIT License. See LICENSE for details.

