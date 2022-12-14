# Notes for Wordpress 

[Contents](contents.md) | [KWIC Index](kwic-index.md)

* [Delete all unapproved comments](#delete-all-unapproved-comments)

### Delete all unapproved comments

1. Go to phpmyadmin in your control panel (based on your hosting plan)

2. Click your Word Press database link

3. Click on the comments table (You can click browse to view all the approved and unapproved comments)

4. Click the mySQL tab. This will open up a query box. Delete the default query and type in:

DELETE FROM wp_comments WHERE comment_approved = 0

5. Click go, this will delete all the unapproved comments
