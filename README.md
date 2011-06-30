# Minion: A Ruby framework for building mini apps

Welcome to Minion the framework for building mini Ruby applications.

Mini applications or minions can be built that rely on services provided by the Minion gem. For example you could use the database and email service to create a simple app that reads a table of user account details and sends an email to each user.

The idea is that each of these mini apps can be controlled from the Minion command-line and executed using a cron job.

## Minion commands

`minion init`<br/>
Creates a `./minions` directory from where it is executed. This directory will hold your minions (mini apps).


`minion add my_app_name`<br/>
Creates a new minion app in the `./minions/my_app_name` directory.


`minion list`<br/>
Returns a list of all the minion apps in the `./minions` directory.

##Building new services

To create a new Minion service, such as a Twitter service, create a new twitter directory under the services directory in the Minion code base.

Use Rake to help you do this:

    bundle exec rake minion:service[twitter]
    
Now edit this new service **lib/services/twitter** and modify the tests in the **spec/services/twitter** directory.


## TODO

* Create minion to read a table
* Refactor Commands#add method
* Start an app
* Whenever gem - cron job to call app



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
