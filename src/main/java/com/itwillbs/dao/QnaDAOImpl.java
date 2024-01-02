package com.itwillbs.dao;

import com.itwillbs.domain.QnaDTO;
import com.itwillbs.domain.QpPageDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;


@Repository
public class QnaDAOImpl implements QnaDAO{		//CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

		//마이바티스 자동 객체생성
		@Inject
		private SqlSession sqlSession;
		
		
		//sql구문이름
		private static final String namespace = "com.itwillbs.mappers.qnaMapper";
		
		
		@Override
		public void qnaInsert(QnaDTO qnaDto) {
			sqlSession.insert(namespace + ".qnaInsert", qnaDto);
		}
		

		@Override
		public Integer getMaxNum() {
			return sqlSession.selectOne(namespace + ".getMaxNum");
		}

		
		@Override
		public List<QnaDTO> getQnaList(QpPageDTO pageDto) {
			return sqlSession.selectList(namespace + ".getQnaList", pageDto);
		}

		
		@Override
		public int getQnaCount() {
			return sqlSession.selectOne(namespace + ".getQnaCount");
		}

		
		@Override
		public void updateReadCount(int qnaNum) {
			sqlSession.selectOne(namespace + ".updateReadCount", qnaNum);
		}

		
		@Override
		public QnaDTO getQna(int qnaNum) {
			return sqlSession.selectOne(namespace + ".getQna", qnaNum);
		}


		@Override
		public QnaDTO getQnaName(String qnaName) {
			return sqlSession.selectOne(namespace + ".getQnaName", qnaName);
		}
		
		
		@Override
		public QnaDTO getQnaName() {
			return sqlSession.selectOne(namespace + ".getQnaName");
		}

		
		@Override		//수정				GG
		public void qnaUpdate(QnaDTO qnaDto) {
			sqlSession.selectOne(namespace + ".qnaUpdate", qnaDto);
		}

		
		@Override		//삭제				GG
		public void qnaDelete(int qnaNum) {
			sqlSession.delete(namespace + ".qnaDelete", qnaNum);
		}
		
		
		@Override		// \ㅇ0ㅇ/
		public void ReQnaUpdateSeq(QnaDTO qnaDto) {
			sqlSession.update(namespace + ".ReQnaUpdateSeq", qnaDto);
		}


//		@Override		// \ㅇ0ㅇ/
//		public void getReQnaList(QnaDTO qnaDto) {
//			sqlSession.insert(namespace + ".getReQnaList", qnaDto);
//		}
		
		
//		@Override
//		public void updateHitCount(int qnaNum) {
//			sqlSession.selectOne(namespace + ".updateHitCount", qnaNum);
//		}
		
		
}		//CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
