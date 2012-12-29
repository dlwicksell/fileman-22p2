#! /usr/bin/env python
#
# VEN/SMH - Python Unit Tests for %DT
# Written on 27 Dec 2012

# Only the Unit Tests that can't be done in Mumps are done here.
# This usually means interactive programs.

import sys
from os import path
import pexpect
import unittest

class TestPercentDT(unittest.TestCase):
    """ Contains all unit tests for %DT that cannot be carried out in Mumps """
    def setUp(self):
        """ Opens the Mumps Prompt """
        # TODO: Write something similar for Cache using
        # csession CACHE -U NMSP
        gtm_dir = path.expandvars('$gtm_dist')
        self.child = pexpect.spawn(path.join(gtm_dir,'mumps -dir'))
        # self.child.logfile = sys.stdout

    def test_DT_E_(self):
        """ Tests %DT("E") to echo a prompt after answer. """
        self.child.sendline('S %DT="AE" D ^%DT')
        self.child.sendline('11/11/1917')
        # The following sendline() is necessary because the echo
        # only shows up after the enter above. Don't know why!
        self.child.sendline()

        i = self.child.expect('\(.*\)')  # Read (...) of echo
        if i==0:
          self.assertEqual(self.child.match.group(),"(NOV 11, 1917)")

    def test_DT_DTOUT(self):
        """ Tests the presence of DTOUT upon timeout. """
        self.child.sendline('K DTOUT S DTIME=1')
        self.child.sendline('S %DT="A" D ^%DT')
        self.child.waitnoecho(2) # Wait 2 seconds
        self.child.sendline()
        self.child.sendline('W $D(DTOUT)')
        i = self.child.expect('\w+\r\n')
        # print("Group: " + self.child.match.group())
        # print("Before: " + self.child.before)
        # print("After: " + self.child.after)
        if i==0:
          self.assertTrue(int(self.child.match.group())>0)

    def tearDown(self):
        """ Closes the Mumps Prompt """
        self.child.sendline('HALT')

if __name__ == "__main__":
    unittest.main()
