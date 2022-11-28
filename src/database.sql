--database creation
create database "$classmate"
    with
    owner = admin
    encoding = 'UTF8'
    lc_collate = 'fr_FR.UTF-8'
    lc_ctype = 'fr_FR.UTF-8'
    tablespace = pg_default
    connection limit = -1
    is_template = False;

--use database: $fullexam    
SELECT session_user, current_database();

--users_roles
drop table if exists public.users_roles;
create table public.users_roles (
    role_id serial primary key,
    role_name varchar(255) unique not null default 'Student'
);
--roles_permissions
drop table if exists public.roles_permissions;
create table public.roles_permissions (
    permission_id serial primary key,
    permission_name varchar(255) unique not null,
    permission_description varchar(255) not null,
    permission_code varchar(255) not null
);

--roles_give_permissions
drop table if exists public.roles_give_permissions;
create table public.roles_give_permissions (
    role_id serial not null,
    permission_id serial not null,
    constraint given_access primary key (role_id, permission_id),
    constraint user_role foreign key (role_id) references public.users_roles match simple on delete cascade on update cascade not valid,
    constraint role_permission foreign key (permission_id) references public.roles_permissions match simple on delete cascade on update cascade not valid
);
-- users table
drop table if exists public.users;
create table public.users (
    user_id serial primary key,
    email varchar(255) unique not null,
    password varchar(255) not null,
    user_role serial not null,
    created_at date default current_date,
    user_status varchar(255) not null default 'unactive',
    user_reglement boolean not null default false,
    constraint access foreign key (user_role) references public.users_roles (role_id) on delete cascade on update cascade  
);

--school_levels
drop table if exists public.school_levels;
create table public.school_levels (
    level_id serial primary key,
    level_name varchar(255) not null,
    level_cursus varchar(255) not null
);
--users_addresses
drop table if exists users_addresses;
create table users_addresses (
    address_id serial primary key,
    country_name varchar(255) not null,
    town_name varchar(255) not null,
    phone_number varchar(255) not null,
    quater_name varchar(255) not null
);
--users_profiles table
drop table if exists public.users_profiles;
create table public.users_profiles (
    profile_id serial primary key,
    owner_id serial not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    born_date date not null,
    owner_level serial not null,
    owner_address serial not null,
    owner_language varchar(255) not null default 'French',
    school_level_id integer not null,
    owner_profile_image varchar(255) not null default 'defaultavatar',
    constraint owner foreign key (owner_id) references public.users (user_id) on delete cascade on update cascade,
    constraint level foreign key (owner_level) references public.school_levels (level_id) on delete cascade on update cascade,
    constraint residence foreign key (owner_address) references public.users_addresses (address_id) on delete cascade on update cascade
);

--shool_maters
drop table if exists public.school_subjects;
create table public.school_subjects (
    subject_id serial primary key,
    subject_name varchar(255) unique not null
);

--mater_categories
drop table if exists public.subjects_categories;
create table public.subjects_categories (
    category_id serial primary key,
    category_name varchar(255) unique not null
);
--subjects_in_categories
drop table if exists public.subjects_in_categories;
create table public.subjects_in_categories (
    subject_id serial not null,
    category_id serial not null,
    constraint categories_courses primary key (subject_id, category_id),
    constraint subjectin foreign key (subject_id) references public.school_subjects match simple on delete cascade on update cascade not valid,
    constraint writer1 foreign key (category_id) references public.subjects_categories match simple on delete cascade on update cascade not valid
);
--user_courses
drop table if exists public.user_courses;
create table public.user_courses (
    course_id serial primary key,
    owner_id serial not null,
    course_name varchar(255) not null,
    created_at date not null default now(),
    course_directory varchar not null,
    course_type varchar not null default 'Paid',
    course_price decimal(10,2) not null default 1000.00,
    course_access_password varchar(255) not null default '12345'
);

--course_lessons
drop table if exists public.course_lessons;
create table public.course_lessons (
    lesson_id serial primary key,
    lessson_name varchar(255) not null,
    lesson_directory varchar not null,
    lesson_video_link varchar(255) not null,
    lesson_type varchar(255) not null default 'Paid',
    lesson_price decimal(10,2) not null default 50.00,
    lesson_access_password varchar(255) not null default '12345',
    created_at date not null default now()
);

--coures_contains_lessons
drop table if exists public.coures_contains_lessons;
create table public.coures_contains_lessons (
    course_id serial not null,
    lesson_id serial not null,
    added_at date not null default now(),
    lesson_status varchar (255) not null default 'active',
    constraint lesson_in_course primary key (course_id, lesson_id),
    constraint container foreign key (course_id) references public.user_courses match simple on delete cascade on update cascade not valid,
    constraint content foreign key (lesson_id) references public.course_lessons match simple on delete cascade on update cascade not valid
);

--users_learn_courses
drop table if exists public.users_learn_courses;
create table public.users_learn_courses (
    user_id serial not null,
    course_id serial not null,
    started_at date not null default now(),
    last_lecture_date date not null default now(),
    progression_level integer not null default 1,
    ended_at date,
    constraint user_learn primary key (user_id, course_id),
    constraint course foreign key (course_id) references public.user_courses match simple on delete cascade on update cascade not valid,
    constraint student foreign key (course_id) references public.user_courses match simple on delete cascade on update cascade not valid
);
--users_write_courses
drop table if exists public.users_write_courses;
create table public.users_write_courses (
    user_id serial not null,
    course_id serial not null,
    started_at date not null default now(),
    ended_at date,
    published_at date,
    constraint writers primary key (user_id, course_id),
    constraint writer1 foreign key (course_id) references public.user_courses match simple on delete cascade on update cascade not valid,
    constraint writer2 foreign key (course_id) references public.user_courses match simple on delete cascade on update cascade not valid
);

alter table if exists public.users_roles owner to admin;
alter table if exists public.roles_permissions owner to admin;
alter table if exists public.roles_give_permissions owner to admin;
alter table if exists public.users owner to admin;
alter table if exists public.school_levels owner to admin;
alter table if exists public.users_addresses owner to admin;
alter table if exists public.users_profiles owner to admin;
alter table if exists public.school_subjects owner to admin;
alter table if exists public.subjects_categories owner to admin;
alter table if exists public.subjects_in_categories owner to admin;
alter table if exists public.user_courses owner to admin;
alter table if exists public.course_lessons owner to admin;
alter table if exists public.coures_contains_lessons owner to admin;
alter table if exists public.users_learn_courses owner to admin;
alter table if exists public.users_write_courses owner to admin;
