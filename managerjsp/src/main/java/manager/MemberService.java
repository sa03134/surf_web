package manager;

import java.util.List;

public class MemberService {

	private static MemberService instance;
	private MemberDao memberDao;
	
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	public static MemberService getInstance() {
		synchronized(MemberService.class) {
			if(instance == null) {
				instance = new MemberService(MemberDao.getInstance());
			}
		}
		return instance;
	}
	
	//등록하기
	
	public boolean regist(MemberVo vo) {
	
		int ret = memberDao.insertMember(vo);
		if( ret == 1) {
			return true;
		}
		return false;
		
	}
	
	//조회
	 
	public MemberVo read(int num) {
	
		return memberDao.selectMember(num);
	}
	// 전체 조회
	
	public List<MemberVo> listAll() {
		
		return memberDao.selectMemberAll();
	}
	
	//수정
	
	public void edit (MemberVo vo) {
					memberDao.updateMember(vo);
 	}
	
	//탈퇴
	public void remove(int num) {
		memberDao.deleteMember(num);
	}
	 

}
