## Active Admin Delayed Job Controller

This module adds a plug-and-play controller to your existing Active Admin setup.  It allows you to view and manage the delayed jobs in your queue.

### Installation

  - Add this to your Gemfile
    ```gem 'activeadmin-delayed-job', github: 'drush/activeadmin-delayed-job'```
  - Run ```bundle install```
  - Restart your server and load Active Admin in your browser

### Features
- View all the delayed jobs in your system
- Filter to All, Running, Failed, and Queued jobs
 - Select and Retry or Delete jobs

 ### Changes

 #### 0.5.0 (Nov 20, 2018)
 - RENAMED to activeadmin-delayed-job
 - Validated against Rails 5
 - Validated against ActiveAdmin 1.4.2
 - Enable Rubocop
 - Migrate Readme to Markdown