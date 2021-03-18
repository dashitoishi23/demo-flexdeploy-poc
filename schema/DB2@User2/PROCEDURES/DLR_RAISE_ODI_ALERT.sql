--------------------------------------------------------
--  DDL for Procedure DLR_RAISE_ODI_ALERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "DW"."DLR_RAISE_ODI_ALERT" (ses_n varchar2,s_name varchar2,msg_text varchar2)
  
IS
msg_to varchar2(2000);
msg_body varchar2(2000);
env_name varchar2(20);
msg_subject varchar2(1000);
msg_from varchar2(50) ;
mailhost VARCHAR2(50) ;
snw_Add varchar2(50);
snw_flg varchar2(3);
Sess_type varchar2(20);
BEGIN
FOR aRow IN (SELECT * FROM dw.w_etl_email_control WHERE task_name =s_name)
loop 
select failure_notify_list,snow_incident,task_type into msg_to,snw_flg,Sess_type from dw.w_etl_email_control where task_name = s_name and NOTIFY_ON_FAILURE = 'Y';
--dbms_output.put_line(msg_to||snw_flg);
select value into snw_add from dw.W_ETL_EMAIL_CONFIG where name='SNOW_MAIL_ADDRESS';
--dbms_output.put_line(snw);
SELECT VALUE into env_name FROM  dw.W_ETL_EMAIL_CONFIG WHERE NAME = 'ENV_NAME';
--dbms_output.put_line(env_name);
SELECT VALUE into mailhost FROM  dw.W_ETL_EMAIL_CONFIG WHERE NAME = 'EMAIL_HOST';
SELECT VALUE into msg_from FROM  dw.W_ETL_EMAIL_CONFIG WHERE NAME = 'EMAIL_FROM';
--select s_name||' with session no : '||ses_n||' errored out in '||env_name into msg_subject from dual;
select '['||env_name||']:'||' '|| sess_type||' ' ||s_name||' ('||ses_n||') failed' into msg_subject from dual;
dbms_output.put_line(msg_subject);
select 'Team,'|| chr(10) ||'The Session '||s_name||' failed due to:'|| chr(10) ||msg_text|| chr(10) ||'For more details view ODI operator.'|| chr(10) ||'Regards,'|| chr(10) ||'ODI-Support' into msg_body from dual;
--dbms_output.put_line(msg_body);
if snw_flg='Y'
then 
msg_to:=msg_to||','||snw_add;
end if;
--dbms_output.put_line(msg_to);
DLR_SEND_MAIL(msg_to,msg_subject,msg_body,msg_from,mailhost);
end loop;
end;

/

  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_ALERT" TO "DWSTAGE";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_ALERT" TO "ODS";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_ALERT" TO "ODSSTAGE";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_ALERT" TO "SVC_ODI";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_ALERT" TO "MSDWPRD";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_ALERT" TO "DW_RO";
  GRANT DEBUG ON "DW"."DLR_RAISE_ODI_ALERT" TO "DW_RO";
