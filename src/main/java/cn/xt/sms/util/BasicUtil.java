package cn.xt.sms.util;

import java.util.ArrayList;
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

    /* ArrayList 元素位置交换. */
    public static void swap(List list, int i, int j) {
        Object temp = list.get(i);
        list.set(i, list.get(j));
        list.set(j, temp);
    }

}
