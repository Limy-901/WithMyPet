package pet.member.service;

import pet.member.vo.MemberVO;


public interface MemberService {

   //ȸ�� ����
   public void join(MemberVO vo) throws Exception;
   
   //�̸��� �ߺ�üũ
   public int mailChk(String email) throws Exception;
   
   //�α���
   public MemberVO login(MemberVO lvo);
   
   //���������� �������� Ȯ��
   public MemberVO mypage(MemberVO lvo);
   
   //ȸ������ ����(�ƴ�)
   public void memberUpdateDo(MemberVO vo) throws Exception;
   
   //�̸��� ã��
   public MemberVO getEmailSearch(String address, String name) throws Exception;
   
   //�̸��Ϲ߼�
   public void sendEmail(MemberVO vo) throws Exception;

   //��й�ȣã��
   public String getpwSearch(String email) throws Exception;
   
   //�н����� ����
   public void pwModify(MemberVO vo) throws Exception;
   
   // ȸ������ ��ü ����
   public void memberModify(MemberVO vo) throws Exception;
   
}