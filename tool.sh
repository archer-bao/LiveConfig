#参数判断，需要一个配置文件
if [ $# != 1 ]; then
	echo "配置文件参数指定错误"
	exit -1
fi

APPCONF=$1

echo "指定的配置文件为：$APPCONF"

#临时脚本文件是否上次残留存在
if [ -f /tmp/temp.sh ]; 
	then
		rm temp.sh
	fi

#读取源配置文件
for i in $(cat $APPCONF);
	do
		#构造临时脚本文件
		echo "echo $i" >> /tmp/temp.sh
	done

#获取目录名
dirPath=`dirname $APPCONF`

#执行临时脚本文件,利用脚本读取环境变量生成目标配置文件
bash /tmp/temp.sh > "$dirPath/app2.conf"

#删除临时脚本文件
rm /tmp/temp.sh 

exit 0
