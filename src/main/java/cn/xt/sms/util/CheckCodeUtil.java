package cn.xt.sms.util;

import org.springframework.stereotype.Repository;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Arrays;
import java.util.Random;
import java.util.ResourceBundle;

/**
 * 生成验证码的工具类
 * @author xietao.x@qq.com
 * @date 2018/3/11
 */
public class CheckCodeUtil {

    // У����ͼƬ��
    private int width;
    // У����ͼƬ��
    private int height;
    // У���볤��
    private int codeLength;
    // �����ĸ��������
    private String[] charArray;

    public void setCodeLength(int codeLength) {
        this.codeLength = codeLength;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public void setCharArray(String charArray) {
        this.charArray = charArray.split(",");
    }

    /*
     * �������������֤��
     */
    public String generateRandomNumberCode() {
        String sRand = "";
        Random random = new Random();
        for (int i = 0; i < codeLength; i++) {
            sRand += random.nextInt(10);
        }
        return sRand;
    }

    /*
     * ���������ĸ���ֻ����֤��
     */
    public String generateRandomMixedCode() {
        String sRand = "";
        Random random = new Random();
        for (int i = 0; i < codeLength; i++) {
            sRand += charArray[random.nextInt(charArray.length)];
        }
        return sRand;
    }

    /*
     * ȡ����֤��ͼƬ
     */
    public BufferedImage getImage(String checkCode) {
        // ���ڴ��д���ͼ��
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);
        // ��ȡͼ��������
        Graphics g = image.getGraphics();
        // �趨����ɫ
        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);
        // �趨����
        g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
        // ���������
        Random random = new Random();
        // �������155�������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽
        g.setColor(getRandColor(160, 200));
        for (int i = 0; i < 155; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }

        for (int i = 0; i < checkCode.length(); i++) {
            // ����֤����ʾ��ͼ����
            g.setColor(new Color(20 + random.nextInt(110), 20 + random
                    .nextInt(110), 20 + random.nextInt(110)));
            // ���ú�����������ɫ��ͬ����������Ϊ����̫�ӽ�������ֻ��ֱ������
            g.drawString(String.valueOf(checkCode.charAt(i)), 13 * i + 6, 16);
        }

        // ͼ����Ч
        g.dispose();
        return image;
    }

    /*
     * ������Χ��������ɫ
     */
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

}
