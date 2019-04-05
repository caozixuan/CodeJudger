package ssm.utils;

import ssm.model.Submit;

import java.io.*;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Compiler {
    private Pattern packagePattern = Pattern.compile("^[ ]*package.*;");
    private Pattern classNamePattern = Pattern
            .compile("public[ ]*class[ ]*Main[ ]*\\{");
    private Pattern mainMethodPattern = Pattern
            .compile("public[ ]*static[ ]*void[ ]*main");

    private boolean checkCodeStandard(String code) {
        Matcher matcher = packagePattern.matcher(code);
        if (matcher.find()) {
            System.out.println("不能拥有package语句");
            return false;
        }

        matcher = classNamePattern.matcher(code);
        if (!matcher.find()) {
            System.out.println("主类名必须是Main");
            return false;
        }

        matcher = mainMethodPattern.matcher(code);
        if (!matcher.find()) {
            System.out.println("没有静态的main方法入口");
            return false;
        }

        return true;
    }

    public boolean compileCode(Submit submit) throws Exception{
        if(!checkCodeStandard(submit.getCode()))
            return false;
        String uuid = UUID.randomUUID().toString();
        uuid = "a"+uuid;
        uuid = uuid.replace("-","a");
        String code = submit.getCode().replace("Main", uuid);

        File f = new File(uuid+".java");
        if(!f.exists())
        {
            f.createNewFile();
        }
        BufferedWriter writer = new BufferedWriter(new FileWriter(f,true));
        writer.write(code);
        writer.close();
        // change to what you need !!!
        return JavaCompilerUtil.CompilerJavaFile(uuid+".java","");
    }

}
