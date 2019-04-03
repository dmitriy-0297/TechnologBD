--Добавления:

  --добавление в tb_measuring_tools
  CREATE OR REPLACE FUNCTION add_measuring_tools(new_name character varying) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_measuring_tools (name) VALUES (new_name);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_measuring_tools('tool_test');

  --добавление в tb_auxiliary_tools
 CREATE OR REPLACE FUNCTION add_auxiliary_tools(new_name character varying) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_auxiliary_tools (name) VALUES (new_name);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_auxiliary_tools('tool_test');

  --добавление в tb_surfaces_measuring_tools
  CREATE OR REPLACE FUNCTION add_surface_measuring_tools(name_surface character varying, name_measuring_tool character varying) RETURNS VOID AS
  $$
    DECLARE
      id_surface_ int;
      id_measuring_tools_ int;
  BEGIN
     IF 0 <= (SELECT COUNT(*) FROM tb_surfaces WHERE tb_surfaces.name = name_surface) THEN
      SELECT id INTO id_surface_ FROM tb_surfaces WHERE tb_surfaces.name = name_surface;
      IF 0 <= (SELECT COUNT(*) FROM tb_measuring_tools WHERE tb_measuring_tools.name = name_measuring_tool) THEN
        SELECT id INTO id_measuring_tools_ FROM tb_measuring_tools WHERE tb_measuring_tools.name = name_measuring_tool;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_surfaces_measuring_tools
                 WHERE tb_surfaces_measuring_tools.id_surface = id_surface_
                   AND tb_surfaces_measuring_tools.id_measuring_tools = id_measuring_tools_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_surfaces_measuring_tools (id_surface, id_measuring_tools)
          VALUES (id_surface_, id_measuring_tools_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_measuring_tools';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_surfaces';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_surface_measuring_tools('Наружная поверхность вращения, цилиндрическая', 'tool_test');

  --добавление в tb_surfaces_auxiliary_tools
  CREATE OR REPLACE FUNCTION add_surface_auxiliary_tools(name_surface character varying, name_auxiliary_tools character varying) RETURNS VOID AS
  $$
    DECLARE
      id_surface_ int;
      id_auxiliary_tools_ int;
  BEGIN
     IF 0 <= (SELECT COUNT(*) FROM tb_surfaces WHERE tb_surfaces.name = name_surface) THEN
      SELECT id INTO id_surface_ FROM tb_surfaces WHERE tb_surfaces.name = name_surface;
      IF 0 <= (SELECT COUNT(*) FROM tb_auxiliary_tools WHERE tb_auxiliary_tools.name = name_auxiliary_tools) THEN
        SELECT id INTO id_auxiliary_tools_ FROM tb_auxiliary_tools WHERE tb_auxiliary_tools.name = name_auxiliary_tools;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_surfaces_auxiliary_tools
                 WHERE tb_surfaces_auxiliary_tools.id_surface = id_surface_
                   AND tb_surfaces_auxiliary_tools.id_auxiliary_tools = id_auxiliary_tools_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_surfaces_auxiliary_tools (id_surface, id_auxiliary_tools)
          VALUES (id_surface_, id_auxiliary_tools_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_auxiliary_tools';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_surfaces';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_surface_auxiliary_tools('Наружная поверхность вращения, цилиндрическая', 'tool_test');

  --добавление новой категории поверхности в таблицу tb_categories_surface
  CREATE OR REPLACE FUNCTION add_category_surface(new_name character varying, new_number integer) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_categories_surface (name, number) VALUES (new_name, new_number);
  EXCEPTION
    WHEN unique_violation THEN
      PERFORM update_category_surface_for_number(new_name, new_number);
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_category_surface('Наружная поверхности вращения', 1);

  --добавление нового типа поверхности в таблицу tb_types_surface
  CREATE OR REPLACE FUNCTION add_type_surface(new_name character varying, new_number integer) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_types_surface (name, number) VALUES (new_name, new_number);
  EXCEPTION
    WHEN unique_violation THEN
      PERFORM update_type_surface_for_number(new_name, new_number);
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_type_surface('Наружная поверхность точения', 8);

  --добавление типа в таблицу tb_types
  CREATE OR REPLACE FUNCTION add_type(name_type_surface character varying, name_categories_surface character varying,
                                      new_info character varying, new_path_for_image character varying, new_json boolean) RETURNS VOID AS
  $$
  DECLARE
    id_type     int;
    id_category int;
  BEGIN
    IF 1 <= (SELECT COUNT(*) FROM tb_types_surface WHERE tb_types_surface.name = name_type_surface) THEN
      SELECT id INTO id_type FROM tb_types_surface WHERE tb_types_surface.name = name_type_surface;
      IF 1 <= (SELECT COUNT(*) FROM tb_categories_surface WHERE tb_categories_surface.name = name_categories_surface) THEN
        SELECT id INTO id_category FROM tb_categories_surface WHERE tb_categories_surface.name = name_categories_surface;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_category_surface';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no_found in tb_type_surface';
    END IF;
    IF 0 < (SELECT COUNT(*) FROM tb_types WHERE tb_types.id_type_surface = id_type AND tb_types.id_category_surface = id_category) THEN
      RAISE EXCEPTION 'Such id_type and id_categories already exists';
    ELSE
      INSERT INTO tb_types (id_type_surface, id_category_surface, info, path_for_image, json_flag)
      VALUES (id_type, id_category, new_info::json, new_path_for_image, new_json);
    END IF;
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_type('Цилиндрическая поверхность', 'Наружная поверхность вращения', '{
    "values": [{
      "d_n": 17,
      "l_nc": 3,
      "q": 1
    }]
  }', 'path', false);

  --добавление имени этапа обработки в таблицу tb_name_steps
  CREATE OR REPLACE FUNCTION add_name_step(new_name character varying) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_name_steps (name) VALUES (new_name);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_name_step('Тест Этап 1');

  --добавление этапа в таблицу tb_processing_steps
  CREATE OR REPLACE FUNCTION add_processing_step(name_method character varying, name_name_step character varying,
                                                 new_allowance character varying,
                                                 new_applicability character varying,
                                                 new_dimensional_accuracy real,
                                                 new_cleanness_surface real,
                                                 new_physical_and_mathenatical_properties varchar(100)) RETURNS VOID AS
  $$
  DECLARE
    id_method_    int;
    id_name_step_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_methods WHERE tb_methods.name = name_method) THEN
      SELECT id INTO id_method_ FROM tb_methods WHERE tb_methods.name = name_method;
      IF 0 <= (SELECT COUNT(*) FROM tb_name_steps WHERE tb_name_steps.name = name_name_step) THEN
        SELECT id INTO id_name_step_ FROM tb_name_steps WHERE tb_name_steps.name = name_name_step;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_name_steps';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no_found in tb_methods';
    END IF;
    INSERT INTO tb_processing_steps (id_method, id_name_step, allowance, applicability, dimensional_accuracy, cleanness_surface, physical_and_mathematical_properties)
    VALUES (id_method, id_name_step, new_allowance, new_applicability, new_dimensional_accuracy, new_cleanness_surface, new_physical_and_mathenatical_properties);
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_processing_step('Точение', 'Тест Этап 2', '14 см', 'test', 12, 10, 'test');

  --добаление поверхности в таблицу tb_surfaces
  CREATE OR REPLACE FUNCTION add_surface(id_type int, new_name character varying,
                                         new_number int, new_quantity int, new_functional boolean, new_technical_processing_route int) RETURNS VOID AS
  $$
  DECLARE
    id_type_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_types WHERE tb_types.id = id_type) THEN
      SELECT id INTO id_type_ FROM tb_types WHERE tb_types.id = id_type;
    ELSE
      RAISE EXCEPTION 'Such id no found in tb_types';
    END IF;
    INSERT INTO tb_surfaces (id_type, name, number, quantity, functional, technical_processing_route)
    VALUES (id_type_, new_name, new_number, new_quantity, new_functional, new_technical_processing_route);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_surface(7, 'Наружная поверхность вращения, плоскаяz', 4, 2, true, 1);

  ---добавление в tb_processing_steps_surface
  CREATE OR REPLACE FUNCTION add_processing_step_surface(id_processing_step int,
                                                         name_surface character varying) RETURNS VOID AS
  $$
  DECLARE
    id_processing_steps_ int;
    id_surface_          int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_processing_steps WHERE tb_processing_steps.id = id_processing_step) THEN
      SELECT id INTO id_processing_steps_ FROM tb_processing_steps WHERE tb_processing_steps.id = id_processing_step;
      IF 0 <= (SELECT COUNT(*) FROM tb_surfaces WHERE tb_surfaces.name = name_surface) THEN
        SELECT id INTO id_surface_ FROM tb_surfaces WHERE tb_surfaces.name = name_surface;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_processing_steps_surfaces
                 WHERE tb_processing_steps_surfaces.id_processing_step = id_processing_steps_
                   AND tb_processing_steps_surfaces.id_surface = id_surface_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_processing_steps_surfaces (id_processing_step, id_surface)
          VALUES (id_processing_steps_, id_surface_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_surfaces';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such id no found in tb_processing_steps';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_processing_step_surface(1, 'Наружная поверхность вращения, цилиндрическая');


  ---добавление в tb_app_tools_processing_steps
  CREATE OR REPLACE FUNCTION add_app_tool_processing_step(name_app_tool character varying,
                                                          id_processing_step int) RETURNS VOID AS
  $$
  DECLARE
    id_app_tool_        int;
    id_processing_step_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_app_tools WHERE tb_app_tools.name = name_app_tool) THEN
      SELECT id INTO id_app_tool_ FROM tb_app_tools WHERE tb_app_tools.name = name_app_tool;
      IF 0 <= (SELECT COUNT(*) FROM tb_processing_steps WHERE tb_processing_steps.id = id_processing_step) THEN
        SELECT id INTO id_processing_step_ FROM tb_processing_steps WHERE tb_processing_steps.id = id_processing_step;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_app_tools_processing_steps
                 WHERE tb_app_tools_processing_steps.id_app_tool = id_app_tool_
                   AND tb_app_tools_processing_steps.id_processing_step = id_processing_step_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_app_tools_processing_steps (id_app_tool, id_processing_step)
          VALUES (id_app_tool_, id_processing_step_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such id no found in tb_processing_steps';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_app_tools';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_app_tool_processing_step('СТ_1_2', 1);

  ---добавление в tb_app_machines_processing_steps
  CREATE OR REPLACE FUNCTION add_app_machine_processing_step(name_app_machine character varying,
                                                             id_processing_step int) RETURNS VOID AS
  $$
  DECLARE
    id_app_machine_     int;
    id_processing_step_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_app_machines WHERE tb_app_machines.name = name_app_machine) THEN
      SELECT id INTO id_app_machine_ FROM tb_app_machines WHERE tb_app_machines.name = name_app_machine;
      IF 0 <= (SELECT COUNT(*) FROM tb_processing_steps WHERE tb_processing_steps.id = id_processing_step) THEN
        SELECT id INTO id_processing_step_ FROM tb_processing_steps WHERE tb_processing_steps.id = id_processing_step;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_app_machines_processing_steps
                 WHERE tb_app_machines_processing_steps.id_app_machine = id_app_machine_
                   AND tb_app_machines_processing_steps.id_processing_step = id_processing_step_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_app_machines_processing_steps (id_app_machine, id_processing_step)
          VALUES (id_app_machine_, id_processing_step_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such id no found in tb_processing_steps';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_app_machines';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_app_machine_processing_step('M1', 1);

  ---добавление в tb_app_machines_methods
  CREATE OR REPLACE FUNCTION add_app_machine_method(name_app_machine character varying, name_method character varying) RETURNS VOID AS
  $$
  DECLARE
    id_app_machine_ int;
    id_method_      int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_app_machines WHERE tb_app_machines.name = name_app_machine) THEN
      SELECT id INTO id_app_machine_ FROM tb_app_machines WHERE tb_app_machines.name = name_app_machine;
      IF 0 <= (SELECT COUNT(*) FROM tb_methods WHERE tb_methods.name = name_method) THEN
        SELECT id INTO id_method_ FROM tb_methods WHERE tb_methods.name = name_method;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_app_machines_methods
                 WHERE tb_app_machines_methods.id_app_machine = id_app_machine_
                   AND tb_app_machines_methods.id_method = id_method_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_app_machines_methods (id_app_machine, id_method)
          VALUES (id_app_machine_, id_method_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_methods';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_app_machines';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_app_machine_method('M1', 'TurningBP');

  --добавление типа в таблицу tb_app_tools_type
   CREATE OR REPLACE FUNCTION add_app_tool_type(new_name character varying, type_name character varying) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_app_tools_type (name)
    VALUES (new_name);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_app_tool_type('TYPE-2');

  --добавление инструмента в таблицу tb_app_tools
  CREATE OR REPLACE FUNCTION add_app_tool(new_name character varying,
                                          type_name character varying, new_parameters character varying) RETURNS VOID AS
  $$
  DECLARE
    id_app_tool_type_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_app_tools_type WHERE tb_app_tools_type.name = type_name) THEN
      SELECT id INTO id_app_tool_type_ FROM tb_app_tools_type WHERE tb_app_tools_type.name = type_name;
      INSERT INTO tb_app_tools (name, parameters, id_app_tools_type)
      VALUES (new_name, new_parameters::json, id_app_tool_type_);
    ELSE
      RAISE EXCEPTION 'Such name in tb_app_tools_type already exists';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_app_tool('CT_1_6','TYPE-1','{
    "parameters": [{
      "d": 8,
      "h": 0
    }]
  }');

  --добавление метода в таблицу tb_methods
  CREATE OR REPLACE FUNCTION add_method(new_name character varying, new_formulas character varying) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_methods (name, formulas)
    VALUES (new_name, new_formulas::json);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_method('TurningBP', '{
    "formulas": [
          {
            "i": "h / t",
            "n": "(1000 * v) / (pi * d)",
            "l_de": "(Dmax - Dmin) / 2",
            "L_2": "l_de + l_1 + l_2",
            "L_1": "l_de + l_1 + l_2",
            "T_2": "L_2 / (n * s) * i_2",
            "T_1": "L_1 / (n * s) * i_1",
            "T_m": "T_1 + T_2",
            "T_method": "T_m + (20 * T_m / 100)",
            "Cost_work_on_machine": "T_method * W_h",
            "Cost_method": "Cost_work_on_machine + Cost_Ri"
          }
      ]
  }
  ');

  --добавление станка в таблицу tb_app_machines
  CREATE OR REPLACE FUNCTION add_machine(new_name character varying) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_app_machines (name)
    VALUES (new_name);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_machine('M1');

  --добавление группы в таблицу tb_groups
  CREATE OR REPLACE FUNCTION add_group(new_name character varying, id_processing_step_ int) RETURNS VOID AS
  $$
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_processing_steps WHERE tb_processing_steps.id = id_processing_step_) THEN
      INSERT INTO tb_groups (name, id_processing_step)
      VALUES (new_name, id_processing_step_);
    ELSE
      RAISE EXCEPTION 'Such name id tb_processing_steps already exists';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_group('ГП(1/10)', 1);

  --добавление в таблицу tb_groups_technical_operations
  CREATE OR REPLACE FUNCTION add_group_technical_operation(name_group character varying, name_to character varying) RETURNS VOID AS
  $$
  DECLARE
    id_group_ int;
    id_to     int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_groups WHERE tb_groups.name = name_group) THEN
      SELECT id INTO id_group_ FROM tb_groups WHERE tb_groups.name = name_group;
      IF 0 <= (SELECT COUNT(*) FROM tb_technical_operations WHERE tb_technical_operations.name = name_to) THEN
        SELECT id INTO id_to FROM tb_technical_operations WHERE tb_technical_operations.name = name_to;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_groups_technical_operations
                 WHERE id_group = id_group_
                   AND id_technical_operation = id_to) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_groups_technical_operations (id_group, id_technical_operation)
          VALUES (id_group_, id_to);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_technical_operations';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_groups';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_group_technical_operation('ГП(1/1)', 'ТО-1');

  --добавление технической операции в таблицу tb_technical_operations
  CREATE OR REPLACE FUNCTION add_technical_operation(new_name character varying) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_technical_operations (name)
    VALUES (new_name);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_technical_operation('ТО-1');

  ---добавление в tb_groups_blocks
  CREATE OR REPLACE FUNCTION add_group_block(name_group character varying, name_block character varying) RETURNS VOID AS
  $$
  DECLARE
    id_group_ int;
    id_block_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_groups WHERE tb_groups.name = name_group) THEN
      SELECT id INTO id_group_ FROM tb_groups WHERE tb_groups.name = name_group;
      IF 0 <= (SELECT COUNT(*) FROM tb_blocks WHERE tb_blocks.name = name_block) THEN
        SELECT id INTO id_block_ FROM tb_blocks WHERE tb_blocks.name = name_block;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_groups_blocks
                 WHERE tb_groups_blocks.id_group = id_group_
                   AND tb_groups_blocks.id_blocks = id_block_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_groups_blocks (id_group, id_blocks)
          VALUES (id_group_, id_block_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_blocks';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_app_groups';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_group_block('ГП(1/1)', 'БП(1)');

  --добавление блока в таблицу tb_blocks
  CREATE OR REPLACE FUNCTION add_block(new_name character varying, surface_name character varying) RETURNS VOID AS
  $$
    DECLARE
      id_surface_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_surfaces WHERE tb_surfaces.name = surface_name) THEN
      SELECT id INTO id_surface_ FROM tb_surfaces WHERE tb_surfaces.name = surface_name;
      INSERT INTO tb_blocks (name, id_surface)
      VALUES (new_name, id_surface_);
    ELSE
       RAISE EXCEPTION 'Such name no found in tb_surface';
    END IF;
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_block('БП(0)', 'Наружная поверхность вращения, плоская');

  --добавление результата в таблицу tb_results_for_project
  CREATE OR REPLACE FUNCTION add_results_for_project(new_name character varying, new_time real, new_cost real) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_results_for_project (name, time, cost)
    VALUES (new_name, new_time, new_cost);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_results_for_project('РЕЗУЛЬТАТ(3)', 5.2, 2);

  --добавление результата в таблицу tb_results_for_method
  CREATE OR REPLACE FUNCTION add_results_for_method(new_name character varying, new_time real, new_cost real) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_results_for_method (name, time, cost)
    VALUES (new_name, new_time, new_cost);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_results_for_method('РЕЗУЛЬТАТ(3)', 5.2, 2);

  --добавление параметров заготовки в таблицу tb_workpiece_parameters
  CREATE OR REPLACE FUNCTION add_workpiece_parameters(new_subtype character varying, new_type character varying, new_path_for_image character varying,
                                                      new_parameters character varying, new_json_flag boolean) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_workpiece_parameters (subtype, type, path_for_image, parameters, json_flag)
    VALUES (new_subtype, new_type, new_path_for_image, new_parameters, new_json_flag);
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_workpiece_parameters('subtype-2', 'Round', 'path', '{
    "parameters": [{
      "diameter": 7,
      "length": 4
    }]
  }', false);

  --добавление материалов в таблицу tb_materials
  CREATE OR REPLACE FUNCTION add_materials(new_name character varying, new_measurement_system character varying,
                                           new_value real) RETURNS VOID AS
  $$
  BEGIN
    INSERT INTO tb_materials (name, measurement_system, value)
    VALUES (new_name, new_measurement_system, new_value);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_materials('M-1', 'HB', 4);

  --добавление проекта в таблицу tb_projects
  CREATE OR REPLACE FUNCTION add_project(new_name character varying, new_number int, new_company_name character varying,
                                         new_weight real, name_material character varying,
                                         new_batch_size int) RETURNS VOID AS
  $$
  DECLARE
    id_material_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_materials WHERE tb_materials.name = name_material) THEN
      SELECT id INTO id_material_ FROM tb_materials WHERE tb_materials.name = name_material;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_materials';
    END IF;
    INSERT INTO tb_projects (name, number, company_name, weight, id_material, batch_size)
    VALUES (new_name, new_number, new_company_name, new_weight, id_material_, new_batch_size);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_project('Деталь-2', 1, 'TEST_COMPANY', 12, 'M-1', 4);

  --добавление в таблицу tb_workpiece_size
  CREATE OR REPLACE FUNCTION add_workpiece_parameter_size(id_project int, id_workpiece_parameter int) RETURNS VOID AS
  $$
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_projects WHERE tb_projects.id = id_project) THEN
      IF 0 <=
         (SELECT COUNT(*) FROM tb_workpiece_parameters WHERE tb_workpiece_parameters.id = id_workpiece_parameter) THEN
      ELSE
        RAISE EXCEPTION 'Such id no found in tb_workpiece_parameters';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such id no found in tb_projects';
    END IF;
    INSERT INTO tb_workpiece_parameters_size (id_project, id_workpiece_parameters)
    VALUES (id_project, id_workpiece_parameter);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such id already exists';
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_workpiece_parameter_size(3, 5);

  --добавление в таблицу tb_results_for_project_projects
  CREATE OR REPLACE FUNCTION add_results_for_project_projects(name_result_for_project character varying, name_project character varying) RETURNS VOID AS
  $$
  DECLARE
    id_result_  int;
    id_project_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_results_for_project WHERE tb_results_for_project.name = name_result_for_project) THEN
      SELECT id INTO id_result_ FROM tb_results_for_project WHERE tb_results_for_project.name = name_result_for_project;
      IF 0 <= (SELECT COUNT(*) FROM tb_projects WHERE tb_projects.name = name_project) THEN
        SELECT id INTO id_project_ FROM tb_projects WHERE tb_projects.name = name_project;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_results_for_project_projects
                 WHERE tb_results_for_project_projects.id_result_for_project = id_result_
                   AND tb_results_for_project_projects.id_project = id_project_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_results_for_project_projects (id_result_for_project, id_project)
          VALUES (id_result_, id_project_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_projects';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_results';
    END IF;
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_results_for_project_projects('РЕЗУЛЬТАТ(3)', 'Деталь-1');

  --добавление в таблицу tb_results_for_method_methods
  CREATE OR REPLACE FUNCTION add_results_for_method_methods(name_result character varying, name_method character varying) RETURNS VOID AS
  $$
  DECLARE
    id_result_  int;
    id_method_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_results_for_method WHERE tb_results_for_method.name = name_result) THEN
      SELECT id INTO id_result_ FROM tb_results_for_method WHERE tb_results_for_method.name = name_result;
      IF 0 <= (SELECT COUNT(*) FROM tb_methods WHERE tb_methods.name = name_method) THEN
        SELECT id INTO id_method_ FROM tb_methods WHERE tb_methods.name = name_method;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_methods_results_for_method
                 WHERE tb_methods_results_for_method.id_result_for_method = id_result_
                   AND tb_methods_results_for_method.id_method = id_method_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_methods_results_for_method (id_result_for_method, id_method)
          VALUES (id_result_, id_method_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_methods';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_results_for_method';
    END IF;
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_results_for_method_methods('РЕЗУЛЬТАТ(3)', 'Точение');


  --добавление в таблицу tb_technical_operations_projects
  CREATE OR REPLACE FUNCTION add_technical_operations_projects(name_to character varying, name_project character varying) RETURNS VOID AS
  $$
  DECLARE
    id_to       int;
    id_project_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_technical_operations WHERE tb_technical_operations.name = name_to) THEN
      SELECT id INTO id_to FROM tb_technical_operations WHERE tb_technical_operations.name = name_to;
      IF 0 <= (SELECT COUNT(*) FROM tb_projects WHERE tb_projects.name = name_project) THEN
        SELECT id INTO id_project_ FROM tb_projects WHERE tb_projects.name = name_project;
        IF 1 <= (SELECT COUNT(*)
                 FROM tb_technical_operations_projects
                 WHERE tb_technical_operations_projects.id_technical_operation = id_to
                   AND tb_technical_operations_projects.id_project = id_project_) THEN
          RAISE EXCEPTION 'Such names already exists';
        ELSE
          INSERT INTO tb_technical_operations_projects (id_technical_operation, id_project)
          VALUES (id_to, id_project_);
        END IF;
      ELSE
        RAISE EXCEPTION 'Such name no found in tb_projects';
      END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_technical_operations';
    END IF;
  END
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT add_technical_operations_projects('ТО-2', 'Деталь-1');
