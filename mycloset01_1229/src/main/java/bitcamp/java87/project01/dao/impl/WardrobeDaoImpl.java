package bitcamp.java87.project01.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import bitcamp.java87.project01.dao.WardrobeDao;
import bitcamp.java87.project01.domain.Wardrobe;

@Repository("wardrobeDaoImpl")
public class WardrobeDaoImpl implements WardrobeDao {

  /// Field
  @Autowired
  @Qualifier("sqlSessionTemplate")
  private SqlSession sqlSession;

  public void setSqlSession(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
  }

  /// Constructor
  public WardrobeDaoImpl() {
    System.out.println("[wardrobeDao] ::: default Constructor ::: " + this.getClass());
  }

  /// Method
  public void addWardrobe(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: addWardrobe");
    sqlSession.insert("WardrobeMapper.addWardrobe", wardrobe);
  }

  public Wardrobe getWardrobe(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: getWardrobe");
    return sqlSession.selectOne("WardrobeMapper.getWardrobeByUserNo", wardrobe);
  }
  
  public Wardrobe getWardrobe(int cls_no) throws Exception {
    System.out.println("[wardrobeDao] ::: getWardrobe");
    return sqlSession.selectOne("WardrobeMapper.getWardrobeByClsNo", cls_no);
  }

  public List<Wardrobe> getWardrobeList(int user_no) throws Exception {
    System.out.println("[wardrobeDao] ::: getWardrobeList");
    return sqlSession.selectList("WardrobeMapper.getWardrobeList", user_no);
  }

  public void updateWardrobe(Wardrobe wardrobe) throws Exception {
    System.out.println("[wardrobeDao] ::: updateWardrobe");
    sqlSession.update("WardrobeMapper.updateWardrobe", wardrobe);
  }

  public void deleteWardrobe(int cls_no) throws Exception {
    System.out.println("[wardrobeDao] ::: deleteWardrobe");
    sqlSession.delete("WardrobeMapper.deleteWardrobe", cls_no);
  }

}
