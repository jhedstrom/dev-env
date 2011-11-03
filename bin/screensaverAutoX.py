#!/usr/bin/env python
#
# screensaverAutoX.py - X-Chat script to monitor for the DBUS message
# emitted when the screensaver is activated and de-activated and change the user
# /nick x-*
#

# To install:
#  o Copy this file to your ~/.xchat2/ directory and it will be loaded on startup.
#  o To load without restart, run: /py load screensaverAutoX.py
#    (If you don't want to put it in your ~/.xchat2, then specify the full path.)
#  o Replace string "erth" with your regular xchat /nick (or fix the code)
#
# If running the '/py' command above results in a message 'py :Unknown command',
# then you do not have the Python plugin installed.
#
# Original script idea from:
#  http://haus.nakedape.cc/svn/public/trunk/small-projects/desktop/screensaverAutoAway.py
#
# API docs available at:
#  http://xchat.org/docs/xchatpython.html
#

# Copyright 2009 Gregg J. Berkholtz, OpenSourcery, LLC.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
  
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

# $Id$

import dbus
from dbus.mainloop.glib import DBusGMainLoop

try:
    import xchat
except ImportError:
    # Allow for external tests
    pass

__author__              = 'Gregg Berkholtz <gregg at opensourcery.com>'
__module_name__         = 'screensaverAutoX'
__module_version__      = '0.1'
__module_description__  = 'x-\'s user when the GNOME screensaver is activated'


def screensaver_changed(state):
    ''' Called when screensaver stops or starts 
        state is either:
         - True:  Screensaver activated
         - False: Screensaver deactivated
    '''

    if state:
        set_xon()
    else:
        set_xoff()

def set_xon():
    x_nick = '%s|afk' % \
		(xchat.get_info('nick'))

    # TODO: check if /nick ! x-* , set it!
    #if xchat.nickcmp(nick, "x-".* ) == 0: 
    xchat.command('nick ' + x_nick)

def set_xoff():
    # TODO: construct regex which tests for an strips "x-" & "-AutoX"
    #if xchat.nickcmp(nick, "x-".* ) == 1: 
    xchat.command('nick ' + 'jhedstrom')

def setup_session():
    DBusGMainLoop(set_as_default=True)
    sesbus = dbus.SessionBus()
    sesbus.add_signal_receiver(screensaver_changed, 
            'SessionIdleChanged', 'org.gnome.ScreenSaver')

if __name__ == '__main__':

    setup_session()
    xchat.prnt('%s version %s by %s loaded' % \
                (__module_name__, __module_version__, __author__) )
