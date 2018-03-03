package com.zsy.dwr.service;

import java.util.Collection;

import org.directwebremoting.Browser;
import org.directwebremoting.ScriptBuffer;
import org.directwebremoting.ScriptSession;

public class DwrPush {
	public void send(final String msg) {
		// WebContext webc = WebContextFactory.get();
		Runnable run = new Runnable() {
			ScriptBuffer sb = new ScriptBuffer();

			public void run() {
				Collection<ScriptSession> sessions = Browser.getTargetSessions();

				sb.appendScript("callback(\"");
				sb.appendScript(msg);
				sb.appendScript("\")");
                //遍历每一个ScriptSession
                for (ScriptSession scriptSession : sessions){
                      scriptSession.addScript( sb);
               }
				/*@SuppressWarnings("unchecked")
				Util util = new Util(sessions);
				util.addScript(sb);*/
			}
		};
		 //执行推送
        Browser. withAllSessions(run);
	}
}
