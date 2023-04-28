# personal section
firstname = 'Mark'
surname = 'Veltzer'
fullname = f'{firstname} {surname}'
email = 'mark.veltzer@gmail.com'
domain = 'veltzer.name'
slug = 'veltzer'

github_username = "veltzer"
launchpad_username = "mark-veltzer"

# this is the key used for signing.
# it really should not have a passphrase since that will means that I have
# to manually sign everything...
# it must match the email_key up...
key = '73C128F9'
email_key = 'mark.veltzer@gmail.com'
# the person who is the owner of the key and must match *exactly* what you get
# from 'gpg --list-keys'...
key_signer = f'{fullname} (signkey, never expires) <{email_key}>'

origin = f'{fullname} <{email}>'
# hostname as seen from the outside world
www_hostname = domain
# name as seen from the outside world
www_domainname = domain
# jsdoc style author tag
jsdoc_author = f'{email} ({fullname})'
