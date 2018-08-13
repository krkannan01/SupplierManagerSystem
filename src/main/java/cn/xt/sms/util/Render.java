package cn.xt.sms.util;

import org.fusesource.jansi.Ansi;

/**
 * @Auther: Administrator
 * @Date: 2018/7/7 20:40
 * @Description: 字符串高亮输出工具类
 */
public class Render {

    public static Ansi.Color Black = Ansi.Color.BLACK;
    public static Ansi.Color Red = Ansi.Color.RED;
    public static Ansi.Color Green = Ansi.Color.GREEN;
    public static Ansi.Color Yellow = Ansi.Color.YELLOW;
    public static Ansi.Color Blue = Ansi.Color.BLUE;
    public static Ansi.Color Magenta = Ansi.Color.MAGENTA;
    public static Ansi.Color Cyan = Ansi.Color.CYAN;
    public static Ansi.Color White = Ansi.Color.WHITE;
    public static Ansi.Color Default = Ansi.Color.DEFAULT;

    public static String render(String text, Ansi.Color color) {
        return Ansi.ansi().eraseScreen().render("@|" + color.toString() + " " + text + "|@").toString();
    }

    public static String renderSuccess(String text) {
        return render(text, Green);
    }

    public static String renderError(String text) {
        return render(text, Red);
    }

    public static String renderWarn(String text) {
        return render(text, Yellow);
    }

    public static String renderInfo(String text) {
        return render(text, Cyan);
    }

}
