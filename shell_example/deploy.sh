#!/bin/sh

set -m		#防止ssh客户端断了, tomcat挂掉

PATH=`pwd`
PROJECT_NAME='project'
TC_PATH="/opt/tc-server/${PROJECT_NAME}-server"

update_code(){
  if [ -e $PROJECT_NAME ];then
    cd $PROJECT_NAME && svn update --username "xuebin.yang" --password ""
  else
    svn checkout "http://192.168.1.100:81/svn/trunk/${PROJECT_NAME}"
  fi
}

package(){
  cd ${PATH}/${PROJECT_NAME}
  mvn clean package -P test -Dmaven.test.skip=true -f pom.xml
  if [ $? -ne 0 ];then
    echo '打包不成功,请检查svn代码'
    exit 0
  fi
}

deploy(){
  ${TC_PATH}/bin/tcruntime-ctl.sh stop
  rm -rf ${TC_PATH}/webapps/ROOT/
  rm -rf ${TC_PATH}/webapps/ROOT.war.BAK
  mv ${TC_PATH}/webapps/ROOT.war ${TC_PATH}/webapps/ROOT.war.BAK
  cp ${path}/${PROJECT_NAME}/target/ROOT-test.war ${TC_PATH}/webapps/ROOT.war 
  ${TC_PATH}/bin/tcruntime-ctl.sh start &
  tail -f ${TC_PATH}/logs/catalina.out
}

if [ $path != '/home/deploy' ];then
  echo '请到/home/deploy目录下运行'
  exit 0
fi

update_code
package

read -p '是否部署?Y/N' is_deploy
echo "是否部署:$is_deploy"

if [ $is_deploy = "y" ] || [ $is_deploy = "yes" ];then
  deploy
fi
