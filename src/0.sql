.load /home/pi/root/sys/env/tool/sqlite_ext/fts5_mecab.so

begin transaction;

-- FTSテーブル
create virtual table posts using fts5(title, content, tokenize='mecab');
insert into posts values('タイトルです', '本文です。');
insert into posts values('タイトなタイトルです', '本文章は本文です。');
insert into posts values('表題です', 'タイトな本文です。');

-- fts5vocabテーブル
create virtual table posts_row using fts5vocab('posts', 'row');
create virtual table posts_col using fts5vocab('posts', 'col');
create virtual table posts_instance using fts5vocab('posts', 'instance');

commit;

.headers on
.mode column
select * from posts;
select * from posts_row;
select * from posts_col;
select * from posts_instance;

select * from posts('タイト*');

