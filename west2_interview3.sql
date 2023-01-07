#创建学校学籍管理系统数据库
create database if not exists school_database;
use school_database;

#创建班级表
create  table class(
    number int primary key auto_increment comment '班级号',
    name varchar(20) comment '班级名称',
    time date comment '入班报到时间'
)comment '班级';

#创建学生表
create table student(
   id int comment '学号',
   name varchar(10) comment '姓名',
   sex char(1) comment '性别',
   class_number int comment '班级',
   constraint fk_student_class_number foreign key (class_number) references class(number)
)comment '学生';


#向表中添加数据
insert into class values (1,'数媒','2022-8-22'),(2,'自动化','2022-8-11'),(3,'经济','2022-9-13'),(4,'汉语言','2022-8-3');
insert into student values (832211,'小王','男',1),(832221,'小红','女',2),(832222,'小绿','男',2),(832231,'小萌','女',3),(832232,'小刘','男',3),(832241,'无名','男',4),(832233,'老张','男',null);


#查询数据
select student.*,class.name,class.time from student left join class on class_number=class.number;
select class.*,student.* from class left join student on student.class_number=class.number;

#更新信息班级
update class set time='2020-8-11' where number=1;
#更新学生信息
update student set class_number=1 where id=832232 and name='小刘';
#删除学生
delete from student where id=832233 and name='老张';

