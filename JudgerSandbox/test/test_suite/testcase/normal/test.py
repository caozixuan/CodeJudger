# -*- coding: utf-8 -*-
from testcase import base

import judger
import os
import resource
import signal


class NormalTest(base.BaseTestCase):

    def setUp(self):
        print("Running", self._testMethodName)
        self.workspace = self.init_workspace("normal")

    def _compile_c(self, src_name, extra_opt=None):
        return super(NormalTest, self)._compile_c("../../test_src/c/normal/" +
                                                  src_name, extra_opt)

    def _compile_cpp(self, src_name):
        return super(NormalTest, self)._compile_cpp("../../test_src/c/normal/" +
                                                    src_name)

    def test_args_must_be_list(self):
        with self.assertRaisesRegex(ValueError, "args must be a list!"):
            config = self.base_config
            config["args"] = "test"
            judger.run(**config)

        with self.assertRaisesRegex(ValueError, "args must be a list!"):
            config = self.base_config
            config["args"] = ("test", 1)
            judger.run(**config)

        with self.assertRaisesRegex(ValueError, "args must be a list!"):
            config = self.base_config
            config["args"] = {"a": "v"}
            judger.run(**config)

    def test_args_item_must_be_string(self):
        with self.assertRaisesRegex(ValueError, "args item must be a string!"):
            config = self.base_config
            config["args"] = ["test", 1]
            judger.run(**config)

        with self.assertRaisesRegex(ValueError, "args item must be a string!"):
            config = self.base_config
            config["args"] = [None, "1"]
            judger.run(**config)

        args = ["测试".encode("utf-8")]
        with self.assertRaisesRegex(ValueError, "args item must be a string!"):
            config = self.base_config
            config["args"] = args
            judger.run(**config)

    def test_env_must_be_list(self):
        with self.assertRaisesRegex(ValueError, "env must be a list!"):
            config = self.base_config
            config["env"] = "test"
            judger.run(**config)

        with self.assertRaisesRegex(ValueError, "env must be a list!"):
            config = self.base_config
            config["env"] = ("test", 1)
            judger.run(**config)

        with self.assertRaisesRegex(ValueError, "env must be a list!"):
            config = self.base_config
            config["env"] = {"a": "v"}
            judger.run(**config)

    def test_env_item_must_be_string(self):
        with self.assertRaisesRegex(ValueError, "env item must be a string!"):
            config = self.base_config
            config["env"] = ["test", 1]
            judger.run(**config)

        with self.assertRaisesRegex(ValueError, "env item must be a string!"):
            config = self.base_config
            config["env"] = [None, "1"]
            judger.run(**config)

        env = ["测试".encode("utf-8")]
        with self.assertRaisesRegex(ValueError, "env item must be a string!"):
            config = self.base_config
            config["env"] = env
            judger.run(**config)

    def test_seccomp_rules_can_be_none(self):
        config = self.base_config
        config["seccomp_rules"] = "general"
        judger.run(**config)

        config = self.base_config
        config["seccomp_rules"] = None
        judger.run(**config)

    # c files
    def test_args(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_args.c")
        config["args"] = ["arg1", "arg2"]
        output_path = config["output_path"] = config["error_path"] = \
            self.set_output_path()
        result = judger.run(**config)
        output = "argv[0]: /tmp/normal/test_args\nargv[1]: arg1\nargv[2]: arg2\n"
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)
        self.assertEqual(output, self.get_output_content(output_path))

    def test_env(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_env.c")
        output_path = config["output_path"] = config["error_path"] = \
            self.set_output_path()
        result = judger.run(**config)
        output = "judger\ntest\n"
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)
        self.assertEqual(output, self.get_output_content(output_path))

    def test_input_output(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_input_output.c")
        config["input_path"] = self.set_input("Judger")
        output_path = config["output_path"] = config["error_path"] = \
            self.set_output_path()
        result = judger.run(**config)
        output = "Judger\nHello world"
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)
        self.assertEqual(output, self.get_output_content(output_path))

    def test_output_size(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_output_size.c")
        config["max_output_size"] = 1000
        result = judger.run(**config)
        self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
        with open("/tmp/output_size_test", "r") as f:
            self.assertEqual(len(f.read()), 1000)

    def test_stdout_stderr(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_stdout_stderr.c")
        output_path = config["output_path"] = self.set_output_path()
        error_path = config["error_path"] = self.set_output_path()
        result = judger.run(**config)
        output = "test stdout\n"
        error = "test stderr\n"
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)
        self.assertEqual(output, self.get_output_content(output_path))
        self.assertEqual(error, self.get_output_content(error_path))

    def test_return(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_return.c")
        result = judger.run(**config)
        # test_return.c return 20
        self.assertEqual(result["exit_code"], 20)
        self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)


    def test_signal(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_signal.c")
        result = judger.run(**config)
        # test_signal.c raise sigsegv
        self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
        self.assertEqual(result["signal"], signal.SIGSEGV)

    def test_cpu_time(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_cpu_time.c")
        # cpu time must be very small, real time must be large
        # so that it won't get REAL_TIME_LIMIT_EXCEEDED
        config["max_cpu_time"] = 50
        config["max_real_time"] = 4000
        result = judger.run(**config)
        self.assertEqual(result["result"], judger.RESULT_CPU_TIME_LIMIT_EXCEEDED)
        self.assertEqual(result["signal"], signal.SIGKILL)
        self.assertTrue(result["cpu_time"] >= config["max_cpu_time"])

    def test_real_time(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_real_time.c")
        result = judger.run(**config)
        self.assertEqual(result["result"], judger.RESULT_REAL_TIME_LIMIT_EXCEEDED)
        self.assertEqual(result["signal"], signal.SIGKILL)
        self.assertTrue(result["real_time"] >= config["max_real_time"])

    def test_child_cpu_time(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_child_cpu_time.c")
        result = judger.run(**config)
        # child cpu time exceeded -> parent real time exceeded
        self.assertEqual(result["result"], judger.RESULT_REAL_TIME_LIMIT_EXCEEDED)

    def test_child_real_time(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_child_real_time.c")
        result = judger.run(**config)
        self.assertEqual(result["result"], judger.RESULT_REAL_TIME_LIMIT_EXCEEDED)

    def test_memory(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_memory.c")
        config["max_memory"] = 10 * 1024 * 1024
        result = judger.run(**config)

        # malloc failed, return 1
        self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
        self.assertEqual(result["exit_code"], 1)
        self.assertTrue(result["memory"] < config["max_memory"])

        config["max_memory"] = 60 * 1024 * 1024
        result = judger.run(**config)
        # malloc succeeded
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)


    def test_memory_arr(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_memory_arr.c")
        config["max_memory"] = 2 * 1024 * 1024
        result = judger.run(**config)
        # malloc failed
        self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
        self.assertTrue(result["memory"] < config["max_memory"])

    def test_memory_child(self):
        """Parent process memory should not affect child process."""
        a = ["test" for i in range(2000000)]
        # get self maxrss
        max_rss = resource.getrusage(resource.RUSAGE_SELF)[2]
        self.assertTrue(max_rss > 22000)
        result = judger.run(**self.base_config)
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)
        self.assertTrue(result["memory"] < 3000000)
        del a

    def test_stack_arr(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_stack_arr.c")

        # init failed
        config["max_stack"] = 16 * 1024 * 1024
        result = judger.run(**config)
        self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)

        # init succeeded
        config["max_stack"] = 128 * 1024 * 1024
        config["max_memory"] = 256 * 1024 * 1024
        result = judger.run(**config)
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)

    def test_uid_gid(self):
        config = self.base_config
        config["exe_path"] = self._compile_c("test_uid_gid.c")
        config["output_path"] = config["error_path"] = self.set_output_path()
        config["uid"] = 65534
        config["gid"] = 65534
        result = judger.run(**config)
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)
        output = "uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)\n" \
                 "uid: 65534\ngid: 65534\n"
        self.assertEqual(output, self.get_output_content(config["output_path"]))

    # cpp files
    def test_cpp_io(self):
        config = self.base_config
        config["exe_path"] = self._compile_cpp("test_cpp_io.cpp")
        config["input_path"] = self.set_input("Judger")
        output_path = config["output_path"] = config["error_path"] = \
            self.set_output_path()
        result = judger.run(**config)
        output = "Judger"
        self.assertEqual(result["result"], judger.RESULT_SUCCESS)
        self.assertEqual(output, self.get_output_content(output_path))

    def test_cpp_random(self):
        config = self.base_config
        config["max_memory"] = judger.UNLIMITED
        config["exe_path"] = "/usr/bin/gcc"

        path = os.path.dirname(os.path.abspath(__file__))
        path1 = os.path.join(path, "../../../test_src/c/normal/test_random.c")
        path2 = os.path.join(path, "../../../test_src/c/normal/test_urandom.c")

        # random
        config["args"] = [path1, "-o", os.path.join(self.workspace, "gcc_random")]
        result = judger.run(**config)
        self.assertTrue(result["real_time"] >= 1000)

        # urandom
        config["args"] = [path2, "-o", os.path.join(self.workspace, "gcc_urandom")]
        result = judger.run(**config)
        self.assertTrue(result["real_time"] >= 1000)
