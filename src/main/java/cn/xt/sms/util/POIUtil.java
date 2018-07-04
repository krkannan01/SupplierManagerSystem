package cn.xt.sms.util;

import cn.xt.sms.exception.NullCellValueException;
import org.apache.poi.ss.usermodel.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author xietao.x@qq.com
 * @date 2018/5/4
 */
public class POIUtil {

    public static final SimpleDateFormat FORMAT1 = new SimpleDateFormat("yyyy-MM-dd");
    public static final SimpleDateFormat FORMAT2 = new SimpleDateFormat("yyyy年MM月dd日");
    public static final SimpleDateFormat FORMAT3 = new SimpleDateFormat("yyyy/MM/dd");
    public static final SimpleDateFormat FORMAT4 = new SimpleDateFormat("yyyyMMdd");

    public static final int STRING_TYPE = 1;
    public static final int FLOAT_TYPE = 2;
    public static final int DATE_TYPE = 3;

    public CellStyle[] styles = null;

    public POIUtil(Workbook wb) {
        /*橙色字*/
        Font orange = wb.createFont();
        orange.setColor(IndexedColors.ORANGE.getIndex());

        /*绿色字*/
        Font green = wb.createFont();
        green.setColor(IndexedColors.GREEN.getIndex());

        /*背景色*/
        CellStyle normal = wb.createCellStyle();
        normal.setAlignment(HorizontalAlignment.CENTER);
        normal.setVerticalAlignment(VerticalAlignment.CENTER);

        CellStyle orange_grey = wb.createCellStyle();
        orange_grey.setAlignment(HorizontalAlignment.CENTER);
        orange_grey.setVerticalAlignment(VerticalAlignment.CENTER);
        orange_grey.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        orange_grey.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        orange_grey.setFont(orange);

        CellStyle green_grey = wb.createCellStyle();
        green_grey.setAlignment(HorizontalAlignment.CENTER);
        green_grey.setVerticalAlignment(VerticalAlignment.CENTER);
        green_grey.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        green_grey.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        green_grey.setFont(green);

        CellStyle orange_lemon = wb.createCellStyle();
        orange_lemon.setAlignment(HorizontalAlignment.CENTER);
        orange_lemon.setVerticalAlignment(VerticalAlignment.CENTER);
        orange_lemon.setFillForegroundColor(IndexedColors.LEMON_CHIFFON.getIndex());
        orange_lemon.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        orange_lemon.setFont(orange);

        CellStyle green_lemon = wb.createCellStyle();
        green_lemon.setAlignment(HorizontalAlignment.CENTER);
        green_lemon.setVerticalAlignment(VerticalAlignment.CENTER);
        green_lemon.setFillForegroundColor(IndexedColors.LEMON_CHIFFON.getIndex());
        green_lemon.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        green_lemon.setFont(green);

        CellStyle orange_pale = wb.createCellStyle();
        orange_pale.setAlignment(HorizontalAlignment.CENTER);
        orange_pale.setVerticalAlignment(VerticalAlignment.CENTER);
        orange_pale.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
        orange_pale.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        orange_pale.setFont(orange);

        CellStyle green_pale = wb.createCellStyle();
        green_pale.setAlignment(HorizontalAlignment.CENTER);
        green_pale.setVerticalAlignment(VerticalAlignment.CENTER);
        green_pale.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
        green_pale.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        green_pale.setFont(green);

        CellStyle orange_tan = wb.createCellStyle();
        orange_tan.setAlignment(HorizontalAlignment.CENTER);
        orange_tan.setVerticalAlignment(VerticalAlignment.CENTER);
        orange_tan.setFillForegroundColor(IndexedColors.TAN.getIndex());
        orange_tan.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        orange_tan.setFont(orange);

        CellStyle green_tan = wb.createCellStyle();
        green_tan.setAlignment(HorizontalAlignment.CENTER);
        green_tan.setVerticalAlignment(VerticalAlignment.CENTER);
        green_tan.setFillForegroundColor(IndexedColors.TAN.getIndex());
        green_tan.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        green_tan.setFont(green);

        this.styles = new CellStyle[]{normal, orange_grey, green_grey, orange_lemon, green_lemon, orange_pale, green_pale, orange_tan, green_tan};

    }

    /*获取字符值*/
    public static String getStringValue(Cell cell, String key) throws NullCellValueException {
        String value = POIUtil.getStringValue(cell);
        isNotNull(key, value);
        return value;
    }
    public static String getStringValue(Cell cell) {
        if (cell == null) return null;
        cell.setCellType(CellType.STRING);
        cell.getCellTypeEnum();
        String value = cell.getStringCellValue();
        return value;
    }

    /*获取日期值*/
    public static Date getDateValue(Cell cell, String key) throws NullCellValueException {
        Date value = POIUtil.getDateValue(cell);
        isNotNull(key, value);
        return value;
    }
    public static Date getDateValue(Cell cell) {
        if (cell == null) return null;
        Date value = null;
        if (cell.getCellTypeEnum() == CellType.STRING) {
            value = POIUtil.parse(cell.getStringCellValue());
        } else {
            cell.setCellType(CellType.NUMERIC);
            value = cell.getDateCellValue();
        }
        return value;
    }

    /*获取浮点数*/
    public static Float getFloatValue(Cell cell, String key) throws NullCellValueException {
        Float value = POIUtil.getFloatValue(cell);
        isNotNull(key, value);
        return value;
    }
    public static Float getFloatValue(Cell cell) {
        if (cell == null) return null;
        cell.setCellType(CellType.NUMERIC);
        Float value = Float.valueOf(String.valueOf(cell.getNumericCellValue()));
        return value;
    }

    /*日期格式化*/
    private static Date parse(String text) {
        SimpleDateFormat[] formatArray = new SimpleDateFormat[]{FORMAT1,FORMAT2,FORMAT3,FORMAT4};
        Date date = null;
        for (SimpleDateFormat sdf : formatArray) {
            try {
                date = sdf.parse(text);
                break;
            } catch (ParseException e) {
                continue;
            }
        }
        return date;
    }

    /*判断非空*/
    private static void isNotNull(String key, Object value) throws NullCellValueException {
        if (value == null || "".equals(value)) {
            throw new NullCellValueException("[" + key + "]列不能为空值，跳过该行！");
        }
    }

}
