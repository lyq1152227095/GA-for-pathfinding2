主程序为mapcreat 功能是创建地图输入障碍物，起始点信息
creatgen 初始化种群，创建基因序列
cross 杂交
getfitness 获得种群的每个基因序列的适应度，适应度与目标点的距离成反比
mutate 变异 将基因序列变异
pic 画图，画出线路图
selectparent 选择基因序类中最好的两条作为父母




程序主体框架：

初始化参数

初始化种群
while （没到终点）

	计算适应度
	选择父母
	杂交
	变异
end

画图