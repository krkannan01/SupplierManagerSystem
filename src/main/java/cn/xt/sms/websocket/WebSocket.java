package cn.xt.sms.websocket;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import cn.xt.sms.util.Render;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 * @author 
 */
@Log4j
//@Component
//@ServerEndpoint("/websocket")
public class WebSocket {

    //用来存放每个客户端对应的WebSocketTest对象，适用于同时与多个客户端通信
    public static CopyOnWriteArraySet<WebSocket> webSocketSet = new CopyOnWriteArraySet<WebSocket>();
 
    //与某个客户端的连接会话，通过它实现定向推送(只推送给某个用户)
    private Session session;

    /**
     * 连接建立成功调用的方法
     *
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session){
        this.session = session;
        webSocketSet.add(this); //加入set中
        log.info(Render.renderInfo("有新连接加入！当前在线人数为" + getOnlineCount()));
    }
 
    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session closeSession) {
        webSocketSet.remove(closeSession); //从map中删除
        log.info(Render.renderInfo("有一连接关闭！当前在线人数为" + getOnlineCount()));
    }
 
    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     * @param mySession 可选的参数
     * @throws Exception 
     */
    @OnMessage
    public void onMessage(String message,Session mySession) throws Exception {

        log.info("来自客户端的消息:" + message);

        if (mySession != null) {
            //--------------群发消息(多用于聊天室场景)
            for (WebSocket item : webSocketSet) {
                try {
                    item.sendAllMessage(message);
                } catch (IOException e) {
                    log.warn(Render.renderWarn(e.getMessage()));
                    continue;
                }
            }
        } else {
            //推送给单个客户端
            for (WebSocket item : webSocketSet) {
                if (item.session.equals(mySession)) {
                    try {
                        item.sendMessage(mySession, message);
                        break;
                    } catch (IOException e) {
                        log.warn(Render.renderWarn(e.getMessage()));
                    }
                }
            }
        }
    }
   
 
    //发生错误时调用
    @OnError
    public void onError(Session session, Throwable error) {
        log.warn(Render.renderWarn(error.getMessage()));
    }
 
 
    //给所有客户端发送信息
    public void sendAllMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }
 
    //定向发送信息
    public void sendMessage(Session mySession,String message) throws IOException {
    	synchronized(this) {
    	    try {
                if(mySession.isOpen()){//该session如果已被删除，则不执行发送请求，防止报错
                    mySession.getBasicRemote().sendText(message);
                }
            } catch (IOException e) {
                log.info(Render.renderWarn(e.getMessage()));
            }
    	}
    }
 
    public static int getOnlineCount() {
        return webSocketSet.size();
    }

}