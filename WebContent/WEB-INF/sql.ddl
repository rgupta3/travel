create table EMPLOYEE (ID integer not null, NAME varchar(255), DESIGNATION varchar(255), DEPARTMENT varchar(255), TELEPHONEEXT varchar(255), EMAILID varchar(255), GRADE varchar(255), primary key (ID));
create table HOTELRESV (ID integer not null, PLACE varchar(255), NAME varchar(255), CHECKIN varchar(255), CHECKOUT varchar(255), AMOUNT float, idx integer not null, primary key (ID, idx));
create table REQUESTAPPROVALS (ID integer not null, APPROVORTYPE varchar(255), STATUS varchar(255), REASON varchar(255), idx integer not null, primary key (ID, idx));
create table TRAVELREQUEST (ID integer not null, STATUS varchar(255), AMOUNT float, TYPE varchar(255), PAYMENT varchar(255), DATE datetime, AUTHORISEDEMPMAILID varchar(255), PURPOSE varchar(255), STARTDATE datetime, ENDDATE datetime, RECOMMNDEDEMPMAILID varchar(255), PERDAYALLOWANCE float, DAILYALLOWANCE float, MISCALLOWANCE float, DAYS float, EMPLOYEE_ID integer not null unique, primary key (ID));
create table TRAVELRESV (ID integer not null, TRAVELDATE datetime, TRAVELFROM varchar(255), TRAVELTO varchar(255), MODETYPE varchar(255), CLASSTYPE varchar(255), DEPTIME varchar(255), ARRTIME varchar(255), AMOUNT float, idx integer not null, primary key (ID, idx));
alter table HOTELRESV add index FK975B336ABC78A9B8 (ID), add constraint FK975B336ABC78A9B8 foreign key (ID) references TRAVELREQUEST (ID);
alter table REQUESTAPPROVALS add index FKD6CAC0E1BC78A9B8 (ID), add constraint FKD6CAC0E1BC78A9B8 foreign key (ID) references TRAVELREQUEST (ID);
alter table TRAVELREQUEST add index FKD2083A1512977372 (EMPLOYEE_ID), add constraint FKD2083A1512977372 foreign key (EMPLOYEE_ID) references EMPLOYEE (ID);
alter table TRAVELRESV add index FK459CA9F0BC78A9B8 (ID), add constraint FK459CA9F0BC78A9B8 foreign key (ID) references TRAVELREQUEST (ID);