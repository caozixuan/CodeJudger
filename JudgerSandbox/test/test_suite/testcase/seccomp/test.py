# -*- coding: utf-8 -*-
from testcase import base

import judger
import os
import resource
import signal


class SeccompTest(base.BaseTestCase):
	BAD_SYSTEM_CALL = 31

	def setUp(self):
		print("Running", self._testMethodName)
		self.workspace = self.init_workspace("seccomp")

	def _compile_c(self, src_name, extra_opt=None):
		return super(SeccompTest, self)._compile_c("../../test_src/c/seccomp/" +
													src_name, extra_opt)

	def test_fork(self):
		config = self.base_config
		config["exe_path"] = self._compile_c("test_fork.c")

		# without seccomp
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)

		# with general seccomp
		config["seccomp_rules"] = "general"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
		self.assertEqual(result["signal"], self.BAD_SYSTEM_CALL)

	def test_sysinfo(self):
		config = self.base_config
		config["exe_path"] = self._compile_c("test_sysinfo.c")

		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)

	def test_execve(self):
		config = self.base_config
		config["exe_path"] = self._compile_c("test_execve.c")
		output_path = config["output_path"] = config["error_path"] = \
			self.set_output_path()
		output = "Hello world\n"

		# without seccomp
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual(output, self.get_output_content(output_path))

		# with general seccomp
		config["seccomp_rules"] = "general"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
		self.assertEqual(result["signal"], self.BAD_SYSTEM_CALL)

	def test_execveat(self):
		config = self.base_config
		config["exe_path"] = self._compile_c("test_execveat.c")
		output_path = config["output_path"] = config["error_path"] = \
			self.set_output_path()

		# without seccomp
		result = judger.run(**config)
		if "syscall not found" in self.get_output_content(output_path):
			print("execveat syscall not found, test ignored")
			return
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)


		# with general seccomp
		config["seccomp_rules"] = "general"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
		self.assertEqual(result["signal"], self.BAD_SYSTEM_CALL)

	def test_write_open(self):
		config = self.base_config
		config["exe_path"] = self._compile_c("test_write_open.c")
		output_path = config["output_path"] = config["error_path"] = \
			self.set_output_path()
		path = os.path.join(self.workspace, "file1.txt")
		config["args"] = [path, "w"]

		# without seccomp
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual("", self.get_output_content(output_path))

		# with general seccomp
		config["seccomp_rules"] = "general"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
		self.assertEqual(result["signal"], self.BAD_SYSTEM_CALL)

		#with general_io seccomp
		config["seccomp_rules"] = "general_io"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual("", self.get_output_content(output_path))

	def test_read_write_open(self):
		config = self.base_config
		config["exe_path"] = self._compile_c("test_write_open.c")
		output_path = config["output_path"] = config["error_path"] = \
			self.set_output_path()
		path = os.path.join(self.workspace, "file2.txt")
		config["args"] = [path, "w+"]

		# without seccomp
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual("", self.get_output_content(output_path))

		# with general seccomp
		config["seccomp_rules"] = "general"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
		self.assertEqual(result["signal"], self.BAD_SYSTEM_CALL)

		#with general_io seccomp
		config["seccomp_rules"] = "general_io"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual("", self.get_output_content(output_path))


	def test_write_openat(self):
		config = self.base_config
		config["exe_path"] = self._compile_c("test_write_openat.c")
		output_path = config["output_path"] = config["error_path"] = \
			self.set_output_path()
		path = os.path.join(self.workspace, "file3.txt")
		config["args"] = [path, "w"]

		# without seccomp
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual("", self.get_output_content(output_path))

		# with general seccomp
		config["seccomp_rules"] = "general"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
		self.assertEqual(result["signal"], self.BAD_SYSTEM_CALL)

		#with general_io seccomp
		config["seccomp_rules"] = "general_io"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual("", self.get_output_content(output_path))

	def test_read_write_openat(self):
		config = self.base_config
		config["exe_path"] = self._compile_c("test_write_openat.c")
		output_path = config["output_path"] = config["error_path"] = \
			self.set_output_path()
		path = os.path.join(self.workspace, "file4.txt")
		config["args"] = [path, "w+"]

		# without seccomp
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual("", self.get_output_content(output_path))

		# with general seccomp
		config["seccomp_rules"] = "general"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_RUNTIME_ERROR)
		self.assertEqual(result["signal"], self.BAD_SYSTEM_CALL)

		#with general_io seccomp
		config["seccomp_rules"] = "general_io"
		result = judger.run(**config)
		self.assertEqual(result["result"], judger.RESULT_SUCCESS)
		self.assertEqual("", self.get_output_content(output_path))

