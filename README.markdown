This is a polling module for BrowerCMS.

Bugs:
====

Minor Issues
=====
* Tab order for responses is wrong.

BrowserCMS Notes:
================
* Using nested_attributes doesn't work without some monkeying around. Specifically, BrowserCMS doesn't consider nested attributes as 'changes', so
    updates (and a new version) doesn't get saved. Can fix this by timestamping 'updated_at' but the core CMS should be aware of
    nested_attributes and save correctly if they are present.