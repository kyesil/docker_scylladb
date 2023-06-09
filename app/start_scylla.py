#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import signal
import subprocess
import scyllasetup
import logging
import commandlineparser

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG,
                    format="%(message)s")

supervisord = None


def signal_handler(signum, frame):
    supervisord.send_signal(signum)


signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)

try:
    arguments, extra_arguments = commandlineparser.parse()
    # arguments.seeds="scy1,scy2,scy3"
    arguments.seeds=os.getenv('SCYLLA_SEEDS')
    setup = scyllasetup.ScyllaSetup(arguments, extra_arguments=extra_arguments)
    print(vars(arguments))
  
    setup.developerMode()
    setup.cpuSet()
    setup.io()
    setup.cqlshrc()
    setup.arguments()
    setup.set_housekeeping()
    supervisord = subprocess.Popen(
        ["/usr/bin/supervisord", "-c",  "/etc/supervisord.conf"])
    supervisord.wait()
except Exception:
    logging.exception('failed!')
