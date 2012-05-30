This is a polling module for BrowerCMS. It allows editors to create polls which have a single question, and an unlimited number of answers.
Users can participate in polls by voting (once), and can see the results ahead of time. This module is primarily designed to
provide a simple feedback option for sites to collect information from visitors.

* Editors should have the ability to easily create, edit and delete polls on any page of
the website
* Polls should consist of a question followed by a series of potential answers
* Users should be limited to selecting only one answer, and submitting that answer to any 
given Poll only once 
* Users should be able to view Poll results in a simple, graphical format, without requiring 
users to leave or refresh the page 
* Pages should be able to contain one or many Polls 
* A single Poll should be able to reside on one or many pages simultaneously 
* Content Editors have a convient link to 'reset' their voting privileges in order to support testing.

Security Caveat:
=====
Security to prevent multiple voting is extremely simple, storing a cookie when a user votes, so this solution is not appropriate for 'serious' voting. Users can
vote multiple times from multiple computers or just clear their cookies to revote.

Installation:
=============

    $ rails g cms:install bcms_polling

 Follow standard module installation after that.

 Finally, add the default stylesheet for polls to your template, tweaking as necessary or inlining into the site's main stylesheet.

     <%= stylesheet_link_tag '/bcms/polling/bcms-polling' %>

Bugs:
====
* Tab order for responses is wrong.  [Minor Issue]

BrowserCMS Core Notes:
================
* Using nested_attributes doesn't work without some monkeying around. Specifically, BrowserCMS doesn't consider nested attributes as 'changes', so updates (and a new version) doesn't get saved. Can fix this by timestamping 'updated_at' but the core CMS should be aware of nested_attributes and save correctly if they are present.

## To Do (3.5.x upgrade)

* Cannot delete poll responses via the admin.
* Verify install works

