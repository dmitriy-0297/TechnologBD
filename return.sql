--Вывод:

  --вывод проекта из таблицы tb_projects по имени
  CREATE OR REPLACE FUNCTION return_project_by_name(name_pr character varying) RETURNS SETOF ct_for_tb_projects AS
  $$
  DECLARE
    result ct_for_tb_projects;
  BEGIN
    FOR result IN SELECT id, tb_projects.name, number, company_name, weight, (SELECT tb_materials.name FROM tb_materials WHERE tb_projects.id_material = tb_materials.id),
                         batch_size FROM tb_projects WHERE tb_projects.name = name_pr
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_projects is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_project_by_name('Деталь-1');

  --составной тип для вывода всех блоков для проекта
  CREATE TYPE ct_for_blocks_for_project AS (
    name_project varchar(100),
    company_name varchar(100),
    weight int,
    name_material varchar(100),
    batch_size int,
    name_technical_operation varchar(100),
    name_group varchar(100),
    name_block varchar(100));

  --вывод всех блоков для проекта
  CREATE OR REPLACE FUNCTION return_blocks_for_project(name_project character varying) RETURNS SETOF ct_for_blocks_for_project AS
  $$
  DECLARE
    result ct_for_blocks_for_project;
  BEGIN
    FOR result IN SELECT tp.name AS name_project, tp.company_name AS company_name, tp.weight AS weight,
                         (SELECT name FROM tb_materials WHERE tb_materials.id = tp.id_material) AS name_material,
                         tp.batch_size AS batch_size, tto.name AS name_technical_operation,
                         tg.name AS name_group, tb.name AS name_block
                  FROM tb_projects tp
                         INNER JOIN tb_technical_operations_projects t ON t.id_project = tp.id AND tp.name = name_project
                         INNER JOIN tb_technical_operations tto on t.id_technical_operation = tto.id
                         INNER JOIN tb_groups_technical_operations tgto on tto.id = tgto.id_technical_operation
                         INNER JOIN tb_groups tg on tgto.id_group = tg.id
                         INNER JOIN tb_groups_blocks tgb on tg.id = tgb.id_group
                         INNER JOIN tb_blocks tb on tgb.id_blocks = tb.id
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'Such name already exists!';
    END IF;
    RETURN;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT *
  FROM return_blocks_for_project('Деталь-1');

  --составной тип для вывода всех групп для проекта
  CREATE TYPE ct_for_groups_for_project AS (
    name_project varchar(100),
    number_project int,
    company_name varchar(100),
    weight int,
    name_material varchar(100),
    batch_size int,
    name_technical_operations varchar(100),
    name_group varchar(100));

 --вывод всех групп для проекта
  CREATE OR REPLACE FUNCTION return_groups_for_project(name_project character varying) RETURNS SETOF ct_for_groups_for_project AS
  $$
  DECLARE
    result ct_for_groups_for_project;
  BEGIN
    FOR result IN SELECT tp.name AS name_project, tp.number AS number_project, tp.company_name AS company_name,
                         tp.weight AS weight, (SELECT name FROM tb_materials WHERE tp.id_material = tb_materials.id) AS name_material,
                         tp.batch_size AS batch_size, tto.name AS name_technical_operations, tg.name AS name_group
                  FROM tb_projects tp
                         INNER JOIN tb_technical_operations_projects t ON t.id_project = tp.id AND tp.name = name_project
                         INNER JOIN tb_technical_operations tto on t.id_technical_operation = tto.id
                         INNER JOIN tb_groups_technical_operations tgto on tto.id = tgto.id_technical_operation
                         INNER JOIN tb_groups tg on tgto.id_group = tg.id
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'Such name already exists!';
    END IF;
    RETURN;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT *
  FROM return_groups_for_project('Деталь-1');

  --составной тип для tb_categories_surface
  CREATE TYPE ct_for_tb_categories_surface AS (
    id integer,
    name varchar(50),
    number integer);

  --вывод всех категорий из таблици tb_categories_surface
  CREATE OR REPLACE FUNCTION return_categories_surface() RETURNS SETOF ct_for_tb_categories_surface AS
  $$
  DECLARE
    result ct_for_tb_categories_surface;
  BEGIN
    FOR result IN SELECT id, name, number FROM tb_categories_surface
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_categories_surface is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_categories_surface();

  --составной тип для tb_type_surface
  CREATE TYPE ct_for_tb_types_surface AS (
    id integer,
    name varchar(50),
    number integer);

  --вывод всех типов поверхности из таблици tb_type_surface
  CREATE OR REPLACE FUNCTION return_types_surface() RETURNS SETOF ct_for_tb_types_surface AS
  $$
  DECLARE
    result ct_for_tb_types_surface;
  BEGIN
    FOR result IN SELECT id, name, number FROM tb_types_surface
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_types_surface is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_types_surface();

  --составной тип для заготовки для проекта
  CREATE TYPE ct_for_tb_workpiece_parameters_for_project AS (
    type_workpiece_parameters varchar(100),
    subtype_workpiece_parameters varchar(100),
    parameters json,
    path_for_image varchar(200));

  --вывод всех заготовок для проекта
  CREATE OR REPLACE FUNCTION return_workpiece_parameters_for_project(name_project character varying) RETURNS SETOF ct_for_tb_workpiece_parameters_for_project AS
  $$
  DECLARE
    result ct_for_tb_workpiece_parameters_for_project;
  BEGIN
    FOR result IN SELECT twp.type AS type_workpiece_parameters, twp.subtype AS subtype_workpiece_parameters,
                         twp.parameters AS parameters, twp.path_for_image AS path_for_image
                  FROM tb_projects tp
                    INNER JOIN tb_workpiece_parameters_size twps on tp.id = twps.id_project
                    INNER JOIN tb_workpiece_parameters twp on twps.id_workpiece_parameters = twp.id
                  WHERE tp.name = name_project

      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'name not found on tb_projects';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_workpiece_parameters_for_project('Деталь-1');

--составной тип для tb_type_surface для определенной категории
  CREATE TYPE ct_for_tb_types_surface_for_category AS (
    type_surface_name varchar(100),
    type_surface_number integer,
    category_surface_name varchar(100),
    category_surface_number integer,
    info json,
    path_for_image varchar(200));

  --вывод всех типов поверхности из таблици tb_type_surface
  CREATE OR REPLACE FUNCTION return_types_surface_for_category(name_category character varying) RETURNS SETOF ct_for_tb_types_surface_for_category AS
  $$
  DECLARE
    result ct_for_tb_types_surface_for_category;
  BEGIN
    FOR result IN SELECT ts.name AS type_surface_name, ts.number AS type_surface_number,
                        ct.name AS category_surface_name, ct.number AS category_surface_number,
                        tt.info AS info, tt.path_for_image AS path_for_image
                  FROM tb_types_surface ts
                    INNER JOIN tb_types tt ON ts.id = tt.id_type_surface
                    INNER JOIN tb_categories_surface ct ON tt.id_category_surface = ct.id AND
                                                           ct.name = name_category
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'name not found on tb category surface or tables have
         no id relationships in tb_types table';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_types_surface_for_category('Наружная поверхность вращения');

  --составной тип для tb_types
  CREATE TYPE ct_for_tb_types AS (
    id integer,
    name_type_surface varchar(50),
    name_category_surface varchar(50),
    info json,
    path_for_image varchar(200));

  --вывод всех типов из таблицы tb_types
  CREATE OR REPLACE FUNCTION return_types() RETURNS SETOF ct_for_tb_types AS
  $$
  DECLARE
    result ct_for_tb_types;
  BEGIN
    FOR result IN SELECT id,
                         (SELECT name FROM tb_types_surface WHERE tb_types.id_type_surface = tb_types_surface.id),
                         (SELECT name
                          FROM tb_categories_surface
                          WHERE tb_types.id_category_surface = tb_categories_surface.id),
                         info,
                         path_for_image FROM tb_types
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_types is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_types();

  --вывод типов c заполеными json
  CREATE OR REPLACE FUNCTION return_types_for_entered_value_json() RETURNS SETOF ct_for_tb_types AS
    $$
    DECLARE
      result ct_for_tb_types;
    BEGIN
      FOR result IN SELECT id,
                           (SELECT name FROM tb_types_surface WHERE tb_types.id_type_surface = tb_types_surface.id),
                           (SELECT name
                            FROM tb_categories_surface
                            WHERE tb_types.id_category_surface = tb_categories_surface.id),
                           info,
                           path_for_image FROM tb_types WHERE json_flag = true
        LOOP
          RETURN NEXT result;
        END LOOP;
      IF result IS NULL THEN
        RAISE EXCEPTION 'table tb_types does not store filled json';
      END IF;
      RETURN;
    END
    $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_types_for_entered_value_json();

 --вывод типов c незаполеными json
  CREATE OR REPLACE FUNCTION return_types_for_non_entered_value_json() RETURNS SETOF ct_for_tb_types AS
    $$
    DECLARE
      result ct_for_tb_types;
    BEGIN
      FOR result IN SELECT id,
                           (SELECT name FROM tb_types_surface WHERE tb_types.id_type_surface = tb_types_surface.id),
                           (SELECT name
                            FROM tb_categories_surface
                            WHERE tb_types.id_category_surface = tb_categories_surface.id),
                           info,
                           path_for_image FROM tb_types WHERE json_flag = false
        LOOP
          RETURN NEXT result;
        END LOOP;
      IF result IS NULL THEN
        RAISE EXCEPTION 'table tb_types does not store not filled json';
      END IF;
      RETURN;
    END
    $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_types_for_non_entered_value_json();

  --составной тип для tb_name_steps
  CREATE TYPE ct_for_tb_name_steps AS (
    id integer,
    name varchar(50));

  --вывод всех этапов из таблици tb_name_steps
  CREATE OR REPLACE FUNCTION return_name_steps() RETURNS SETOF ct_for_tb_name_steps AS
  $$
  DECLARE
    result ct_for_tb_name_steps;
  BEGIN
    FOR result IN SELECT id, name FROM tb_name_steps
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_name_steps is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_name_steps();

  --составной тип для tb_methods
  CREATE TYPE ct_for_tb_methods AS (
    id integer,
    name varchar(50),
    formulas json);

  --вывод всех методов из таблици tb_methods
  CREATE OR REPLACE FUNCTION return_methods() RETURNS SETOF ct_for_tb_methods AS
  $$
  DECLARE
    result ct_for_tb_methods;
  BEGIN
    FOR result IN SELECT id, name, formulas FROM tb_methods
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_methods is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_methods();

  --составной тип для tb_processing_steps
  CREATE TYPE ct_for_tb_processing_steps AS (
    id integer,
    name_method varchar(50),
    name_step varchar(50),
    allowance varchar(50),
    applicability varchar(100),
    dimensional_accuracy real,
    cleanness_surface real,
    physical_and_mathematical_properties varchar(100));

  --вывод всех этапов обработки из таблици tb_processing_steps
  CREATE OR REPLACE FUNCTION return_processing_steps() RETURNS SETOF ct_for_tb_processing_steps AS
  $$
  DECLARE
    result ct_for_tb_processing_steps;
  BEGIN
    FOR result IN SELECT id,
                         (SELECT name FROM tb_methods WHERE tb_methods.id = tb_processing_steps.id_method),
                         (SELECT name FROM tb_name_steps WHERE tb_name_steps.id = tb_processing_steps.id_name_step),
                         allowance,
                         applicability,
                         dimensional_accuracy,
                         cleanness_surface,
                         physical_and_mathematical_properties
                  FROM tb_processing_steps

      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_processing_steps is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_processing_steps();

  --составной тип для tb_processing_steps_surface
  CREATE TYPE ct_for_tb_processing_steps_surface AS (
    id_processing_step varchar(50),
    name_surface varchar(50)
    );

  --вывод из таблицы tb_processing_steps_surface
  CREATE OR REPLACE FUNCTION return_processing_steps_surfaces() RETURNS SETOF ct_for_tb_processing_steps_surface AS
  $$
  DECLARE
    result ct_for_tb_processing_steps_surface;
  BEGIN
    FOR result IN SELECT (SELECT id
                          FROM tb_processing_steps
                          WHERE tb_processing_steps_surfaces.id_processing_step = tb_processing_steps.id),
                         (SELECT name FROM tb_surfaces WHERE tb_processing_steps_surfaces.id_surface = tb_surfaces.id)
                  FROM tb_processing_steps_surfaces
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_processing_steps_surfaces is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_processing_steps_surfaces();

  --вывод из таблицы tb_auxiliary_tools
  CREATE OR REPLACE FUNCTION return_auxiliary_tools() RETURNS SETOF varchar(100) AS
  $$
  DECLARE
    result varchar(100);
  BEGIN
    FOR result IN SELECT name
                  FROM tb_auxiliary_tools
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_auxiliary_tools is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_auxiliary_tools();

 --вывод из таблицы tb_measuring_tools
  CREATE OR REPLACE FUNCTION return_measuring_tools() RETURNS SETOF varchar(100) AS
  $$
  DECLARE
    result varchar(100);
  BEGIN
    FOR result IN SELECT name
                  FROM tb_measuring_tools
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_measuring_tools is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_measuring_tools();

   --составной тип для tb_surfaces_measuring_tools
  CREATE TYPE ct_for_tb_surfaces_measuring_tools AS (
    name_surface varchar(100),
    name_measuring_tool varchar(100)
    );

   --вывод из таблицы tb_surfaces_measuring_tools
  CREATE OR REPLACE FUNCTION return_surfaces_measuring_tools() RETURNS SETOF ct_for_tb_surfaces_measuring_tools AS
  $$
  DECLARE
    result ct_for_tb_surfaces_measuring_tools;
  BEGIN
    FOR result IN SELECT (SELECT name
                          FROM tb_surfaces
                          WHERE tb_surfaces.id = tb_surfaces_measuring_tools.id_surface),
                         (SELECT name
                          FROM tb_measuring_tools
                          WHERE tb_measuring_tools.id = tb_surfaces_measuring_tools.id_measuring_tools)
                  FROM tb_surfaces_measuring_tools
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_surfaces_measuring_tools is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_surfaces_measuring_tools();

  --составной тип для tb_surfaces_measuring_tools
  CREATE TYPE ct_for_tb_surfaces_auxiliary_tools AS (
    name_surface varchar(100),
    name_auxiliary_tool varchar(100)
    );

   --вывод из таблицы tb_surfaces_auxiliary_tools
  CREATE OR REPLACE FUNCTION return_surfaces_auxiliary_tools() RETURNS SETOF ct_for_tb_surfaces_auxiliary_tools AS
  $$
  DECLARE
    result ct_for_tb_surfaces_auxiliary_tools;
  BEGIN
    FOR result IN SELECT (SELECT name
                          FROM tb_surfaces
                          WHERE tb_surfaces.id = tb_surfaces_auxiliary_tools.id_surface),
                         (SELECT name
                          FROM tb_auxiliary_tools
                          WHERE tb_auxiliary_tools.id = tb_surfaces_auxiliary_tools.id_auxiliary_tools)
                  FROM tb_surfaces_auxiliary_tools
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_surfaces_auxiliary_tools is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_surfaces_auxiliary_tools();

  --составной тип для tb_app_machines_methods
  CREATE TYPE ct_for_tb_app_machines_methods AS (
    name_app_machine varchar(50),
    name_method varchar(50)
    );

  --вывод из таблицы tb_app_machines_methods
  CREATE OR REPLACE FUNCTION return_app_machines_methods() RETURNS SETOF ct_for_tb_app_machines_methods AS
  $$
  DECLARE
    result ct_for_tb_app_machines_methods;
  BEGIN
    FOR result IN SELECT (SELECT name
                          FROM tb_app_machines
                          WHERE tb_app_machines_methods.id_app_machine = tb_app_machines.id),
                         (SELECT name FROM tb_methods WHERE tb_app_machines_methods.id_method = tb_methods.id)
                  FROM tb_app_machines_methods
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_app_machines_methods is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_app_machines_methods();

  --составной тип для tb_app_app_machines_processing_steps
  CREATE TYPE ct_for_tb_app_machines_processing_steps AS (
    name_app_machine varchar(50),
    id_processing_step int
    );

  --вывод из таблицы tb_app_machines_processing_steps
  CREATE OR REPLACE FUNCTION return_app_machines_processing_steps() RETURNS SETOF ct_for_tb_app_machines_processing_steps AS
  $$
  DECLARE
    result ct_for_tb_app_machines_processing_steps;
  BEGIN
    FOR result IN SELECT (SELECT name
                          FROM tb_app_machines
                          WHERE tb_app_machines_processing_steps.id_app_machine = tb_app_machines.id),
                         (SELECT id
                          FROM tb_processing_steps
                          WHERE tb_app_machines_processing_steps.id_processing_step = tb_processing_steps.id)
                  FROM tb_app_machines_processing_steps
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_app_machines_processing_steps is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_app_machines_processing_steps();

  --составной тип для tb_app_tools_processing_steps
  CREATE TYPE ct_for_tb_app_tools_processing_steps AS (
    name_app_tool varchar(50),
    id_processing_step int
    );

  --вывод из таблицы tb_app_machines_processing_steps
  CREATE OR REPLACE FUNCTION return_app_tools_processing_steps() RETURNS SETOF ct_for_tb_app_tools_processing_steps AS
  $$
  DECLARE
    result ct_for_tb_app_tools_processing_steps;
  BEGIN
    FOR result IN SELECT (SELECT name
                          FROM tb_app_tools
                          WHERE tb_app_tools_processing_steps.id_app_tool = tb_app_tools.id),
                         (SELECT id
                          FROM tb_processing_steps
                          WHERE tb_app_tools_processing_steps.id_processing_step = tb_processing_steps.id)
                  FROM tb_app_tools_processing_steps
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_app_tools_processing_steps is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_app_tools_processing_steps();


  --составной тип для tb_surface
  CREATE TYPE ct_for_tb_surfaces AS (
    id integer,
    name_type varchar(50),
    name varchar(50),
    number integer,
    quantity integer,
    functional boolean,
    technical_processing_route int);

  --вывод всех поверхностей из таблици tb_surfaces
  CREATE OR REPLACE FUNCTION return_surfaces() RETURNS SETOF ct_for_tb_surfaces AS
  $$
  DECLARE
    result ct_for_tb_surfaces;
  BEGIN
    FOR result IN SELECT id,
                         (SELECT name FROM tb_types WHERE tb_types.id = tb_surfaces.id_type),
                         name,
                         number,
                         quantity,
                         functional,
                         technical_processing_route
                  FROM tb_surfaces
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_surfaces is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_surfaces();

  --составной тип для tb_app_machines
  CREATE TYPE ct_for_tb_app_machines AS (
    id integer,
    name varchar(50));

  --вывод всех станков из таблици tb_app_machines
  CREATE OR REPLACE FUNCTION return_app_machines() RETURNS SETOF ct_for_tb_app_machines AS
  $$
  DECLARE
    result ct_for_tb_app_machines;
  BEGIN
    FOR result IN SELECT id, name FROM tb_app_machines
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_app_machines is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_app_machines();

  --составной тип для tb_app_tools
  CREATE TYPE ct_for_tb_app_tools AS (
    id integer,
    name varchar(50),
    type varchar(1000),
    parameters json);

  --вывод всех инструментов из таблици tb_app_tools
  CREATE OR REPLACE FUNCTION return_app_tools() RETURNS SETOF ct_for_tb_app_tools AS
  $$
  DECLARE
    result ct_for_tb_app_tools;
  BEGIN
    FOR result IN SELECT id,
                         name,
                         (SELECT name FROM tb_app_tools_type WHERE id_app_tools_type = tb_app_tools_type.id),
                         parameters
                  FROM tb_app_tools
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_app_tools is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_app_tools();

  --составной тип для tb_app_tools_type
  CREATE TYPE ct_for_tb_app_tools_type AS (
    id integer,
    name varchar(100));

  --вывод всех инструментов из таблици tb_app_tools_type
  CREATE OR REPLACE FUNCTION return_app_tools_type() RETURNS SETOF ct_for_tb_app_tools_type AS
  $$
  DECLARE
    result ct_for_tb_app_tools_type;
  BEGIN
    FOR result IN SELECT id,
                         name
                  FROM tb_app_tools_type
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_app_tools_type is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_app_tools_type();


  --составной тип для tb_workpiece_parameters
  CREATE TYPE ct_for_tb_workpiece_parameters AS (
    id integer,
    subtype varchar(100),
    type varchar(50),
    path_for_image varchar(200),
    parameters json);

  --вывод всех инструментов из таблици tb_workpiece_parameters
  CREATE OR REPLACE FUNCTION return_workpiece_parameters() RETURNS SETOF ct_for_tb_workpiece_parameters AS
  $$
  DECLARE
    result ct_for_tb_workpiece_parameters;
  BEGIN
    FOR result IN SELECT id, tb_workpiece_parameters.subtype, tb_workpiece_parameters.type, path_for_image, parameters::json FROM tb_workpiece_parameters
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_workpiece_parameters is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_workpiece_parameters();

  --вывод инструментов из таблици tb_workpiece_parameters с заполенными json
  CREATE OR REPLACE FUNCTION return_workpiece_parameters_for_entered_value_json() RETURNS SETOF ct_for_tb_workpiece_parameters AS
  $$
  DECLARE
    result ct_for_tb_workpiece_parameters;
  BEGIN
    FOR result IN SELECT id, tb_workpiece_parameters.subtype, tb_workpiece_parameters.type, path_for_image,
                         parameters::json FROM tb_workpiece_parameters WHERE json_flag = true
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_workpiece_parameters does not store filled json';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_workpiece_parameters_for_entered_value_json();

  --вывод инструментов из таблици tb_workpiece_parameters с незаполенными json
  CREATE OR REPLACE FUNCTION return_workpiece_parameters_for_non_entered_value_json() RETURNS SETOF ct_for_tb_workpiece_parameters AS
  $$
  DECLARE
    result ct_for_tb_workpiece_parameters;
  BEGIN
    FOR result IN SELECT id, tb_workpiece_parameters.subtype, tb_workpiece_parameters.type, path_for_image,
                         parameters::json FROM tb_workpiece_parameters WHERE json_flag = false
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_workpiece_parameters does not store not filled json';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_workpiece_parameters_for_non_entered_value_json();

  --составной тип для tb_result_for_project
  CREATE TYPE ct_for_tb_results_for_project AS (
    id integer,
    name varchar(50),
    time real,
    cost real);

  --вывод всех результатов из таблици tb_results_for_project
  CREATE OR REPLACE FUNCTION return_results_for_project() RETURNS SETOF ct_for_tb_results_for_project AS
  $$
  DECLARE
    result ct_for_tb_results_for_project;
  BEGIN
    FOR result IN SELECT id, name, time, cost FROM tb_results_for_project
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_results_for_projects is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_results_for_project();

CREATE TYPE ct_for_tb_results_for_method AS (
    id integer,
    name varchar(50),
    time real,
    cost real);

  --вывод всех результатов из таблици tb_results_for_method
  CREATE OR REPLACE FUNCTION return_results_for_method() RETURNS SETOF ct_for_tb_results_for_method AS
  $$
  DECLARE
    result ct_for_tb_results_for_method;
  BEGIN
    FOR result IN SELECT id, name, time, cost FROM tb_results_for_method
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_results_for_method is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_results_for_method();

  --составной тип для tb_groups
  CREATE TYPE ct_for_tb_groups AS (
    id integer,
    name varchar(50),
    id_processing_step int);

  --вывод всех групп из таблици tb_groups
  CREATE OR REPLACE FUNCTION return_groups() RETURNS SETOF ct_for_tb_groups AS
  $$
  DECLARE
    result ct_for_tb_groups;
  BEGIN
    FOR result IN SELECT id,
                         name,
                         id_processing_step
                  FROM tb_groups
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_groups is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_groups();

  --составной тип для tb_technical_operations
  CREATE TYPE ct_for_tb_technical_operations AS (
    id integer,
    name varchar(50));

  --вывод всех тех. операций из таблицы tb_technical_operations
  CREATE OR REPLACE FUNCTION return_technical_operations() RETURNS SETOF ct_for_tb_technical_operations AS
  $$
  DECLARE
    result ct_for_tb_technical_operations;
  BEGIN
    FOR result IN SELECT id, name FROM tb_technical_operations
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_technical_operations is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_technical_operations();

  --составной тип для tb_materials
  CREATE TYPE ct_for_tb_materials AS (
    id integer,
    name varchar(50),
    measurement_system varchar(50),
    value real);

  --вывод всех проектов из таблицы tb_materials
  CREATE OR REPLACE FUNCTION return_material() RETURNS SETOF ct_for_tb_materials AS
  $$
  DECLARE
    result ct_for_tb_materials;
  BEGIN
    FOR result IN SELECT id, name, measurement_system, value FROM tb_materials
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_materials is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_material();

  --составной тип для tb_projects
  CREATE TYPE ct_for_tb_projects AS (
    id integer,
    name varchar(50),
    number int,
    company_name varchar(50),
    weight real,
    name_material varchar(50),
    batch_size integer);

  --вывод всех проектов из таблицы tb_projects
  CREATE OR REPLACE FUNCTION return_projects() RETURNS SETOF ct_for_tb_projects AS
  $$
  DECLARE
    result ct_for_tb_projects;
  BEGIN
    FOR result IN SELECT id,
                         name,
                         number,
                         company_name,
                         weight,
                         (SELECT name FROM tb_materials WHERE tb_materials.id = tb_projects.id_material),
                         batch_size
                  FROM tb_projects
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_projects is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_projects();

   --составной тип для project_steps_for_surface
  CREATE TYPE ct_processing_steps_for_surface AS (
    id_processing_step int,
    name_method varchar(100),
    name_step varchar(100),
    allowance varchar(100),
    dimensional_accuracy real,
    cleanness_surface real,
    physical_and_mathematical_properties varchar(100),
    name_surface varchar(100),
    surface_number integer,
    quantity integer,
    functional boolean,
    technical_processing_route integer);

   --вывод project_steps_for_surface
  CREATE OR REPLACE FUNCTION return_processing_steps_for_surface(name_surface character varying) RETURNS SETOF ct_processing_steps_for_surface AS
  $$
  DECLARE
    result ct_processing_steps_for_surface;
  BEGIN
    FOR result IN SELECT s.id AS processing_step_id,(SELECT tb_methods.name FROM tb_methods WHERE s.id_method = tb_methods.id) AS name_method,
                         (SELECT tb_name_steps.name FROM tb_name_steps WHERE s.id_name_step = tb_name_steps.id) AS name_step,
                         s.allowance AS allowance, s.dimensional_accuracy AS dimensional_accuracy,
                         s.cleanness_surface AS cleanness_surface, s.physical_and_mathematical_properties AS physical_and_mathematical_properties,
                         ts.name AS surface_name, ts.number AS surface_number, ts.quantity AS quantity, ts.functional AS functional,
                         ts.technical_processing_route AS technical_processing_route
                  FROM tb_surfaces ts
                        INNER JOIN tb_processing_steps_surfaces t ON t.id_processing_step = ts.id AND ts.name = name_surface
                        INNER JOIN tb_processing_steps s on t.id_processing_step = s.id
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'Such name already exists!';
    END IF;
    RETURN;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT *
  FROM return_processing_steps_for_surface ('Наружная поверхность вращения, цилиндрическая');

  --составной тип для tb_workpiece_parameters_size
  CREATE TYPE ct_for_tb_workpiece_parameters_size AS (
    id integer,
    id_project integer,
    id_workpiece_parameters integer);

  --вывод из таблицы tb_workpiece_parameters_size
  CREATE OR REPLACE FUNCTION return_workpiece_parameters_size() RETURNS SETOF ct_for_tb_workpiece_parameters_size AS
  $$
  DECLARE
    result ct_for_tb_workpiece_parameters_size;
  BEGIN
    FOR result IN SELECT id,
                         id_project,
                         id_workpiece_parameters
                  FROM tb_workpiece_parameters_size
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_workpiece_parameters_size is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_workpiece_parameters_size();

  --составной тип для tb_results_for_project_projects
  CREATE TYPE ct_for_tb_results_for_project_projects AS (
    name_result varchar(50),
    name_project varchar(50));

  --вывод из таблицы tb_results_for_project_projects
  CREATE OR REPLACE FUNCTION return_results_for_project_projects() RETURNS SETOF ct_for_tb_results_for_project_projects AS
  $$
  DECLARE
    result ct_for_tb_results_for_project_projects;
  BEGIN
    FOR result IN SELECT (SELECT name FROM tb_results_for_project WHERE tb_results_for_project_projects.id_result_for_project = tb_results_for_project.id),
                         (SELECT name FROM tb_projects WHERE tb_results_for_project_projects.id_project = tb_projects.id)
                  FROM tb_results_for_project_projects
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_results_for_project_projects is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_results_for_project_projects();


  --составной тип для tb_methods_results_for_method
  CREATE TYPE ct_for_tb_methods_results_for_method AS (
    name_result varchar(50),
    name_method varchar(50));

  --вывод из таблицы tb_methods_results_for_method
  CREATE OR REPLACE FUNCTION return_methods_results_for_method() RETURNS SETOF ct_for_tb_methods_results_for_method AS
  $$
  DECLARE
    result ct_for_tb_methods_results_for_method;
  BEGIN
    FOR result IN SELECT (SELECT name FROM tb_results_for_method WHERE tb_methods_results_for_method.id_result_for_method = tb_results_for_method.id),
                         (SELECT name FROM tb_methods WHERE tb_methods_results_for_method.id_method = tb_methods.id)
                  FROM tb_methods_results_for_method
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_methods_results_for_method is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_methods_results_for_method();


  --составной тип для tb_blocks
  CREATE TYPE ct_for_tb_blocks AS (
    id integer,
    name varchar(50),
    name_surface varchar(100));

  --вывод всех блоков из таблицы tb_blocks
  CREATE OR REPLACE FUNCTION return_blocks() RETURNS SETOF ct_for_tb_blocks AS
  $$
  DECLARE
    result ct_for_tb_blocks;
  BEGIN
    FOR result IN SELECT id, name, (SELECT name FROM tb_surfaces WHERE id_surface = tb_surfaces.id) FROM tb_blocks
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_blocks is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_blocks();

  --составной тип для таблицы tb_groups_blocks
  CREATE TYPE ct_for_tb_groups_blocks AS (
    name_group varchar(50),
    name_block varchar(50));

  --вывод из таблицы tb_groups_blocks
  CREATE OR REPLACE FUNCTION return_groups_blocks() RETURNS SETOF ct_for_tb_groups_blocks AS
  $$
  DECLARE
    result ct_for_tb_groups_blocks;
  BEGIN
    FOR result IN SELECT (SELECT name FROM tb_groups WHERE tb_groups_blocks.id_group = tb_groups.id),
                         (SELECT name FROM tb_blocks WHERE tb_groups_blocks.id_blocks = tb_blocks.id)
                  FROM tb_groups_blocks
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_groups_blocks is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_groups_blocks();

  --составной тип для таблицы tb_groups_technical_operations
  CREATE TYPE ct_for_tb_groups_technical_operations AS (
    name_group varchar(50),
    name_technical_operation varchar(50));

  --вывод из таблицы tb_groups_technical_operations
  CREATE OR REPLACE FUNCTION return_groups_technical_operations() RETURNS SETOF ct_for_tb_groups_technical_operations AS
  $$
  DECLARE
    result ct_for_tb_groups_technical_operations;
  BEGIN
    FOR result IN SELECT (SELECT name FROM tb_groups WHERE tb_groups_technical_operations.id_group = tb_groups.id),
                         (SELECT name
                          FROM tb_technical_operations
                          WHERE tb_groups_technical_operations.id_technical_operation = tb_technical_operations.id)
                  FROM tb_groups_technical_operations
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_groups_technical_operations is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_groups_technical_operations();

  --составной тип для таблицы tb_technical_operations_projects
  CREATE TYPE ct_for_tb_technical_operations_projects AS (
    name_technical_operation varchar(50),
    name_project varchar(50));

  --вывод из таблицы tb_technical_operations_projects
  CREATE OR REPLACE FUNCTION return_technical_operations_projects() RETURNS SETOF ct_for_tb_technical_operations_projects AS
  $$
  DECLARE
    result ct_for_tb_technical_operations_projects;
  BEGIN
    FOR result IN SELECT (SELECT name
                          FROM tb_technical_operations
                          WHERE tb_technical_operations_projects.id_technical_operation = tb_technical_operations.id),
                         (SELECT name FROM tb_projects WHERE tb_projects.id = tb_technical_operations_projects.id_project)
                  FROM tb_technical_operations_projects
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_technical_operations_projects is empty';
    END IF;
    RETURN;
  END
  $$ LANGUAGE plpgsql;

  ----
  SELECT *
  FROM return_technical_operations_projects();

  --составной тип для проекта и всех поверхностей которые ему принадлежат
   CREATE TYPE ct_for_surfaces_for_project AS (
    project_name varchar(100),
    number_project int,
    company_name varchar(100),
    weight real,
    name_material varchar(100),
    batch_size int,
    name_technical_operations varchar(100),
    name_group varchar(100),
    name_block varchar(100),
    name_surface varchar(100),
    number_surface int,
    quantity_surface int,
    functional_surface boolean,
    technical_processing_route int,
    id_type int,
    type_surface_name varchar(100),
    category_surface_name varchar(100),
    info_type json,
    path_for_image_type varchar(200),
    id_processing_step int,
    allowance_processing_step varchar(100),
    applicability varchar(100),
    dimensional_accuracy real,
    cleanness_surface real,
    physical_and_mathematical_properties varchar(100),
    name_app_tool varchar(100),
    parameters_app_tool json,
    name_app_tool_type varchar(100),
    name_method varchar(100),
    formulas_method json,
    name_app_machines varchar(100)
    );

  --вывод всех поверхностей принадлежащих определенному проекту
  CREATE OR REPLACE FUNCTION return_surfaces_for_project(name_project character varying) RETURNS SETOF ct_for_surfaces_for_project AS
  $$
    DECLARE
    result ct_for_surfaces_for_project;
  BEGIN
    FOR result IN SELECT tp.name AS project_name, tp.number AS number_project, tp.company_name AS company_name,
                         tp.weight AS weight, (SELECT tb_materials.name FROM tb_materials WHERE tp.id_material = tb_materials.id) AS name_material,
                         tp.batch_size AS batch_size, tto.name AS name_technical_operations, tg.name AS name_group, tb.name AS name_block,
                         ts.name AS name_surface, ts.number AS number_surface, ts.quantity AS quantity_surface, ts.functional AS functional_surface,
                         ts.technical_processing_route AS technical_processing_route, ttp.id AS id_type,
                         (SELECT name FROM tb_types_surface WHERE id = ttp.id_type_surface) AS type_surface_name,
                         (SELECT name FROM tb_categories_surface WHERE ttp.id_category_surface = id) AS category_surface_name,
                         ttp.info AS info_type, ttp.path_for_image AS path_for_image_type, tps.id AS id_processing_step,
                         tps.allowance AS allowance_processing_step, tps.allowance AS applicability, tps.dimensional_accuracy AS dimensional_accuracy,
                         tps.cleanness_surface AS cleanness_surface, tps.physical_and_mathematical_properties AS physical_and_mathematical_properties,
                         tat.name AS name_app_tool_type, tat.parameters AS parameters_app_tool, tatt.name AS name_app_tool_type,
                         tm.name AS name_method, tm.formulas AS formulas_method, tam.name AS name_app_machines
                  FROM tb_projects tp
                         INNER JOIN tb_technical_operations_projects t ON t.id_project = tp.id AND tp.name = name_project
                         INNER JOIN tb_technical_operations tto on t.id_technical_operation = tto.id
                         INNER JOIN tb_groups_technical_operations tgto on tto.id = tgto.id_technical_operation
                         INNER JOIN tb_groups tg on tgto.id_group = tg.id
                         INNER JOIN tb_groups_blocks tgb on tg.id = tgb.id_group
                         INNER JOIN tb_blocks tb on tgb.id_blocks = tb.id
                         INNER JOIN tb_surfaces ts on tb.id_surface = ts.id
                         INNER JOIN tb_types ttp on ts.id_type = ttp.id
                         INNER JOIN tb_processing_steps tps on tg.id_processing_step = tps.id
                         INNER JOIN tb_app_tools_processing_steps tatps on tps.id = tatps.id_processing_step
                         INNER JOIN tb_app_tools tat on tatps.id_app_tool = tat.id
                         INNER JOIN tb_app_tools_type tatt on tat.id_app_tools_type = tatt.id
                         INNER JOIN tb_methods tm on tps.id_method = tm.id
                         INNER JOIN tb_app_machines_methods tamm on tm.id = tamm.id_method
                         INNER JOIN tb_app_machines tam on tamm.id_app_machine = tam.id
    LOOP
          RETURN NEXT result;
        END LOOP;
      IF result IS NULL THEN
        RAISE EXCEPTION 'Such name already exists!';
      END IF;
      RETURN;
    END;
    $$
      LANGUAGE 'plpgsql';

  ----
  SELECT *
  FROM return_surfaces_for_project('Деталь-1');
