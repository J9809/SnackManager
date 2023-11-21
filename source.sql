-- BEGIN
--     EXECUTE IMMEDIATE 'DROP SEQUENCE snack_sequence';
-- EXCEPTION
--     WHEN OTHERS THEN
--         NULL;
-- END;
-- /

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
                       snack_id   number(20) not null,
                       name varchar2(256) not null,
                       category varchar2(10) not null,
                       price number(10) not null,
                       brand varchar2(256),
                       quantity number(10) not null,
                       img_url varchar2(256) not null,
                       link varchar2(256) not null
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
        constraint category_chk check ( category in ('과자', '젤리', '음료'))
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

-- create sequence snack_sequence
--     start with 1000
--     increment by 1
--     nocache
--     nocycle ;

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

-- create or replace trigger snack_on_insert
--     before insert on snack
--     for each row
-- begin
--     select snack_sequence.nextval
--     into :new.snack_id
--     from dual;
-- end;
-- /

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

-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('카누', '음료', 1000, '카누', 5, 'https://shopping-phinf.pstatic.net/main_1210737/12107376356.20210127164940.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('카스타드', '과자', 2000, '오리온', 7, 'https://shopping-phinf.pstatic.net/main_1058914/10589149703.20161212165221.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('하리보', '젤리', 700, '하리보', 10, 'https://shopping-phinf.pstatic.net/main_4137396/41373960781.20230723170911.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('포스틱', '과자', 800, '농심', 20, 'https://shopping-phinf.pstatic.net/main_1005319/10053198451.20160923143449.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('빼빼로', '과자', 1200, '롯데', 15, 'https://shopping-phinf.pstatic.net/main_2421250/24212502522.20200921105652.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('홈런볼', '과자', 1300, '해태', 20, 'https://shopping-phinf.pstatic.net/main_5715102/5715102162.20220805140656.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('화이트하임', '과자', 2900, '크라운제과', 20, 'https://shopping-phinf.pstatic.net/main_8392815/8392815969.20210624121423.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('예감', '과자', 850, '오리온', 20, 'https://shopping-phinf.pstatic.net/main_2243410/22434108684.20200409143341.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('후렌치파이 사과', '과자', 1980, '해태', 20, 'https://shopping-phinf.pstatic.net/main_5741707/5741707059.20130319113704.jpg', 'mock_link');
-- insert into snack (name, category, price, brand, quantity, img_url, link) values ('새우깡 대용량 지퍼백', '과자', 3880, '농심', 20, 'https://shopping-phinf.pstatic.net/main_8226381/82263818665.4.jpg', 'mock_link');


insert into member values  ('cos', '최우성', '1234', 'N', 'admin');
insert into member values  ('did6436', '양석현', '1234', 'N', 'student');
insert into member values  ('muscleup15', '안광휘', '1234', 'N', 'student');

-- insert into history (member_id, snack_id, time, count) values ('did6436', 1001, CURRENT_DATE, 15);
-- insert into history (member_id, snack_id, time, count) values ('did6436', 1002, CURRENT_DATE, 13);
-- insert into history (member_id, snack_id, time, count) values ('muscleup15', 1000, CURRENT_DATE, 10);
-- insert into history (member_id, snack_id, time, count) values ('muscleup15', 1001, CURRENT_DATE, 9);

-- insert into vote (member_id, snack_id) values ('did6436', 1001);
-- insert into vote (member_id, snack_id) values ('did6436', 1002);
-- insert into vote (member_id, snack_id) values ('did6436', 1000);
-- insert into vote (member_id, snack_id) values ('did6436', 1001);

commit;