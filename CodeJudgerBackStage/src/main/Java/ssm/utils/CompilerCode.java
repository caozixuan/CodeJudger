package ssm.utils;

import ssm.model.Submit;

import java.io.*;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CompilerCode {

    private static Pattern packagePattern = Pattern.compile("^[ ]*package.*;");
    private static Pattern classNamePattern = Pattern
            .compile("public[ ]*class[ ]*Main[ ]*\\{");
    private static Pattern mainMethodPattern = Pattern
            .compile("public[ ]*static[ ]*void[ ]*main");

    public static boolean checkCodeStandard(String code) {
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

    public static String compileCode(String code) throws Exception{
        if(!checkCodeStandard(code))
            return null;
        String uuid = UUID.randomUUID().toString();
        uuid = "a"+uuid;
        uuid = uuid.replace("-","a");
        code = code.replace("Main", uuid);
        uuid = basePath+uuid;
        String fileName = uuid+".java";
        File f = new File(fileName);
        if(!f.exists())
        {
            f.createNewFile();
        }
        BufferedWriter writer = new BufferedWriter(new FileWriter(f,true));
        writer.write(code);
        writer.close();
        return uuid;
    }


    public static String basePath = "/CSource/";
    public static String compile (String code) throws Exception
    {
        String uuid = UUID.randomUUID().toString();
        String fileName = basePath+uuid+".c";
        File f = new File(fileName);
        if(!f.exists())
        {
            f.createNewFile();
        }
        BufferedWriter writer = new BufferedWriter(new FileWriter(f,true));
        writer.write(code);
        writer.close();
        String command = "gcc -o "+basePath+uuid+".out " + fileName;
        Runtime.getRuntime().exec(command).waitFor();
        String outputName = basePath+uuid;
        return outputName;
    }

    public  static String exec(String code, String language,String in, int timeLimit, int memoryLimit) throws Exception
    {
        in = "/CSource/"+in;
        if(language.equals("C"))
        {
            String outputName = compile(code);
            String exe = outputName+".out";
            String out = outputName+".output";
            //String in = "/CSource/normal.in";
            String error = outputName+".err";
            String command = "/JudgerSandbox/output/libJudgerSandbox.so --exe_path="+exe+" --input_path="+in+" --output_path="+out+" --error_path="+error+" --max_real_time="+timeLimit+" --max_memory="+memoryLimit;
            Runtime.getRuntime().exec(command).waitFor();
            return out;
        }
        else if(language.equals("Java"))
        {
            String outputName = compileCode(code);
            String out = outputName+".output";
            //String in = "/CSource/normal.in";
            String error = outputName+".err";
            String command = "/JudgerSandbox/output/libJudgerSandbox.so --exe_path=/opt/jdk/bin/java"+" --output_path="+out+" --error_path="+error+
                    "--args=\"-cp\" --args=\""+outputName+"\" --args=\"-xx:MaxRAM=2048K\" --args=\"-Djava.security.manager\"" +
                    " --args=\"-Dfile-encoding=UTF-8\" --args=\"-Djava.awt.headless=True\" --args=\""+outputName.substring(outputName.indexOf("/",2)+1)+"\""+" --max_real_time="+timeLimit+" --max_memory="+memoryLimit;
            Runtime.getRuntime().exec(command).waitFor();
            return out;
        }
        return null;
    }

    public  static boolean judge(String code, String stdOut,String language, String in, int timeLimit, int memoryLimit) throws Exception
    {
        String out = exec(code,language,in,timeLimit, memoryLimit);
        stdOut = "/CSource/"+stdOut;
        //String stdOut = "/CSource/normal.out";
        File file = new File(out);//定义一个file对象，用来初始化FileReader
        FileReader reader = new FileReader(file);//定义一个fileReader对象，用来初始化BufferedReader
        BufferedReader bReader = new BufferedReader(reader);//new一个BufferedReader对象，将文件内容读取到缓存
        StringBuilder sb = new StringBuilder();//定义一个字符串缓存，将字符串存放缓存中
        String s = "";
        while ((s =bReader.readLine()) != null) {//逐行读取文件内容，不读取换行符和末尾的空格
            sb.append(s + "\n");//将读取的字符串添加换行符后累加存放在缓存中
        }
        String actualOutput = sb.toString();
        reader = new FileReader(new File(stdOut));
        bReader = new BufferedReader(reader);
        sb = new StringBuilder();//定义一个字符串缓存，将字符串存放缓存中
        s = "";
        while ((s =bReader.readLine()) != null) {//逐行读取文件内容，不读取换行符和末尾的空格
            sb.append(s + "\n");//将读取的字符串添加换行符后累加存放在缓存中
        }
        String normalOutput = sb.toString();
        bReader.close();
        if(normalOutput.equals(actualOutput))
            return true;
        return false;

    }


    public static void main(String[] args)
    {
        String code = "#include <stdio.h>\n" +
                "#include <string.h>\n" +
                "\n" +
                "int main()\n" +
                "{\n" +
                "    char input[100];\n" +
                "    scanf(\"%s\", input);\n" +
                "    printf(\"%s\\n\", input);\n" +
                "    printf(\"Hello world\");\n" +
                "    return 0;\n" +
                "}";
        try{
            boolean flag = CompilerCode.judge(code, "C","C","normal.in",10000,10000000);
            if(flag)
            {
                System.out.println("Success!");
            }
            else
            {
                System.out.println("Fail!");
            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
