package cn.xt.sms.util;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2018/2/26.
 */
@Log4j
public class MyDateConverter implements Converter<String,Date> {

    private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    public static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public Date convert(String s) {
        try {
            return sdf1.parse(s);
        } catch (ParseException e) {
            try {
                return sdf2.parse(s);
            } catch (ParseException e1) {
                log.error("日期类型无法转换");
            }
        }
        return null;
    }

    public static String handleStr(String s) {
        /*从倒数第二位判断是上午还是下午 */
        /*固定格式 yyyy-MM-dd HH:mm:ss AA*/
        if (s.indexOf("A") == 20) {
            return s.substring(0, 19);
        } else if (s.indexOf("P") == 20) {
            /*如果是下午*/
            String date = s.substring(0, 10);//日期位
            String time = s.substring(11, 13);//时间位
            String minute = s.substring(14, 19);//分秒位

            if ("12".equals(time)) {
                /*下午12点，则时间位归零，日期加一*/
                time = "00";
                Calendar calendar = Calendar.getInstance();
                try {
                    calendar.setTime(sdf2.parse(date));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + 1);
                date = sdf2.format(calendar.getTime());
            } else {
                /*非12点，时间位加12*/
                try {
                    time = String.valueOf((Integer.valueOf(time) + 12));
                } catch (NumberFormatException nfe) {
                    return s;
                }
            }
            s = date + " " + time + ":" + minute;
        }
        return s;
    }

    public static void main(String[] args) {
        System.out.println(handleStr("2018/04/06 12:00:00 AM"));
    }
}
