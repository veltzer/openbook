-- Personal definitions
FIRSTNAME = "Mark"
SURNAME = "Veltzer"
FULLNAME = FIRSTNAME .. " " .. SURNAME
EMAIL = "mark.veltzer@gmail.com"
DOMAIN = "veltzer.name"
SLUG = "veltzer"

GITHUB_USERNAME = "veltzer"
LAUNCHPAD_USERNAME = "mark-veltzer"

-- this is the key used for signing.
-- it really should not have a passphrase since that will means that I have
-- to manually sign everything.
-- it must match the email_key up.
KEY = "73C128F9"
EMAIL_KEY = "mark.veltzer@gmail.com"
-- the person who is the owner of the key and must match *exactly* what you get
-- from "gpg --list-keys".
KEY_SIGNER = FULLNAME .. " (signkey, never expires) <" .. EMAIL_KEY .. ">"

ORIGIN = FULLNAME .. " <" .. EMAIL .. ">"
-- hostname as seen from the outside world
WWW_HOSTNAME = DOMAIN
-- name as seen from the outside world
WWW_DOMAINNAME = DOMAIN
-- jsdoc style author tag
JSDOC_AUTHOR = EMAIL .. " (" .. FULLNAME .. ")"
