Rdiff backup solution for backing up mulitple servers

== Directories ==

* bin    -- sh & perl scripts to control operations
* Logs   -- Logs from this week
* Old    -- Logs from last week
* Run    -- Run-time exclude list
* Include - Human version of what to include

== Setup ==

As root you will need to have done:

# ssh-keygen -t rsa
# ssh-copy-id ~/.ssh/id_rsa.pub

Then for each site (start with one)

bin/add-new-host site
bin/Run-backup site

Lastly add a crontab entry.

== Crontab ==

# at 1:01 am (its long running so do overnight)
01 1 * * *       cd /my/backup && bin/Run-Backup -AR

