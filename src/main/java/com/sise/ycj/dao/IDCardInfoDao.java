package com.sise.ycj.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sise.ycj.model.IDCardInfo;

@Repository("iDCardInfoDao")
public class IDCardInfoDao extends BaseDao {

		//添加身份证
		public void add(IDCardInfo iDCardInfo) {
			getSqlSessionTemplate().insert(IDCardInfo.class.getName()+".addIDCardInfo", iDCardInfo);
		}

		//删除身份证
		public void delete(String uaccount) {
			getSqlSessionTemplate().delete(IDCardInfo.class.getName()+".deleteIDCardInfo", uaccount);
		}

		//修改身份证updateUserByAccount
		public void update(IDCardInfo iDCardInfo) {
			getSqlSessionTemplate().update(IDCardInfo.class.getName()+".updateIDCardInfoByUaccount", iDCardInfo);
		}

		//据id查看身份证
		public IDCardInfo load(String uaccount) {
			return (IDCardInfo)getSqlSessionTemplate().selectOne(IDCardInfo.class.getName()+".getIDCardInfoByUaccount", uaccount);
		}
		
		//据账号查找身份证
		public List<IDCardInfo> load() {
			return getSqlSessionTemplate().selectList(IDCardInfo.class.getName()+".getIDCardInfo", "");
		}

	}
