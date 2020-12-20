#!/usr/bin/env python3

import datetime

now = datetime.datetime.now().time()

minute = now.minute
print(now.hour + minute/60)

