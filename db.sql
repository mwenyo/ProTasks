PGDMP         ;    
        
    v            protasks    10.5    10.5 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16393    protasks    DATABASE     �   CREATE DATABASE protasks WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE protasks;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16709    atividades_atividade    TABLE     �  CREATE TABLE public.atividades_atividade (
    id integer NOT NULL,
    disciplina character varying(200) NOT NULL,
    atividade character varying(200) NOT NULL,
    data_cadastro timestamp with time zone NOT NULL,
    data_modificacao timestamp with time zone NOT NULL,
    data_entrega timestamp with time zone NOT NULL,
    valor numeric(4,2) NOT NULL,
    observacoes text NOT NULL,
    aluno_id integer NOT NULL,
    turma_id integer NOT NULL
);
 (   DROP TABLE public.atividades_atividade;
       public         postgres    false    3            �            1259    16707    atividades_atividade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_atividade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.atividades_atividade_id_seq;
       public       postgres    false    3    220            �           0    0    atividades_atividade_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.atividades_atividade_id_seq OWNED BY public.atividades_atividade.id;
            public       postgres    false    219            �            1259    16720    atividades_comentario    TABLE       CREATE TABLE public.atividades_comentario (
    id integer NOT NULL,
    comentario text NOT NULL,
    data_comentario timestamp with time zone NOT NULL,
    data_modificacao timestamp with time zone NOT NULL,
    aluno_id integer NOT NULL,
    atividade_id integer NOT NULL
);
 )   DROP TABLE public.atividades_comentario;
       public         postgres    false    3            �            1259    16718    atividades_comentario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_comentario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.atividades_comentario_id_seq;
       public       postgres    false    222    3            �           0    0    atividades_comentario_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.atividades_comentario_id_seq OWNED BY public.atividades_comentario.id;
            public       postgres    false    221            �            1259    16731    atividades_notificacao    TABLE     �   CREATE TABLE public.atividades_notificacao (
    id integer NOT NULL,
    texto character varying(200) NOT NULL,
    visualizada boolean NOT NULL,
    prioridade_id integer NOT NULL
);
 *   DROP TABLE public.atividades_notificacao;
       public         postgres    false    3            �            1259    16729    atividades_notificacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_notificacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.atividades_notificacao_id_seq;
       public       postgres    false    3    224            �           0    0    atividades_notificacao_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.atividades_notificacao_id_seq OWNED BY public.atividades_notificacao.id;
            public       postgres    false    223            �            1259    16739    atividades_prioridade    TABLE     �   CREATE TABLE public.atividades_prioridade (
    id integer NOT NULL,
    aluno_id integer NOT NULL,
    atividade_id integer NOT NULL
);
 )   DROP TABLE public.atividades_prioridade;
       public         postgres    false    3            �            1259    16737    atividades_prioridade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.atividades_prioridade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.atividades_prioridade_id_seq;
       public       postgres    false    3    226            �           0    0    atividades_prioridade_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.atividades_prioridade_id_seq OWNED BY public.atividades_prioridade.id;
            public       postgres    false    225            �            1259    16425 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    16423    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    203    3            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    202            �            1259    16435    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    16433    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    3    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    204            �            1259    16417    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    16415    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    3    201            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    200            �            1259    16443 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false    3            �            1259    16453    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    3            �            1259    16451    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    209    3            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    208            �            1259    16441    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    3    207            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    206            �            1259    16461    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    3            �            1259    16459 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    211    3            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    210            �            1259    16521    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    3            �            1259    16519    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    3    213            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    212            �            1259    16407    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    16405    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    199    3            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    198            �            1259    16396    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    16394    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    197    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    196            �            1259    16549    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    16651    turmas_alunoemturma    TABLE     �   CREATE TABLE public.turmas_alunoemturma (
    id integer NOT NULL,
    data_cadastro timestamp with time zone NOT NULL,
    aluno_id integer NOT NULL,
    turma_id integer NOT NULL
);
 '   DROP TABLE public.turmas_alunoemturma;
       public         postgres    false    3            �            1259    16649    turmas_alunoemturma_id_seq    SEQUENCE     �   CREATE SEQUENCE public.turmas_alunoemturma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.turmas_alunoemturma_id_seq;
       public       postgres    false    3    218            �           0    0    turmas_alunoemturma_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.turmas_alunoemturma_id_seq OWNED BY public.turmas_alunoemturma.id;
            public       postgres    false    217            �            1259    16561    turmas_turma    TABLE     �  CREATE TABLE public.turmas_turma (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    codigo character varying(200),
    curso character varying(200) NOT NULL,
    ano integer NOT NULL,
    turno character varying(200) NOT NULL,
    aluno_id integer NOT NULL,
    data_cadastro timestamp with time zone NOT NULL,
    CONSTRAINT turmas_turma_ano_check CHECK ((ano >= 0))
);
     DROP TABLE public.turmas_turma;
       public         postgres    false    3            �            1259    16559    turmas_turma_id_seq    SEQUENCE     �   CREATE SEQUENCE public.turmas_turma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.turmas_turma_id_seq;
       public       postgres    false    3    216            �           0    0    turmas_turma_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.turmas_turma_id_seq OWNED BY public.turmas_turma.id;
            public       postgres    false    215            �
           2604    16712    atividades_atividade id    DEFAULT     �   ALTER TABLE ONLY public.atividades_atividade ALTER COLUMN id SET DEFAULT nextval('public.atividades_atividade_id_seq'::regclass);
 F   ALTER TABLE public.atividades_atividade ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    220    220            �
           2604    16723    atividades_comentario id    DEFAULT     �   ALTER TABLE ONLY public.atividades_comentario ALTER COLUMN id SET DEFAULT nextval('public.atividades_comentario_id_seq'::regclass);
 G   ALTER TABLE public.atividades_comentario ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221    222            �
           2604    16734    atividades_notificacao id    DEFAULT     �   ALTER TABLE ONLY public.atividades_notificacao ALTER COLUMN id SET DEFAULT nextval('public.atividades_notificacao_id_seq'::regclass);
 H   ALTER TABLE public.atividades_notificacao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    224    224            �
           2604    16742    atividades_prioridade id    DEFAULT     �   ALTER TABLE ONLY public.atividades_prioridade ALTER COLUMN id SET DEFAULT nextval('public.atividades_prioridade_id_seq'::regclass);
 G   ALTER TABLE public.atividades_prioridade ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    226    225    226            �
           2604    16428    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �
           2604    16438    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    16420    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    16446    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207            �
           2604    16456    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            �
           2604    16464    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    210    211    211            �
           2604    16524    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212    213            �
           2604    16410    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    16399    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    16654    turmas_alunoemturma id    DEFAULT     �   ALTER TABLE ONLY public.turmas_alunoemturma ALTER COLUMN id SET DEFAULT nextval('public.turmas_alunoemturma_id_seq'::regclass);
 E   ALTER TABLE public.turmas_alunoemturma ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    218    218            �
           2604    16564    turmas_turma id    DEFAULT     r   ALTER TABLE ONLY public.turmas_turma ALTER COLUMN id SET DEFAULT nextval('public.turmas_turma_id_seq'::regclass);
 >   ALTER TABLE public.turmas_turma ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    216    216            �          0    16709    atividades_atividade 
   TABLE DATA               �   COPY public.atividades_atividade (id, disciplina, atividade, data_cadastro, data_modificacao, data_entrega, valor, observacoes, aluno_id, turma_id) FROM stdin;
    public       postgres    false    220   ��       �          0    16720    atividades_comentario 
   TABLE DATA               z   COPY public.atividades_comentario (id, comentario, data_comentario, data_modificacao, aluno_id, atividade_id) FROM stdin;
    public       postgres    false    222   ��       �          0    16731    atividades_notificacao 
   TABLE DATA               W   COPY public.atividades_notificacao (id, texto, visualizada, prioridade_id) FROM stdin;
    public       postgres    false    224   m�       �          0    16739    atividades_prioridade 
   TABLE DATA               K   COPY public.atividades_prioridade (id, aluno_id, atividade_id) FROM stdin;
    public       postgres    false    226   ��       �          0    16425 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    203   ��       �          0    16435    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    205   ��       �          0    16417    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    201   ��       �          0    16443 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    207   g�       �          0    16453    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    209   ��       �          0    16461    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    211   ��       �          0    16521    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    213   ��       �          0    16407    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    199   j�       �          0    16396    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    197   �       �          0    16549    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    214   ��       �          0    16651    turmas_alunoemturma 
   TABLE DATA               T   COPY public.turmas_alunoemturma (id, data_cadastro, aluno_id, turma_id) FROM stdin;
    public       postgres    false    218   ��       �          0    16561    turmas_turma 
   TABLE DATA               d   COPY public.turmas_turma (id, nome, codigo, curso, ano, turno, aluno_id, data_cadastro) FROM stdin;
    public       postgres    false    216   B�       �           0    0    atividades_atividade_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.atividades_atividade_id_seq', 3, true);
            public       postgres    false    219            �           0    0    atividades_comentario_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.atividades_comentario_id_seq', 7, true);
            public       postgres    false    221            �           0    0    atividades_notificacao_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.atividades_notificacao_id_seq', 1, false);
            public       postgres    false    223            �           0    0    atividades_prioridade_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.atividades_prioridade_id_seq', 1, true);
            public       postgres    false    225            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);
            public       postgres    false    200            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       postgres    false    208            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);
            public       postgres    false    206            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    210            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 26, true);
            public       postgres    false    212            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);
            public       postgres    false    198            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);
            public       postgres    false    196            �           0    0    turmas_alunoemturma_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.turmas_alunoemturma_id_seq', 4, true);
            public       postgres    false    217            �           0    0    turmas_turma_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.turmas_turma_id_seq', 2, true);
            public       postgres    false    215                       2606    16717 .   atividades_atividade atividades_atividade_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.atividades_atividade
    ADD CONSTRAINT atividades_atividade_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.atividades_atividade DROP CONSTRAINT atividades_atividade_pkey;
       public         postgres    false    220                       2606    16728 0   atividades_comentario atividades_comentario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.atividades_comentario
    ADD CONSTRAINT atividades_comentario_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.atividades_comentario DROP CONSTRAINT atividades_comentario_pkey;
       public         postgres    false    222                       2606    16736 2   atividades_notificacao atividades_notificacao_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.atividades_notificacao
    ADD CONSTRAINT atividades_notificacao_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.atividades_notificacao DROP CONSTRAINT atividades_notificacao_pkey;
       public         postgres    false    224            "           2606    16746 O   atividades_prioridade atividades_prioridade_aluno_id_atividade_id_643b11b3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.atividades_prioridade
    ADD CONSTRAINT atividades_prioridade_aluno_id_atividade_id_643b11b3_uniq UNIQUE (aluno_id, atividade_id);
 y   ALTER TABLE ONLY public.atividades_prioridade DROP CONSTRAINT atividades_prioridade_aluno_id_atividade_id_643b11b3_uniq;
       public         postgres    false    226    226            &           2606    16744 0   atividades_prioridade atividades_prioridade_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.atividades_prioridade
    ADD CONSTRAINT atividades_prioridade_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.atividades_prioridade DROP CONSTRAINT atividades_prioridade_pkey;
       public         postgres    false    226            �
           2606    16432    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    203            �
           2606    16487 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    205    205            �
           2606    16440 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    205            �
           2606    16430    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    203            �
           2606    16473 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    201    201            �
           2606    16422 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    201            �
           2606    16458 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    209            �
           2606    16502 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    209    209            �
           2606    16448    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    207                       2606    16466 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    211                       2606    16516 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    211    211            �
           2606    16544     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    207                       2606    16530 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    213            �
           2606    16414 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    199    199            �
           2606    16412 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    199            �
           2606    16404 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    197                       2606    16556 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    214                       2606    16670 G   turmas_alunoemturma turmas_alunoemturma_aluno_id_turma_id_94d3fbfb_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.turmas_alunoemturma
    ADD CONSTRAINT turmas_alunoemturma_aluno_id_turma_id_94d3fbfb_uniq UNIQUE (aluno_id, turma_id);
 q   ALTER TABLE ONLY public.turmas_alunoemturma DROP CONSTRAINT turmas_alunoemturma_aluno_id_turma_id_94d3fbfb_uniq;
       public         postgres    false    218    218                       2606    16656 ,   turmas_alunoemturma turmas_alunoemturma_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.turmas_alunoemturma
    ADD CONSTRAINT turmas_alunoemturma_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.turmas_alunoemturma DROP CONSTRAINT turmas_alunoemturma_pkey;
       public         postgres    false    218                       2606    16570    turmas_turma turmas_turma_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.turmas_turma
    ADD CONSTRAINT turmas_turma_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.turmas_turma DROP CONSTRAINT turmas_turma_pkey;
       public         postgres    false    216                       1259    16757 &   atividades_atividade_aluno_id_9c627470    INDEX     k   CREATE INDEX atividades_atividade_aluno_id_9c627470 ON public.atividades_atividade USING btree (aluno_id);
 :   DROP INDEX public.atividades_atividade_aluno_id_9c627470;
       public         postgres    false    220                       1259    16758 &   atividades_atividade_turma_id_d28ea0ed    INDEX     k   CREATE INDEX atividades_atividade_turma_id_d28ea0ed ON public.atividades_atividade USING btree (turma_id);
 :   DROP INDEX public.atividades_atividade_turma_id_d28ea0ed;
       public         postgres    false    220                       1259    16769 '   atividades_comentario_aluno_id_54f0cca5    INDEX     m   CREATE INDEX atividades_comentario_aluno_id_54f0cca5 ON public.atividades_comentario USING btree (aluno_id);
 ;   DROP INDEX public.atividades_comentario_aluno_id_54f0cca5;
       public         postgres    false    222                       1259    16770 +   atividades_comentario_atividade_id_60a9b50d    INDEX     u   CREATE INDEX atividades_comentario_atividade_id_60a9b50d ON public.atividades_comentario USING btree (atividade_id);
 ?   DROP INDEX public.atividades_comentario_atividade_id_60a9b50d;
       public         postgres    false    222                        1259    16783 -   atividades_notificacao_prioridade_id_06a9b891    INDEX     y   CREATE INDEX atividades_notificacao_prioridade_id_06a9b891 ON public.atividades_notificacao USING btree (prioridade_id);
 A   DROP INDEX public.atividades_notificacao_prioridade_id_06a9b891;
       public         postgres    false    224            #           1259    16781 '   atividades_prioridade_aluno_id_fb85b363    INDEX     m   CREATE INDEX atividades_prioridade_aluno_id_fb85b363 ON public.atividades_prioridade USING btree (aluno_id);
 ;   DROP INDEX public.atividades_prioridade_aluno_id_fb85b363;
       public         postgres    false    226            $           1259    16782 +   atividades_prioridade_atividade_id_0867d99d    INDEX     u   CREATE INDEX atividades_prioridade_atividade_id_0867d99d ON public.atividades_prioridade USING btree (atividade_id);
 ?   DROP INDEX public.atividades_prioridade_atividade_id_0867d99d;
       public         postgres    false    226            �
           1259    16475    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    203            �
           1259    16488 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    205            �
           1259    16489 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    205            �
           1259    16474 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    201            �
           1259    16504 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    209            �
           1259    16503 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    209            �
           1259    16518 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    211                       1259    16517 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    211            �
           1259    16545     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    207                       1259    16541 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    213                       1259    16542 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    213            	           1259    16558 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    214                       1259    16557 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    214                       1259    16667 %   turmas_alunoemturma_aluno_id_cfe74d6c    INDEX     i   CREATE INDEX turmas_alunoemturma_aluno_id_cfe74d6c ON public.turmas_alunoemturma USING btree (aluno_id);
 9   DROP INDEX public.turmas_alunoemturma_aluno_id_cfe74d6c;
       public         postgres    false    218                       1259    16668 %   turmas_alunoemturma_turma_id_d6b2de24    INDEX     i   CREATE INDEX turmas_alunoemturma_turma_id_d6b2de24 ON public.turmas_alunoemturma USING btree (turma_id);
 9   DROP INDEX public.turmas_alunoemturma_turma_id_d6b2de24;
       public         postgres    false    218                       1259    16576    turmas_turma_adm_id_0ecc3c5b    INDEX     Y   CREATE INDEX turmas_turma_adm_id_0ecc3c5b ON public.turmas_turma USING btree (aluno_id);
 0   DROP INDEX public.turmas_turma_adm_id_0ecc3c5b;
       public         postgres    false    216            3           2606    16747 K   atividades_atividade atividades_atividade_aluno_id_9c627470_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_atividade
    ADD CONSTRAINT atividades_atividade_aluno_id_9c627470_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.atividades_atividade DROP CONSTRAINT atividades_atividade_aluno_id_9c627470_fk_auth_user_id;
       public       postgres    false    220    207    2805            4           2606    16752 N   atividades_atividade atividades_atividade_turma_id_d28ea0ed_fk_turmas_turma_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_atividade
    ADD CONSTRAINT atividades_atividade_turma_id_d28ea0ed_fk_turmas_turma_id FOREIGN KEY (turma_id) REFERENCES public.turmas_turma(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.atividades_atividade DROP CONSTRAINT atividades_atividade_turma_id_d28ea0ed_fk_turmas_turma_id;
       public       postgres    false    220    216    2831            6           2606    16764 M   atividades_comentario atividades_comentari_atividade_id_60a9b50d_fk_atividade    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_comentario
    ADD CONSTRAINT atividades_comentari_atividade_id_60a9b50d_fk_atividade FOREIGN KEY (atividade_id) REFERENCES public.atividades_atividade(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.atividades_comentario DROP CONSTRAINT atividades_comentari_atividade_id_60a9b50d_fk_atividade;
       public       postgres    false    222    2840    220            5           2606    16759 M   atividades_comentario atividades_comentario_aluno_id_54f0cca5_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_comentario
    ADD CONSTRAINT atividades_comentario_aluno_id_54f0cca5_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.atividades_comentario DROP CONSTRAINT atividades_comentario_aluno_id_54f0cca5_fk_auth_user_id;
       public       postgres    false    2805    222    207            7           2606    16784 O   atividades_notificacao atividades_notificac_prioridade_id_06a9b891_fk_atividade    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_notificacao
    ADD CONSTRAINT atividades_notificac_prioridade_id_06a9b891_fk_atividade FOREIGN KEY (prioridade_id) REFERENCES public.atividades_prioridade(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.atividades_notificacao DROP CONSTRAINT atividades_notificac_prioridade_id_06a9b891_fk_atividade;
       public       postgres    false    224    226    2854            9           2606    16776 M   atividades_prioridade atividades_prioridad_atividade_id_0867d99d_fk_atividade    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_prioridade
    ADD CONSTRAINT atividades_prioridad_atividade_id_0867d99d_fk_atividade FOREIGN KEY (atividade_id) REFERENCES public.atividades_atividade(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.atividades_prioridade DROP CONSTRAINT atividades_prioridad_atividade_id_0867d99d_fk_atividade;
       public       postgres    false    2840    226    220            8           2606    16771 M   atividades_prioridade atividades_prioridade_aluno_id_fb85b363_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.atividades_prioridade
    ADD CONSTRAINT atividades_prioridade_aluno_id_fb85b363_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.atividades_prioridade DROP CONSTRAINT atividades_prioridade_aluno_id_fb85b363_fk_auth_user_id;
       public       postgres    false    226    2805    207            )           2606    16481 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    201    2792    205            (           2606    16476 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    205    2797    203            '           2606    16467 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    199    2787    201            +           2606    16496 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    209    203    2797            *           2606    16491 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    2805    209    207            -           2606    16510 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    201    2792    211            ,           2606    16505 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    207    211    2805            .           2606    16531 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    199    2787    213            /           2606    16536 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    213    207    2805            1           2606    16657 I   turmas_alunoemturma turmas_alunoemturma_aluno_id_cfe74d6c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turmas_alunoemturma
    ADD CONSTRAINT turmas_alunoemturma_aluno_id_cfe74d6c_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.turmas_alunoemturma DROP CONSTRAINT turmas_alunoemturma_aluno_id_cfe74d6c_fk_auth_user_id;
       public       postgres    false    218    2805    207            2           2606    16662 L   turmas_alunoemturma turmas_alunoemturma_turma_id_d6b2de24_fk_turmas_turma_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turmas_alunoemturma
    ADD CONSTRAINT turmas_alunoemturma_turma_id_d6b2de24_fk_turmas_turma_id FOREIGN KEY (turma_id) REFERENCES public.turmas_turma(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.turmas_alunoemturma DROP CONSTRAINT turmas_alunoemturma_turma_id_d6b2de24_fk_turmas_turma_id;
       public       postgres    false    216    2831    218            0           2606    16632 ;   turmas_turma turmas_turma_aluno_id_1083548f_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turmas_turma
    ADD CONSTRAINT turmas_turma_aluno_id_1083548f_fk_auth_user_id FOREIGN KEY (aluno_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.turmas_turma DROP CONSTRAINT turmas_turma_aluno_id_1083548f_fk_auth_user_id;
       public       postgres    false    2805    216    207            �   
  x�}�=n�0Fg��"P��ڌ�C� M�.�# ˰�ܧ�Pt�|���I�8}O�?%6��V��B7>!B����;q{_��(ϔ��ZҖXc���ʀ���E��0�?���4�Z"���H����F(�
��mLp�z��h�������Vג��k����%���5��g�NK�|w����t ��*��"l�׶�N_���9h]r��^�}hdET�����h�в�3�奘���R���AE��i�      �   �  x��T�r�@<�_1�;��a�V�R�!��#p�e-���ծ�S�7|?Ƭ��u�˞����.��a:�f�̗gy~&k�����r)��|Y-�d��j��2{��7l�X�1B�>��F�(jY�c��j��<[[�-�!|�>�l�i�`�zJ�C� �6�}�C* �]\@C���[�F���u��ѠQ�<�)(�=xy[�!��E�|߁Tou�98��+�j�LK]4A��<tj�M���^��5�h��Dyp������E�A@��S�F�vQ3���(XǴf�Z��!�p<�B�DI	I��M�:�A1�ّ"�a)h��)x��Yr�;R��,>�+x|n5I%���o刿���*|d$6
\.	�tƳb��b)���XU'a�%��)k�(ʪ<Ư�.M�ý�_��CO;çu��I�C���ݙױ�p40�I)_�V�|��W���rQ�nW��y�	[�[��n�{d�u���.ܳRk���!�5n�;����j���]��nϠB�(��U?-k��Ŗ�!`�W����Ɔ����ҎaRہ �_�ϛ�n*)�Ղ?�����Ev���<�tm9+ӓ���B���1�ʠuv������\�X4E��+QTRV#��j�x'&��_%fb%      �      x������ � �      �      x�3�4�4����� �X      �      x������ � �      �      x������ � �      �   p  x�}�A�� ��p
��
Ɛd=�9A��Jhj)�#Ǚj�Suу�bux���_��;J��C՞��u�Tn��O��2���a(k@N������<���9�� �ѹ�{M$�D�����~��AԠ�&��rD;��cQ�����Hp$�1Z^��q�Y���腈�NAD� ��ew7�^�R5�|\��=`������l\����>�|�yyk��ysN�f�:P�F!��Wƣ��]��h�e���w�ߪaɚ�=1�1����^�H�VII�Sߊ=����Y��:� �r�@��9 ���)���}t����,�Xj�fʡAY�)�V%� �L���˻l�nGLZ����A#d�Y�O�c�li��K`jE{}c�z���s 7��u��y͚QnW���v�{��=iH��_6�SKn˯��kQ��!�Ȇ����Lh�N�O0�Iu8�?Lz��gwj���G���ŀ��v�+T��4���U�@q��ԭ�A��k�S:��٨��e��F��.hV�t�@��i�y@5y�`Ɩ-4��^�Аfp�D��J�)Ra_�¬���H�YK��m�����y�f�J�f�J�Fm���ߤ��rS��      �     x�u�[O�@���_���ҽ�61�K�����JjL̖KY
�
ʿ�Tc��29��9���;$yorA,�c���Co��;<t��~�l3�H�@���E.��&��0���UH��5E����	�dC4�p��bL&��3����RԱj`t�Jj�o�z���q
}ќk���ݾ�4bU���bʩ�M:���� O����E��}��f�m���Fqۋh��%qoX9#>|L1sb���&��6b��M���8*p��ײ�ؕ��3�-N)����4��m      �      x������ � �      �      x������ � �      �   �  x���Ko�@���+�V*���y����.�K���&�\HUE��?��=�iv6�~���;g`��`��L� X�C�F�&0�v��٬��Y,��1�t�8����a���t3��b�E�q��붖��L��{nL`��L�)t@
�{�|g��~X�Y^\����J��-�^iq���|.���U��8�83đS�ֱk�L���68��1��Yr�҆��au���A!iM�R�hԛ?���@.�U�.Mk��G��o��պ����x=_�T�o^�@�)q	$J��~�?�E�j]���l[�?������iT��b�xe�P{J8�����'m`��w�ؚ')����#
�"����2���lW& M=�٨�����=c�/�6[o���v�V���㯢:��d�����V:ڋI�ƌ��pv��� ^!�fS�l�g�g}r��Lۀ&h�P[$��1�&�g��6Z����[n���3)���kGF#�R_���-yfj��� ����k������m��R��H��J�]ܓ�lY�S!8��T����.��6�]�e��{�N�)��V��]N'��pm�4$
(�LƵ�$��!�)1��́u���H�͝qr2dDWb �ʹ$#�j��q]9�$�����GO�X��j:����0�      �   �   x�U��!���a���.^�&%L��%O�|��h��#�vެO�AaNOlt$B�a�d��LUd�feاbKG��X�؏[��rt(u��IL��W���������g��U�����_zN� �K��������r�QK��' x�qr�      �   |  x����n�0���S�jy�3>�,+YV¦H�@��ۯmZB�6{E!������wS�M��k5RJ�uWOuh
�`��%?�,ٔ�
Ԏ,?Ku�"ܦ�G�`��I�*¥��ǈ2��&������B�w?Tm�V�x~���r� �8��w��+"��y����n�՟_��8T)`��һ�𳘏>]�]h�C�d�a�%>������VC[�c*)�}Su���Cs�.*�����jC�<�h���-Z[�G.����akX'�E�kE�)%_��5�-� Yc��b�1�?�zX�ͱ���7��ܧ�|�����~s�a��V����]�	�*�Ԣ���<H��XXn;�br���K��*7��</��	k-�<-���6���J)K ���g����%b�<��-���Y-y�]�j���R�@4�R�݊��܆W�$%$��~�+�w<�'.1>�@!��V���,��S~�i+M���&���U�ڒ�+��zn�iw'nx��@H�Ly)�V����6<�Ri�*.�����i{>��)���ɭ�`�k�urt� u�]�nN.>(��-������@`;�mp5r�>���9\��]���+9�<	J�2��6'�{�A"�q�Je����/q:��O��      �   &  x����n�6�u�y�5]$׉!�F%6�n4X)R�M|�ʾM-�n^ 8|�y�������OlG��U�?�.��	�������j��q��bB�^,S{��R�����7�L8ո���|�>l񗍷�"�|ȕ�P�r��a�(�|�u��i-~�7�
�AƋ�LM��4�K���l�Vl�@��5/)O�Z�o�R��N͇��cY���0C_��e��ӞKoB��~���(�'X�_�����'���(G����j�P����� ��!|����3H�3���x��\o(�A�Hz�RX_�ԫ��ݷ� 0#.�н��������UbEQ5 ���;G�Շ�nw�C�	xpHgu�p�z�4�jz�������Dh����� � ;3 ���ծ;%��+I��j|<�e�w�i?��s��}�XUXl>Ga�*.����H��<��f4�\c��X�`���+�p�ί�&ވ���dN���������`DD�fQ80�.�ni�nR#|�;�u.;�ѝ����:���ʺ������������)zh��Pt��T�y:(}j�t������y������$�4 �x�'�ܑ]s�@^,�#���xn,�j���s��AL}"^�aި@L��j�mS�
)�^0�2+��
��k����n�/��&ֱ���R������R�����5�_�/>p��?�h�I ���܍����C��8�9���ν�����=w7;�� ��_A<�;�T�ՙ�UQ��4(w�\|����}��q���_���������|      �   U   x�e��� �3��h��Pfq�9������c�aT��8,'bFW�ռ�P|7�����`7>ԓ-c<&�6���Z/�\*"7�&      �   �   x�m̻�0 ��<�pt��;$��Q�sE�(F��� �aDK��GpH����[$m`�;��c�ϼ$ �H�"R�%���Mg�w�Qh��3��Ң�� ���5����2ű-.�u�W���R���oy��&�     