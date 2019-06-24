package com.sise.ycj.service;

import java.util.List;

import com.sise.ycj.model.IDCardInfo;
public interface IIDCardInfoService {

	// 添加身份证
	public void add(IDCardInfo iDCardInfo);

	// 删除身份证
	public void delete(String uaccount);

	// 修改身份证updateUserByAccount
	public void update(IDCardInfo iDCardInfo);

	// 据id查看身份证
	public IDCardInfo load(String uaccount);

	// 据账号查找身份证
	public List<IDCardInfo> load();

}
