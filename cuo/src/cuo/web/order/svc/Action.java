package cuo.web.order.svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cuo.vo.ActionForward;



//�� ��û�� ó���ϴ� ActionŬ���� ��ü���� �԰��� ������ �������̽�
public interface Action {
   public ActionForward execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception;
}