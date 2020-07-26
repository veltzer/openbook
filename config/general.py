import datetime
import os
import socket

general_current_folder = os.path.basename(os.getcwd())
general_current_year = datetime.datetime.now().year
general_homedir = os.path.expanduser("~")
general_hostname = socket.gethostname()
