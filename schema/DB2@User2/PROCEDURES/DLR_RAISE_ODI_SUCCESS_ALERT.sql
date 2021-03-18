--------------------------------------------------------
--  DDL for Procedure DLR_RAISE_ODI_SUCCESS_ALERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "DW"."DLR_RAISE_ODI_SUCCESS_ALERT" (ses_n varchar2,s_name varchar2)
  
IS
msg_to varchar2(2000);
msg_body varchar2(2000);
env_name varchar2(20);
msg_subject varchar2(1000);
msg_from varchar2(50) ;
mailhost VARCHAR2(50) ;
BEGIN
FOR aRow IN (SELECT * FROM dw.w_etl_email_control WHERE task_name =s_name)
loop 
select SUCCESS_NOTIFY_LIST into msg_to from w_etl_email_control where task_name = s_name and notify_on_success = 'Y';
--dbms_output.put_line(msg_to);
SELECT VALUE into env_name FROM  W_ETL_EMAIL_CONFIG WHERE NAME = 'ENV_NAME';
dbms_output.put_line(env_name);
SELECT VALUE into mailhost FROM  W_ETL_EMAIL_CONFIG WHERE NAME = 'EMAIL_HOST';
SELECT VALUE into msg_from FROM  W_ETL_EMAIL_CONFIG WHERE NAME = 'EMAIL_FROM';
select '['||env_name||']:'||' Load Plan '||s_name||' ('||ses_n||') completed successfully' into msg_subject from dual;
--dbms_output.put_line(msg_subject);
select 'Team,'|| chr(10) ||'Load Plan '||s_name||' successfully completed.'|| chr(10) ||'For more details view ODI operator.'|| chr(10) ||'Regards,'|| chr(10) ||'ODI-Support' into msg_body from dual;
--dbms_output.put_line(msg_body);
DLR_SEND_MAIL(msg_to,msg_subject,msg_body,msg_from,mailhost);
end loop;
end;

/

  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_SUCCESS_ALERT" TO "DWSTAGE";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_SUCCESS_ALERT" TO "ODS";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_SUCCESS_ALERT" TO "ODSSTAGE";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_SUCCESS_ALERT" TO "SVC_ODI";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_SUCCESS_ALERT" TO "MSDWPRD";
  GRANT EXECUTE ON "DW"."DLR_RAISE_ODI_SUCCESS_ALERT" TO "DW_RO";
  GRANT DEBUG ON "DW"."DLR_RAISE_ODI_SUCCESS_ALERT" TO "DW_RO";
