package cn.xt.sms.enums;

public enum ResponseCode {
    SUCCESS(0),
    ERROR(1);

    private ResponseCode(int code) { this.code = code; }

    private int code;
    public int getCode() { return code; }

}