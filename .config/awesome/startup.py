#!/usr/bin/python
import os

every = ['synclient HorizTwoFingerScroll=1 RightButtonAreaLeft=0'
         ' RightButtonAreaTop=0',
         'python /home/administrator/.config/awesome/getnasa.py',
         'xmodmap -e "keycode 66 = Shift_L"']
once = [('dropboxd', 'dropbox'), 'xcompmgr', 'batti', 'thunderbird']

for c in every:
    os.system(c)

for c in once:
    if isinstance(c, tuple):
        if os.system('pgrep '+c[1]) != 0:
            os.system('{0}&'.format(c[0]))
            print('Starting '+c[0])
    else:
        if os.system('pgrep '+c) != 0:
            os.system('{0}&'.format(c))
            print('Starting '+c)
