package ssm.utils;

import java.io.*;
import java.util.UUID;

public class CompilerForC {
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

    public  static String exec(String code) throws Exception
    {
        String outputName = compile(code);
        String exe = outputName+".out";
        String out = outputName+".output";
        String in = "/CSource/normal.in";
        String error = outputName+".err";
        String command = "/JudgerSandbox/output/libJudgerSandbox.so --exe_path="+exe+" --input_path="+in+" --output_path="+out+" --error_path="+error;
        Runtime.getRuntime().exec(command).waitFor();
        return out;
    }

    public  static boolean judge(String code) throws Exception
    {
        String out = exec(code);
        String stardardOut = "/CSource/normal.out";
        File file = new File(out);//定义一个file对象，用来初始化FileReader
        FileReader reader = new FileReader(file);//定义一个fileReader对象，用来初始化BufferedReader
        BufferedReader bReader = new BufferedReader(reader);//new一个BufferedReader对象，将文件内容读取到缓存
        StringBuilder sb = new StringBuilder();//定义一个字符串缓存，将字符串存放缓存中
        String s = "";
        while ((s =bReader.readLine()) != null) {//逐行读取文件内容，不读取换行符和末尾的空格
        sb.append(s + "\n");//将读取的字符串添加换行符后累加存放在缓存中
        }
        String actualOutput = sb.toString();
        reader = new FileReader(new File(stardardOut));
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
            boolean flag = CompilerForC.judge(code);
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
