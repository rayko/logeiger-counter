# Logeigger Counter

Watches a provided file for changes, prints output to console and plays a sound for every change event detected.

# Usage

Clone the repo:

```
$ git clone <pending>
```

Install Ruby:

Ruby 3.2.2 via RVM, rbenv or system package and Bundler.

Gosu dependencies:

```
$ sudo apt-get install build-essential libsdl2-dev libgl1-mesa-dev libgmp-dev libfontconfig1-dev
```

This thing dependencies:

```
$ bundle install
```

This thing was meant to be used with log files or pretty much any kind, like Rails logs, system logs, etc.

To run it just run:

```
$ ruby watch_file.rb path/to/log.log
```

And that's it. You can get creative with remote logs as well using SSH like:

```
$ ssh some-server 'tail -f path/to/remote/log.log' > local.log
```

And watch `local.log` with the previous command.

# Why?

I think this is cool. Might be useful if you're a multitasking person and want to keep watch on a log as you
work instead of looking at it. I also like geiger counters.

# Notes

- Original sample file was aquired from [Pixabay](https://pixabay.com/)
- Built using part of Gosu
- Tested on Ubuntu 20.04 (focal)
- There might be some additional package needed for Gosu I haven't noted above, checkout [Gosu](https://github.com/gosu/gosu) for more info about it
