package cn.xt.sms.util;

import org.apache.poi.ss.formula.functions.T;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author xietao.x@qq.com
 * @date 2018/4/25
 */
public class BasicUtil {

    /* 把用 "," 分隔的字符串转换成 Integer 集合. */
    public static List<Integer> convertIntegers(String ints) {
        List<Integer> array = null;
        if (ints != null) {
            String[] temp = ints.split(",");
            if (temp.length > 0) {
                array = new ArrayList<Integer>(temp.length);
                for (int i = 0; i < temp.length; i++) {
                    try {
                        array.add(Integer.valueOf(temp[i]));
                    } catch (NumberFormatException nfe) {
                        continue;
                    }
                }
            }
        }
        return array;
    }

    public static Integer[] List2Array(List<Integer> list) {
        Integer[] arr = new Integer[list.size()];
        list.toArray(arr);
        return arr;
    }

    /* ArrayList 元素位置交换. */
    public static void swap(List list, int i, int j) {
        Object temp = list.get(i);
        list.set(i, list.get(j));
        list.set(j, temp);
    }

    //文件到byte数组
    public static byte[] image2byte(String path){
        byte[] data = null;
        FileInputStream input = null;
        try {
            input = new FileInputStream(new File(path));
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            int numBytesRead = 0;
            while ((numBytesRead = input.read(buf)) != -1) {
                output.write(buf, 0, numBytesRead);
            }
            data = output.toByteArray();
            output.close();
            input.close();
        }
        catch (FileNotFoundException ex1) {
            ex1.printStackTrace();
        }
        catch (IOException ex1) {
            ex1.printStackTrace();
        }
        return data;
    }

    //byte数组到文件
    public static void byte2image(byte[] data,String path){
        if(data.length<3||path.equals("")) return;
        try{
            FileOutputStream imageOutput = new FileOutputStream(new File(path));
            imageOutput.write(data, 0, data.length);
            imageOutput.close();
            System.out.println("Make Picture success,Please find image in " + path);
        } catch(Exception ex) {
            System.out.println("Exception: " + ex);
            ex.printStackTrace();
        }
    }


}
