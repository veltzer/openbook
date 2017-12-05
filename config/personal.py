# personal section
personal_firstname = 'Mark'
personal_surname = 'Veltzer'
personal_fullname = '{personal_firstname} {personal_surname}'.format(**locals())
personal_email = 'mark.veltzer@gmail.com'
personal_domain = 'veltzer.name'
personal_ip = '192.115.134.55'
personal_line = 'line134-55.adsl.actcom.co.il'
personal_slug = 'veltzer'

# this is the key used for signing.
# it really should not have a passphrase since that will means that I have
# to manually sign everything...
# it must match the personal_email_key up...
personal_key = '73C128F9'
personal_email_key = 'mark.veltzer@gmail.com'
# the person who is the owner of the key and must match *exactly* what you get
# from 'gpg --list-keys'...
personal_key_signer = '{personal_fullname} (signkey, never expires) <{personal_email_key}>'.format(**locals())

personal_origin = '{personal_fullname} <{personal_email}>'.format(**locals())
# hostname as seen from the outside world
personal_www_hostname = personal_domain
# domainname as seen from the outside world
personal_www_domainname = personal_domain
# jsdoc style author tag
personal_jsdoc_author = '{personal_email} ({personal_fullname})'.format(**locals())
