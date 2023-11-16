BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE snack_sequence';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE vote_sequence';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE history_sequence';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE vote';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE history';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE snack';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE member';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/


create table member(
    member_id varchar2(10) primary key ,
    name    varchar2(100)  not null,
    password    varchar2(10) not null,
    vote_flag char(1) not null,
    role varchar2(10) not null
);

create table snack (
    snack_id   number(10) not null,
    name varchar2(100) not null,
    category varchar2(10) not null,
    quantity number(10) not null,
    img_url varchar2(100) not null
);

create table history (
    history_id number(10) not null,
    member_id varchar2(10) not null,
    snack_id number(10) not null,
    time DATE not null,
    count number(10) not null
);

create table vote (
    vote_id number(10) not null,
    member_id varchar2(10) not null,
    snack_id number(10) not null
);

alter table member
    add (
        constraint vote_chk check ( vote_flag in ('Y', 'N') ),
        constraint role_chk check ( role in ('admin', 'student') )
        );

alter table snack
    add (
        constraint snack_pk primary key (snack_id),
        constraint category_chk check ( category in ('����', '����', '����'))
        );

alter table history
    add (
        constraint history_pk primary key (history_id),
        constraint history_fk_member foreign key (member_id) references member(member_id),
        constraint history_fk_snack foreign key (snack_id) references snack(snack_id)
        );

alter table vote
    add (
        constraint vote_pk primary key (vote_id),
        constraint vote_fk_member foreign key (member_id) references member(member_id),
        constraint vote_fk_snack foreign key (snack_id) references snack(snack_id)
        );

create sequence snack_sequence
    start with 1000
    increment by 1
    nocache
    nocycle ;

create sequence vote_sequence
    start with 1000
    increment by 1
    nocache
    nocycle ;

create sequence history_sequence
    start with 1000
    increment by 1
    nocache
    nocycle ;

create or replace trigger snack_on_insert
    before insert on snack
    for each row
    begin
        select snack_sequence.nextval
            into :new.snack_id
        from dual;
    end; 
/

create or replace trigger history_on_insert
    before insert on history
    for each row
    begin
        select history_sequence.nextval
            into :new.history_id
        from dual;
    end; 
/

create or replace trigger vote_on_insert
    before insert on vote
    for each row
    begin
        select vote_sequence.nextval
            into :new.vote_id
        from dual;
    end; 
/

insert into snack (name, category, quantity, img_url) values ('ī��', '����', 5, 'mock_url');
insert into snack (name, category, quantity, img_url) values ('�ķ�������', '����', 7, 'mock_url');
insert into snack (name, category, quantity, img_url) values ('Ʈ�Ѹ�', '����', 10, 'mock_url');

insert into member values  ('cos', '�ֿ켺', '1234', 'N', 'admin');
insert into member values  ('did6436', '�缮��', '1234', 'N', 'student');
insert into member values  ('muscleup15', '�ȱ���', '1234', 'N', 'student');

insert into history (member_id, snack_id, time, count) values ('did6436', 1001, CURRENT_DATE, 15);
insert into history (member_id, snack_id, time, count) values ('did6436', 1002, CURRENT_DATE, 13);
insert into history (member_id, snack_id, time, count) values ('muscleup15', 1000, CURRENT_DATE, 10);
insert into history (member_id, snack_id, time, count) values ('muscleup15', 1001, CURRENT_DATE, 9);

insert into vote (member_id, snack_id) values ('did6436', 1001);
insert into vote (member_id, snack_id) values ('did6436', 1002);
insert into vote (member_id, snack_id) values ('did6436', 1000);
insert into vote (member_id, snack_id) values ('did6436', 1001);

commit;