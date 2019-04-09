package ssm.utils;

import java.io.File;
import java.util.Arrays;

import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;

public class JavaCompilerUtil {
    private static JavaCompiler javaCompiler;

    private JavaCompilerUtil() {
    };

    private static JavaCompiler getJavaCompiler() {
        if (javaCompiler == null) {
            synchronized (JavaCompilerUtil.class) {
                if (javaCompiler == null) {
                    // 讲道理，根据JavaCompiler 的获取方式来看，应该是采用了单例模式的，但是这里为了顺便复习一下单例模式，以及确保一下单例吧
                    javaCompiler = ToolProvider.getSystemJavaCompiler();
                }
            }
        }

        return javaCompiler;
    }

    public static boolean CompilerJavaFile(String sourceFileInputPath,
                                           String classFileOutputPath) {
        // 设置编译选项，配置class文件输出路径
        Iterable<String> options = Arrays.asList("-d", classFileOutputPath);
        StandardJavaFileManager fileManager = getJavaCompiler()
                .getStandardFileManager(null, null, null);

        Iterable<? extends JavaFileObject> compilationUnits = fileManager
                .getJavaFileObjectsFromFiles(Arrays.asList(new File(
                        sourceFileInputPath)));

        return getJavaCompiler().getTask(null, fileManager, null, options,
                null, compilationUnits).call();
    }
}
