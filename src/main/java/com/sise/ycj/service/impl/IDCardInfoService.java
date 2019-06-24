package com.sise.ycj.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.sise.ycj.dao.IDCardInfoDao;
import com.sise.ycj.model.IDCardInfo;
import com.sise.ycj.service.IIDCardInfoService;

@Service("iDCardInfoService")
public class IDCardInfoService implements IIDCardInfoService{

	@Resource
	private IDCardInfoDao iDCardInfoDao;
	
	public void add(IDCardInfo iDCardInfo) {
		iDCardInfoDao.add(iDCardInfo);
	}

	public void delete(String uaccount) {
		iDCardInfoDao.delete(uaccount);
	}

	public void update(IDCardInfo iDCardInfo) {
		iDCardInfoDao.update(iDCardInfo);
	}

	public IDCardInfo load(String uaccount) {
		return iDCardInfoDao.load(uaccount);
	}

	public List<IDCardInfo> load() {
		return iDCardInfoDao.load();
	}
}
