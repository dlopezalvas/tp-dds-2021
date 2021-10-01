
    create table Asociacion (
        id bigint generated by default as identity (start with 1),
        nombre varchar(255),
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        primary key (id)
    )

    create table CaracteristicaDefinida (
        tipo varchar(31) not null,
        id bigint generated by default as identity (start with 1),
        nombre varchar(255),
        valor varchar(255),
        publicacionMascotaEnAdopcionId bigint,
        publicacionIntencionDeAdopcionComodidad_Id bigint,
        publicacionIntencionDeAdopcionCaracteristica_Id bigint,
        mascota_id bigint,
        primary key (id)
    )

    create table CaracteristicaIdeal (
        id bigint not null,
        esObligatoria boolean,
        nombre varchar(255),
        tipoCaracteristica_id bigint,
        primary key (id)
    )

    create table ComodidadIdeal (
        id bigint not null,
        esObligatoria boolean,
        nombre varchar(255),
        tipoCaracteristica_id bigint,
        preguntaAdoptante varchar(255),
        preguntaDuenio varchar(255),
        AsociacionId bigint,
        primary key (id)
    )

    create table EnumeradaIdeal_opciones (
        EnumeradaIdeal_id bigint not null,
        opciones varchar(255)
    )

    create table HogarDeTransito (
        id bigint generated by default as identity (start with 1),
        Capacidad integer not null,
        lugaresDisponibles integer not null,
        nombre varchar(255),
        telefono varchar(255),
        tienePatio boolean,
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        primary key (id)
    )

    create table HogarDeTransito_animalesAdmitidos (
        HogarDeTransito_id bigint not null,
        animalesAdmitidos integer
    )

    create table HogarDeTransito_conductasAdmitidas (
        HogarDeTransito_id bigint not null,
        conductasAdmitidas varchar(255)
    )

    create table Mascota (
        id bigint generated by default as identity (start with 1),
        apodo varchar(255),
        descripcionFisica varchar(255),
        edad integer not null,
        id_mascota varchar(255),
        nombre varchar(255),
        sexo integer,
        tamanio integer,
        tipoAnimal integer,
        DuenioId bigint,
        primary key (id)
    )

    create table Mascota_fotos (
        Mascota_id bigint not null,
        fotos varchar(255)
    )

    create table PublicacionIntencionDeAdopcion (
        id bigint generated by default as identity (start with 1),
        linkDeBaja varchar(255),
        sexoMascota integer,
        tamanioMascota integer,
        tipoAnimal integer,
        DuenioId bigint,
        AsociacionId bigint,
        primary key (id)
    )

    create table PublicacionMascotaEnAdopcion (
        id bigint generated by default as identity (start with 1),
        numeroPublicacion varchar(255),
        mascotaId bigint,
        AsociacionId bigint,
        primary key (id)
    )

    create table RescateDeMascotaRegistrada (
        id bigint not null,
        descripcion varchar(255),
        fecha varbinary(255),
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        rescatista_id bigint,
        mascota_id bigint,
        AsociacionId bigint,
        primary key (id)
    )

    create table RescateDeMascotaSinRegistrar (
        id bigint not null,
        descripcion varchar(255),
        fecha varbinary(255),
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        rescatista_id bigint,
        estadoDeAprobacion boolean not null,
        numeroIdentificatorio integer,
        tamanio integer,
        tipoAnimal integer,
        duenio_id bigint,
        caracteristicaDefinida_id bigint,
        AsociacionId bigint,
        primary key (id)
    )

    create table RescateDeMascota_fotos (
        RescateDeMascota_id bigint not null,
        fotos varchar(255)
    )

    create table TipoCaracteristica (
        tipo varchar(31) not null,
        id bigint generated by default as identity (start with 1),
        primary key (id)
    )

    create table Voluntario (
        id bigint generated by default as identity (start with 1),
        Asociacion_id bigint,
        Usuario_Id bigint,
        primary key (id)
    )

    create table contacto (
        id bigint generated by default as identity (start with 1),
        apellido varchar(255),
        email varchar(255),
        nombre varchar(255),
        telefono integer,
        duenioId bigint,
        rescatistaId bigint,
        primary key (id)
    )

    create table duenio (
        id bigint generated by default as identity (start with 1),
        apellido varchar(255),
        documento double,
        fecha_nacimiento varbinary(255),
        nombre varchar(255),
        tipo_documento integer,
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        contactoPrincipal_id bigint,
        usuarioId bigint,
        primary key (id)
    )

    create table rescatista (
        id bigint generated by default as identity (start with 1),
        apellido varchar(255),
        direccion varchar(255),
        fecha_nacimiento varbinary(255),
        nombre varchar(255),
        tipo_documento integer,
        contactoPrincipal_id bigint,
        primary key (id)
    )

    create table usuario (
        id bigint generated by default as identity (start with 1),
        hash blob(255),
        salt blob(255),
        nombreUsuario varchar(255),
        primary key (id)
    )

    create table validaciones (
        tipo varchar(31) not null,
        id bigint generated by default as identity (start with 1),
        nombre_archivo varchar(255),
        primary key (id)
    )

    alter table CaracteristicaDefinida 
        add constraint FK_kajc02geyf6ce6w83dq0ms3r7 
        foreign key (publicacionMascotaEnAdopcionId) 
        references PublicacionMascotaEnAdopcion

    alter table CaracteristicaDefinida 
        add constraint FK_l0gw9giis82yq25fsb2tw6t76 
        foreign key (publicacionIntencionDeAdopcionComodidad_Id) 
        references PublicacionIntencionDeAdopcion

    alter table CaracteristicaDefinida 
        add constraint FK_ahjijusvjrjynksxvercso8mw 
        foreign key (publicacionIntencionDeAdopcionCaracteristica_Id) 
        references PublicacionIntencionDeAdopcion

    alter table CaracteristicaDefinida 
        add constraint FK_adadgmnr0v7y7msjq0kgajadb 
        foreign key (mascota_id) 
        references Mascota

    alter table CaracteristicaIdeal 
        add constraint FK_t86mu87n74aubokbnqgd9vk0t 
        foreign key (tipoCaracteristica_id) 
        references TipoCaracteristica

    alter table ComodidadIdeal 
        add constraint FK_hl4jiwi4bwdq15mpa6yd79g3f 
        foreign key (AsociacionId) 
        references Asociacion

    alter table ComodidadIdeal 
        add constraint FK_thla7san2837j8j0bdu02o4v3 
        foreign key (tipoCaracteristica_id) 
        references TipoCaracteristica

    alter table EnumeradaIdeal_opciones 
        add constraint FK_7lycml39jvd1ru1hw61ajfk8k 
        foreign key (EnumeradaIdeal_id) 
        references TipoCaracteristica

    alter table HogarDeTransito_animalesAdmitidos 
        add constraint FK_trvs3oov0d7nptnh94tudc00w 
        foreign key (HogarDeTransito_id) 
        references HogarDeTransito

    alter table HogarDeTransito_conductasAdmitidas 
        add constraint FK_tkuidne7dwwixdwqpip8545mj 
        foreign key (HogarDeTransito_id) 
        references HogarDeTransito

    alter table Mascota 
        add constraint FK_jcn1wwlnqwb85aqrj2hs7su10 
        foreign key (DuenioId) 
        references duenio

    alter table Mascota_fotos 
        add constraint FK_dclevnore3slbildn3hia9nlo 
        foreign key (Mascota_id) 
        references Mascota

    alter table PublicacionIntencionDeAdopcion 
        add constraint FK_1nog4j7vouvwg25qfu87e5foo 
        foreign key (DuenioId) 
        references duenio

    alter table PublicacionIntencionDeAdopcion 
        add constraint FK_m1atgn01to98ydn4w9r1jyh3w 
        foreign key (AsociacionId) 
        references Asociacion

    alter table PublicacionMascotaEnAdopcion 
        add constraint FK_tm8ormb83asm4bl8voo6fcs4s 
        foreign key (mascotaId) 
        references Mascota

    alter table PublicacionMascotaEnAdopcion 
        add constraint FK_84c42sgopxc7e5fbj994m9mb0 
        foreign key (AsociacionId) 
        references Asociacion

    alter table RescateDeMascotaRegistrada 
        add constraint FK_9x5q4kd42xsn653v6nlv3g13l 
        foreign key (mascota_id) 
        references Mascota

    alter table RescateDeMascotaRegistrada 
        add constraint FK_hufufkol725fnaf6m63ucq53l 
        foreign key (AsociacionId) 
        references Asociacion

    alter table RescateDeMascotaRegistrada 
        add constraint FK_21wml0crcq69f8ru9wlsh5364 
        foreign key (rescatista_id) 
        references rescatista

    alter table RescateDeMascotaSinRegistrar 
        add constraint FK_3lps7l5xii2b29lh4xama3vjj 
        foreign key (duenio_id) 
        references duenio

    alter table RescateDeMascotaSinRegistrar 
        add constraint FK_s2x0k5na98251otytiiaxgyww 
        foreign key (caracteristicaDefinida_id) 
        references CaracteristicaDefinida

    alter table RescateDeMascotaSinRegistrar 
        add constraint FK_3qfg7cyb3m8f9qyrxax0vkyjy 
        foreign key (AsociacionId) 
        references Asociacion

    alter table RescateDeMascotaSinRegistrar 
        add constraint FK_lsnkbds3ugmd62k7mmvhdncf1 
        foreign key (rescatista_id) 
        references rescatista

    alter table Voluntario 
        add constraint FK_elh1fu4oewfjf4mdjbo252cce 
        foreign key (Asociacion_id) 
        references Asociacion

    alter table Voluntario 
        add constraint FK_1j9h1g9t2989715w238042ynt 
        foreign key (Usuario_Id) 
        references usuario

    alter table contacto 
        add constraint FK_ruava120cqs11gxul97an2g5c 
        foreign key (duenioId) 
        references duenio

    alter table contacto 
        add constraint FK_odj5b4yqkjek8cuk0pbcs3hhv 
        foreign key (rescatistaId) 
        references rescatista

    alter table duenio 
        add constraint FK_eulo1elbe5cvp5dvf9pk6vhkf 
        foreign key (contactoPrincipal_id) 
        references contacto

    alter table duenio 
        add constraint FK_owu8gniehh19poog05lte4l6y 
        foreign key (usuarioId) 
        references usuario

    alter table rescatista 
        add constraint FK_skfoy7m7pwb33ve2olfped0lq 
        foreign key (contactoPrincipal_id) 
        references contacto

    create table hibernate_sequences (
         sequence_name varchar(255),
         sequence_next_hi_value integer 
    )
