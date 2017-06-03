#!/usr/bin/env python
import datetime
import calendar

# refer to https://stackoverflow.com/questions/2331592/datetime-datetime-utcnow-why-no-tzinfo/2331635#2331635
from datetime import timedelta, tzinfo

ZERO = timedelta(0)

# A UTC class.

class UTC(tzinfo):
    """UTC"""

    def utcoffset(self, dt):
        return ZERO

    def tzname(self, dt):
        return "UTC"

    def dst(self, dt):
        return ZERO

utc = UTC()


dt = datetime.datetime.now(utc)
print dt
