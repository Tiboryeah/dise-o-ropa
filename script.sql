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


