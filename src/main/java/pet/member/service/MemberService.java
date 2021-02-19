package pet.member.service;

import pet.member.vo.MemberVO;


public interface MemberService {

   //ȸ�� ����
   public void join(MemberVO vo) throws Exception;
   
   //�̸��� �ߺ�üũ
   public int mailChk(MemberVO vo) throws Exception;
   
   //�α���
   public MemberVO login(MemberVO lvo);
   
   //���������� ����Ȯ��
   public MemberVO mypage(MemberVO lvo);
   
   //ȸ������ ����
   public void memberUpdateDo(MemberVO vo) throws Exception;
   
   //���̵� ã��
   public MemberVO emailFind(MemberVO vo) throws Exception;

   //�н����� ã��
   public MemberVO pwFind(MemberVO pvo);
   
   //�н����� ����
   public void pwModify(MemberVO vo) throws Exception;
   
   //ȸ������ ��ü ����
   public void memberModify(MemberVO vo) throws Exception;
      
   
}