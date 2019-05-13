import sys
import judger
from unittest import TestCase, main

from testcase.normal.test import NormalTest
from testcase.seccomp.test import SeccompTest

ver = judger.VERSION
print("Judger version %d.%d.%d"  \
    % ((ver >> 16) & 0xff, (ver >> 8) & 0xff, ver & 0xff))
print(sys.version)

if __name__ == '__main__':
    main()

