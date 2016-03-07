package com.adnature.sport.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adnature.domain.sport.criteria.SportCriteria;
import com.adnature.domain.sport.criteria.SportUserCriteria;
import com.adnature.domain.sport.entity.Sport;
import com.adnature.domain.sport.entity.SportUser;
import com.adnature.domain.sport.query.SportQuery;
import com.adnature.domain.sport.repository.SportRepository;
import com.adnature.domain.sport.repository.SportUserRepository;
import com.adnature.framework.dao.BaseCriteria.Operator;
import com.adnature.framework.util.StringUtils;
import com.adnature.sport.service.SportService;

@Service
public class SportServiceImpl implements SportService{

	@Autowired
	SportRepository sportRepository;
	
	@Autowired
	SportUserRepository sportUserRepository;
	
	@Autowired
	SportQuery sportQuery;
	
	@Override
	public List<Sport> findAll() {
		return sportRepository.findAll();
	}
	
	@Override
	public List<Sport> findByCriteria(SportCriteria criteria) {
		return sportRepository.findByCriteria(criteria);
	}
	
	@Override
	public List<Sport> findSportByUserId(String userId) {
		return sportQuery.findSportByUserId(userId);
	}
	
	@Override
	public void insertSportUser(String[] sportIds, String userId) {
		for(String sportId:sportIds){
			if(!sportId.isEmpty()){
				SportUserCriteria criteria = new SportUserCriteria();
				criteria.setUserId(userId, Operator.equal);
				criteria.setSportId(sportId, Operator.equal);
				List<SportUser> sportUserFlag = sportUserRepository.findByCriteria(criteria);
				if(sportUserFlag==null || sportUserFlag.isEmpty()){
					SportUser sportUser = new SportUser();
					sportUser.setSportId(sportId);
					sportUser.setUserId(userId);
					sportUser.setId(StringUtils.getUUID());
					sportUser.setType("1");
					sportUserRepository.insert(sportUser);
				}
			}
		}
	}
	
	@Override
	public void insertOtherSportUser(String[] sportNames, String userId) {
		for(String sportName:sportNames){
			if(!sportName.isEmpty()){
				SportUserCriteria criteria = new SportUserCriteria();
				criteria.setUserId(userId, Operator.equal);
				criteria.setSportId(sportName, Operator.equal);
				List<SportUser> sportUserFlag = sportUserRepository.findByCriteria(criteria);
				if(sportUserFlag==null || sportUserFlag.isEmpty()){
					SportUser sportUser = new SportUser();
					sportUser.setSportId(sportName.toString());
					sportUser.setUserId(userId);
					sportUser.setId(StringUtils.getUUID());
					sportUser.setType("2");
					sportUserRepository.insert(sportUser);
				}
			}
		}
	}
	
	@Override
	public void deleteSportUser(String[] sportIds, String userId) {
		for(String sportId:sportIds){
			if(!sportId.isEmpty()){
				sportUserRepository.delete(sportId);
			}
		}
	}
	
	@Override
	public void deleteOtherSportUser(String[] sportNames, String userId) {
		for(String sportName:sportNames){
			if(!sportName.isEmpty()){
				SportUserCriteria criteria = new SportUserCriteria();
				criteria.setSportId(sportName, Operator.equal);
				criteria.setUserId(userId, Operator.equal);
				criteria.setType("2", Operator.equal);
				List<SportUser> sportUsers = sportUserRepository.findByCriteria(criteria);
				sportUserRepository.delete(sportUsers.get(0).getId());
			}
		}
	}
	
	@Override
	public void dynamicUpdate(Sport sport) {
		sportRepository.dynamicUpdate(sport);
	}
	
	@Override
	public void insert(Sport sport) {
		sport.setId(StringUtils.getUUID());
		sportRepository.insert(sport);
	}
	
}