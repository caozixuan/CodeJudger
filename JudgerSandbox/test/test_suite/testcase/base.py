# -*- coding: utf-8 -*-
from unittest import TestCase

import os
import shutil
import random


class BaseTestCase(TestCase):

    def init_workspace(self, test_type):
        base_dir = "/tmp"
        workspace = os.path.join(base_dir, test_type)
        shutil.rmtree(workspace, ignore_errors=True)
        os.makedirs(workspace)  # 递归创建目录，不存在的中间文件夹将被创建
        return workspace

    def tearDown(self):
        shutil.rmtree(self.workspace, ignore_errors=True)

    def gen_rand_str(self):
        return "".join([random.choice("123456789abcdef") for _ in range(10)])

    def _compile_c(self, src_path, extra_opt):
        path = os.path.dirname(os.path.abspath(__file__))
        src_name = src_path.split("/")[-1].split(".")[0]
        exe_path = os.path.join(self.workspace, src_name)
        opts = " "
        if extra_opt:
            opts += " ".join(extra_opt)
        cmd = ("gcc {0} -g -O0 -static -o {1}" + opts).format(os.path.join(path, src_path), exe_path)
        if os.system(cmd):  # 该函数返回非0为错
            raise AssertionError("Compile error, cmd:{0}".format(cmd))
        return exe_path

    def _compile_cpp(self, src_path):
        path = os.path.dirname(os.path.abspath(__file__))
        src_name = src_path.split("/")[-1].split(".")[0]
        exe_path = os.path.join(self.workspace, src_name)
        cmd = ("g++ {0} -g -O0 -o {1}").format(os.path.join(path, src_path), exe_path)
        if os.system(cmd):  # 该函数返回非0为错
            raise AssertionError("Compile error, cmd:{0}".format(cmd))
        return exe_path

    def set_input(self, content):
        path = os.path.join(self.workspace, self.gen_rand_str() + ".in")
        with open(path, "w") as f:
            f.write(content)
        return path

    def set_output_path(self):
        return os.path.join(self.workspace, self.gen_rand_str() + ".out")

    def get_output_content(self, path):
        with open(path, "r") as f:
            return f.read()

    @property
    def base_config(self):
        """Readonly property."""
        config = {"max_cpu_time": 1000,
                  "max_real_time": 3000,
                  "max_memory": 128 * 1024 * 1024,
                  "max_stack": 16 * 1024 * 1024,
                  "max_process_number": 10,
                  "max_output_size": 1024 * 1024,
                  "exe_path": "/bin/ls",
                  "input_path": "/dev/null",
                  "output_path": "/dev/null",
                  "error_path": "/dev/null",
                  "args": [],
                  "env": ["home=test", "test=judger"],
                  "log_path": "judger_test.log",
                  "seccomp_rules": None,
                  "uid": 0,
                  "gid": 0}
        return config

