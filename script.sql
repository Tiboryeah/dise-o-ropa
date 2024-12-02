create table auth_group
(
    id   int auto_increment
        primary key,
    name varchar(150) not null,
    constraint name
        unique (name)
);

create table auth_user
(
    id           int auto_increment
        primary key,
    password     varchar(128) not null,
    last_login   datetime(6)  null,
    is_superuser tinyint(1)   not null,
    username     varchar(150) not null,
    first_name   varchar(150) not null,
    last_name    varchar(150) not null,
    email        varchar(254) not null,
    is_staff     tinyint(1)   not null,
    is_active    tinyint(1)   not null,
    date_joined  datetime(6)  not null,
    constraint username
        unique (username)
);

create table auth_user_groups
(
    id       bigint auto_increment
        primary key,
    user_id  int not null,
    group_id int not null,
    constraint auth_user_groups_user_id_group_id_94350c0c_uniq
        unique (user_id, group_id),
    constraint auth_user_groups_group_id_97559544_fk_auth_group_id
        foreign key (group_id) references auth_group (id),
    constraint auth_user_groups_user_id_6a12ed8b_fk_auth_user_id
        foreign key (user_id) references auth_user (id)
);

create table cuenta
(
    Usuario_ID int auto_increment
        primary key,
    Contrasena varchar(255)         not null,
    Activa     tinyint(1) default 1 null,
    Admin      tinyint(1) default 0 null,
    Usuario    varchar(100)         not null,
    constraint Usuario
        unique (Usuario)
);

create table disenador
(
    Disenador_ID int auto_increment
        primary key,
    Nombre       varchar(255) not null,
    Email        varchar(255) not null,
    Usuario_ID   int          null,
    constraint Email
        unique (Email),
    constraint disenador_ibfk_1
        foreign key (Usuario_ID) references cuenta (Usuario_ID)
);

create index Usuario_ID
    on disenador (Usuario_ID);

create table diseno
(
    Diseno_ID    int auto_increment
        primary key,
    Diseno_name  varchar(255)   not null,
    Diseno_date  date           not null,
    Color        varchar(50)    not null,
    Talla        varchar(50)    not null,
    Precio       decimal(10, 2) not null,
    Prenda_ID    int            null,
    Disenador_ID int            null,
    Imagen_URL   varchar(255)   null,
    constraint diseno_ibfk_2
        foreign key (Disenador_ID) references disenador (Disenador_ID)
);

create index Disenador_ID
    on diseno (Disenador_ID);

create index Prenda_ID
    on diseno (Prenda_ID);

create table django_content_type
(
    id        int auto_increment
        primary key,
    app_label varchar(100) not null,
    model     varchar(100) not null,
    constraint django_content_type_app_label_model_76bd3d3b_uniq
        unique (app_label, model)
);

create table auth_permission
(
    id              int auto_increment
        primary key,
    name            varchar(255) not null,
    content_type_id int          not null,
    codename        varchar(100) not null,
    constraint auth_permission_content_type_id_codename_01ab375a_uniq
        unique (content_type_id, codename),
    constraint auth_permission_content_type_id_2f476e4b_fk_django_co
        foreign key (content_type_id) references django_content_type (id)
);

create table auth_group_permissions
(
    id            bigint auto_increment
        primary key,
    group_id      int not null,
    permission_id int not null,
    constraint auth_group_permissions_group_id_permission_id_0cd325b0_uniq
        unique (group_id, permission_id),
    constraint auth_group_permissio_permission_id_84c5c92e_fk_auth_perm
        foreign key (permission_id) references auth_permission (id),
    constraint auth_group_permissions_group_id_b120cbf9_fk_auth_group_id
        foreign key (group_id) references auth_group (id)
);

create table auth_user_user_permissions
(
    id            bigint auto_increment
        primary key,
    user_id       int not null,
    permission_id int not null,
    constraint auth_user_user_permissions_user_id_permission_id_14a6b632_uniq
        unique (user_id, permission_id),
    constraint auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm
        foreign key (permission_id) references auth_permission (id),
    constraint auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id
        foreign key (user_id) references auth_user (id)
);

create table django_admin_log
(
    id              int auto_increment
        primary key,
    action_time     datetime(6)       not null,
    object_id       longtext          null,
    object_repr     varchar(200)      not null,
    action_flag     smallint unsigned not null,
    change_message  longtext          not null,
    content_type_id int               null,
    user_id         int               not null,
    constraint django_admin_log_content_type_id_c4bce8eb_fk_django_co
        foreign key (content_type_id) references django_content_type (id),
    constraint django_admin_log_user_id_c564eba6_fk_auth_user_id
        foreign key (user_id) references auth_user (id),
    check (`action_flag` >= 0)
);

create table django_migrations
(
    id      bigint auto_increment
        primary key,
    app     varchar(255) not null,
    name    varchar(255) not null,
    applied datetime(6)  not null
);

create table django_session
(
    session_key  varchar(40) not null
        primary key,
    session_data longtext    not null,
    expire_date  datetime(6) not null
);

create index django_session_expire_date_a5c62663
    on django_session (expire_date);

create table tipoprenda
(
    TipoPrenda_ID int auto_increment
        primary key,
    Nombre        varchar(50) not null,
    constraint Nombre
        unique (Nombre)
);

create table prenda
(
    Prenda_ID     int auto_increment
        primary key,
    TipoPrenda_ID int         null,
    Status        varchar(50) not null,
    constraint prenda_ibfk_1
        foreign key (TipoPrenda_ID) references tipoprenda (TipoPrenda_ID)
);

create table disenador_prenda
(
    Disenador_ID int not null,
    Prenda_ID    int not null,
    primary key (Disenador_ID, Prenda_ID),
    constraint disenador_prenda_ibfk_1
        foreign key (Disenador_ID) references disenador (Disenador_ID),
    constraint disenador_prenda_ibfk_2
        foreign key (Prenda_ID) references prenda (Prenda_ID)
);

create index Prenda_ID
    on disenador_prenda (Prenda_ID);

create index TipoPrenda_ID
    on prenda (TipoPrenda_ID);


