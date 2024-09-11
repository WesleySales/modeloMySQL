create database biblioteca;
use biblioteca;

create table Usuario(
	id int primary key auto_increment,
    nome varchar(120),
    tipo_usuario int,
    email varchar(50),
    telefone varchar(11),
    data_cadastro date,
    id_endereco int,
    foreign key (tipo_usuario) references tipo_usuario(id),
    foreign key (id_endereco) references endereco(id)
);

create table livro (
	id_livro int primary key auto_increment,
    titulo varchar(100) not null,
    id_categoria int, 
    editora varchar (25),
    ano_publicacao year,
    numero_edicao int,
    quantidade_exemplares int,
    quantidade_disponivel int,
    foreign key (id_categoria) references categoria(id)
);

create table autor(
	id int primary key auto_increment,
    nome varchar (50),
    nacionalidade varchar (50),
    data_nascimento date,
    biografia varchar(500)
);

create table categoria(
	id int primary key auto_increment,
    nome varchar(50) not null,
    descricao varchar(200)
);

create table endereco(
	id int primary key auto_increment,
    rua varchar (100),
    bairro varchar (50),
	tipo_logradouro varchar (60),
    cep varchar(8)
);

create table tipo_usuario(
	id int primary key auto_increment,
    tipo varchar(25)
);

create table emprestimo(
	id int primary key auto_increment,
    id_usuario int,
    id_livro int,
    data_emprestimo date,
    data_prevista_devolucao date,
    status_emprestimo boolean,
    foreign key (id_usuario) references Usuario(id),
    foreign key (id_livro) references livro(id_livro)
);

create table devolucao(
	id int auto_increment,
    id_emprestimo int unique,
    data_devolucao date,
    multa_por_atraso double(3,2),
    primary key (id,id_emprestimo),
    foreign key (id_emprestimo) references emprestimo(id)
);

create table reserva (
	id int primary key auto_increment,
    id_usuario int,
    id_livro int,
    data_reserva date,
    posicao_fila int,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_livro) references livro(id_livro)
);

create table livro_autor(
	id_autor int,
	id_livro int,
    foreign key (id_autor) references autor(id),
    foreign key (id_livro) references livro(id_livro)
);
