package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.ProjectMapper;
import cn.cug.laboratory.mapper.ProjectOrderMapper;
import cn.cug.laboratory.mapper.extend.ProjectExtendMapper;
import cn.cug.laboratory.mapper.extend.ProjectOrderExtendMapper;
import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.extend.ProjectOrderExtend;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.model.persistent.ProjectOrder;
import cn.cug.laboratory.service.ProjectOrderService;
import cn.cug.laboratory.utils.DBUtils;
import cn.cug.laboratory.utils.RetuValueClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by PP on 2016/5/23.
 */

@Service
public class ProjectOrderServiceImpl implements ProjectOrderService {

    @Autowired
    private ProjectOrderExtendMapper projectOrderMapper;
    @Autowired
    private ProjectExtendMapper projectMapper;


    public void insert(String proId,String stuId,Float score) {
        DBUtils dbUtils=new DBUtils();
        String lastID=projectOrderMapper.selectLastId();
        String ID=dbUtils.StringAddOne(lastID);
        ProjectOrder projectOrder=new ProjectOrderExtend(ID,proId,stuId,score);
        projectOrderMapper.insert(projectOrder);

        //Project相对应的余量也要减1
        projectMapper.reduceLeft(proId);
    }

    public RetuValueClass<ProjectOrder> selectByStuId(String stuId, int pageNo, int pageNum){
        int startSite=(pageNo-1)*pageNum;
        List<ProjectOrder> projectOrderList=projectOrderMapper.selectByStuId(stuId,pageNo,pageNum);
        int projectOrderCount=projectOrderMapper.selectCountByStuId(stuId);
        return new RetuValueClass<ProjectOrder>(projectOrderList,projectOrderCount);
    }

    public void delete(String proOrderId){
        String proId=projectOrderMapper.selectByPrimaryKey(proOrderId).getProId();
//        System.out.println(proId);

        Date todayDate=new Date();
        System.out.println(todayDate);

        Project project=projectMapper.selectByPrimaryKey(proId);
        Date startTime=project.getStartTime();
        //System.out.println(startTime);

        if(todayDate.after(startTime)) return;
        projectOrderMapper.deleteByPrimaryKey(proOrderId);
        projectMapper.addLeft(proId);
    }

    public RetuValueClass<ProjectOrder> selectScore(String stuId, int pageNo, int pageNum){
        int startSite=(pageNo-1)*pageNum;
        List<ProjectOrder> projectOrderList=projectOrderMapper.selectByStuId(stuId,pageNo,pageNum);
        Iterator<ProjectOrder> it=projectOrderList.iterator();
        while(it.hasNext()){
            if(it.next().getScore()==0)
                it.remove();
        }

        int projectOrderCount=projectOrderList.size();
        return new RetuValueClass<ProjectOrder>(projectOrderList,projectOrderCount);
    }
}
