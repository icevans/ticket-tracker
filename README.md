# README

A simple ticket tracking app written in Rails 6, backed by PostgreSQL.

## Getting Started

1. This app requires Ruby 2.5 -- make sure you have the correct version by running ```ruby -v`
1. From the project directory, run `bundle install`
1. Run `rails s` to start the app locally
1. Visit `localhost:3000` in your browser

## Deploying to Mothership

This app is currently optimized for deploying to Mothership -- for details on setting up your own Mothership PaaS, visit the [Mothership Repo](https://github.com/mothership-paas/mothership).

1. Create a zip of your source code with `git archive --format zip --output ~/ticketing-app.zip master`
1. Visit your Mothership in the browser
1. Create a new app and upload the zip file you created in step 1
1. Once the build completes, add a database to the app
1. You then need to set two environment variables from the Mothership UI:
  - RACK_ENV=production
  - RAILS_SERVE_STATIC_FILES=true
1. Open an in-browser terminal from Mothership and run `rake db:migrate` to set up the database schema
1. That's it! Your ticketing app is ready to go -- you can view it by clicking the `Open App` button
