CREATE TABLE tb_results_for_method
(
    id SERIAL PRIMARY KEY,
    name varchar(30),
    time real,
    cost real
);

CREATE TABLE tb_app_tools_type
(
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

CREATE TABLE tb_methods_results_for_method
(
    id_method int references tb_methods (id),
    id_result_for_method int references tb_results_for_method (id)
);

ALTER TABLE tb_results_for_project_projects
ADD CONSTRAINT tb_results_for_project_projects FOREIGN KEY (id_result_for_project) REFERENCES tb_results_for_project (id);

ALTER TABLE tb_groups_blocks
ADD CONSTRAINT tb_groups_blocks_id_block_fkey FOREIGN KEY (id_blocks) REFERENCES tb_blocks (id)
ON DELETE CASCADE;

CREATE TABLE tb_measuring_tools
(
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

CREATE TABLE tb_auxiliary_tools
(
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

CREATE TABLE tb_surfaces_measuring_tools
(
    id_surface int references tb_surfaces (id),
    id_measuring_tools int references tb_measuring_tools (id)
);

CREATE TABLE tb_surfaces_auxiliary_tools
(
    id_surface int references tb_surfaces (id),
    id_auxiliary_tools int references tb_auxiliary_tools (id)
);
