package bitcamp.java87.project01.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import bitcamp.java87.project01.dao.ClsDao;
import bitcamp.java87.project01.dao.CommentDao;
import bitcamp.java87.project01.domain.Cls;
import bitcamp.java87.project01.domain.Cls2;
import bitcamp.java87.project01.domain.Comment;
import bitcamp.java87.project01.domain.Wardrobe;


@Repository("clsDaoImpl")
public class ClsDaoImpl implements ClsDao{

	
	///Field
		@Autowired
		@Qualifier("sqlSessionTemplate")
		private SqlSession sqlSession;
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
	
		
		
	public ClsDaoImpl() {
		System.out.println(this.getClass());
	}



	@Override
	public void addCls(Cls2 cls) throws Exception {
		System.out.println("Dao가냐");
		sqlSession.insert("ClsMapper.addCls",cls);
	}



	@Override
	public List<Cls> getClsList(int userNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ClsMapper.getClsList",userNo);
	}



	@Override
	public void deleteCls(int cls_no) throws Exception {
	 sqlSession.delete("ClsMapper.deleteCls",cls_no);		
	}



	/*@Override
	public Map<String, Object> getClsList(int cls_no) throws Exception {
		List<Object> list = sqlSession.selectList("ClsMapper.getClsList",cls_no);
		 Map<String , Object>  map = new HashMap<String, Object>();
		 map.put("clsList",list);
		return map;
	}*/
	
	
	
}