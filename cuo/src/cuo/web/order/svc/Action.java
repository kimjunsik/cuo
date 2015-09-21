package cuo.web.order.svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.vo.ActionForward;



//각 요청을 처리하는 Action클래스 객체들의 규격을 정의한 인터페이스
public interface Action {
   public ActionForward execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception;
}