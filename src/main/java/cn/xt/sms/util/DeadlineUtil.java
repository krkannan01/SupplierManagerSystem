package cn.xt.sms.util;

import java.util.HashMap;
import java.util.Map;

/**
 * ʵ�ִ��������Ϣ��Map���Ϲ���
 * @author xietao.x@qq.com
 * @date 2018/4/10
 */
public class DeadlineUtil {

    // <String, Long> key����û�����Ϣ�� value��Ź���ʱ����Ϣ
    private static Map<String, Long> states = new HashMap<String, Long>();

    //����ֵ, key��ֵ  millisecond���ö��ٺ�������
    public static void set(String key, Long millisecond) {
        states.put(key, System.currentTimeMillis() + millisecond);
    }

    /*���ظ�ֵ�Ƿ����*/
    public static boolean expire(String key) {
        Long time = states.get(key);
        if (time != null) {
            //���û�е�����ʱ��
            if (time > System.currentTimeMillis()) {
                return false;
            } else {
                states.remove(key);
            }
        }
        return true;
    }

}