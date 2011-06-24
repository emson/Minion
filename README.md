# Minion: A Ruby framework for building mini apps

Welcome to Minion the framework for building mini Ruby applications.

Mini applications or minions can be built that rely on services provided by the Minion gem. For example you could use the database and email service to create a simple app that reads a table of user account details and sends an email to each user.

The idea is that each of these mini apps can be controlled from the Minion command-line and executed using a cron job.

## Minion commands

`minion init`<br/>
Creates a `.minion` directory in your home directory. This directory holds configuration information that your minions (mini apps) will use.





## Contributing to minion
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.


## Copyright

Copyright (c) 2011 Ben Emson. See LICENSE.txt for further details.