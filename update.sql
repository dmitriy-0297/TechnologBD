
 --Обновления

  --обновление таблицы tb_auxiliary_tools
  CREATE OR REPLACE FUNCTION update_auxiliary_tools(new_name character varying, old_name character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_auxiliary_tools WHERE tb_auxiliary_tools.name = old_name) THEN
      UPDATE tb_auxiliary_tools SET name = new_name WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_auxiliary_tools('tool_test_aux', 'tool_test');

  --обновление таблицы tb_measuring_tools
  CREATE OR REPLACE FUNCTION update_measuring_tools(new_name character varying, old_name character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_measuring_tools WHERE tb_measuring_tools.name = old_name) THEN
      UPDATE tb_measuring_tools SET name = new_name WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_measuring_tools('tool_test_measuring', 'tool_test');

  --обновление таблицы tb_categories_surface
  CREATE OR REPLACE FUNCTION update_categories_surface(new_name character varying, old_name character varying, new_number integer) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_categories_surface WHERE tb_categories_surface.name = old_name) THEN
      UPDATE tb_categories_surface SET name = new_name, number = new_number WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_categories_surface('Крепежные отверстия', 'Крепежные отверстия', 3);

  --обновление таблицы tb_types_surface
  CREATE OR REPLACE FUNCTION update_types_surface(new_name character varying, old_name character varying, new_number integer) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_types_surface WHERE tb_types_surface.name = old_name) THEN
      UPDATE tb_types_surface SET name = new_name, number = new_number WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_types_surface('Наружная поверхность вращения', 'Наружная поверхность вращения', 1);

  --обновление таблицы tb_types
  CREATE OR REPLACE FUNCTION update_types(old_id int,
                                          new_info character varying, new_path_for_image character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_types WHERE tb_types.id = old_id) THEN
      UPDATE tb_types
      SET info = new_info::json,
          path_for_image = new_path_for_image
      WHERE id = old_id;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such id already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_types(6, '{
    "values": [{
      "d_n": 17,
      "l_nc": 3,
      "q": 3
    }]
  }', 'path');

  --обновление таблицы tb_methods
  CREATE OR REPLACE FUNCTION update_methods(new_name character varying, old_name character varying,
                                            new_formulas character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_methods WHERE tb_methods.name = old_name) THEN
      UPDATE tb_methods
      SET name     = new_name,
          formulas = new_formulas::json
      WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_methods('TurningBP', 'Turning', '{
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

  --обновлени таблицы tb_processing_steps
  CREATE OR REPLACE FUNCTION update_processing_steps(old_id int,
                                                     new_allowance character varying,
                                                     new_applicability character varying,
                                                     new_dimensional_accuracy real,
                                                     new_cleanness_surface real,
                                                     new_physical_and_mathematical_properties character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_processing_steps WHERE tb_processing_steps.id = old_id) THEN
      UPDATE tb_processing_steps
      SET allowance     = new_allowance,
          applicability = new_applicability,
          dimensional_accuracy = new_dimensional_accuracy,
          cleanness_surface = new_cleanness_surface,
          physical_and_mathematical_properties = new_physical_and_mathematical_properties
      WHERE id = old_id;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such id already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_processing_steps(1, 'test', 'test', 10, 12, 'test');

  --обновлени таблицы tb_name_steps
  CREATE OR REPLACE FUNCTION update_name_steps(new_name character varying, old_name character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_name_steps WHERE tb_name_steps.name = old_name) THEN
      UPDATE tb_name_steps SET name = new_name WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_name_steps('Тест Этап 2', 'Тест Этап 1');

  --обновление таблицы tb_surfaces
  CREATE OR REPLACE FUNCTION update_surfaces(new_name character varying, old_name character varying, new_number integer,
                                             new_quantity integer, new_functional boolean, new_technical_processing_route int) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_surfaces WHERE tb_surfaces.name = old_name) THEN
      UPDATE tb_surfaces SET name = new_name, number = new_number, quantity = new_quantity, functional = new_functional,
                             technical_processing_route = new_technical_processing_route WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    end if;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  end;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_surfaces('Наружная поверхность вращения, плоская', 'Наружная поверхность вращения, яя', 5, 6, true, 1);

  --обновление таблицы tb_app_tools
  CREATE OR REPLACE FUNCTION update_app_tools(new_name character varying, old_name character varying,
                                              new_parameters character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_app_tools WHERE tb_app_tools.name = old_name) THEN
      UPDATE tb_app_tools
      SET name       = new_name,
          parameters = new_parameters::json
      WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  end;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_app_tools('CT_1_1', 'CT_1_8', '{
  "parameters": [{
      "v_min": 100,
      "v_max": 200,
      "s_min": 200,
      "s_max": 200,
      "t_min": 100,
      "t_max": 200,
      "durab_min": 200,
      "durab_max": 100
    }]
  }');

  --обновление таблицы tb_app_tools_type
  CREATE OR REPLACE FUNCTION update_app_tools_type(new_name character varying, old_name character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_app_tools_type WHERE tb_app_tools_type.name = old_name) THEN
      UPDATE tb_app_tools_type
      SET name       = new_name
      WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  end;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_app_tools_type('TYPE-1', 'TYPE-3');

  --обновление таблицы tb_app_machines
  CREATE OR REPLACE FUNCTION update_app_machines(new_name character varying, old_name character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_app_machines WHERE tb_app_machines.name = old_name) THEN
      UPDATE tb_app_machines SET name = new_name WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_app_machines('M1', 'M2');

  --обновление таблицы tb_workpiece_parameters
  CREATE OR REPLACE FUNCTION update_workpiece_parameters(old_id int, new_subtype character varying,
                                                         new_type character varying, new_path_for_image character varying,
                                                         new_parameters character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_workpiece_parameters WHERE tb_workpiece_parameters.id = old_id) THEN
      UPDATE tb_workpiece_parameters
      SET subtype  = new_subtype,
          type     = new_type,
          path_for_image = new_path_for_image,
          parameters = new_parameters::json
      WHERE id = old_id;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    end if;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_workpiece_parameters(8, 'test', 'Round', 'path', '  {
    "parameters": [{
      "diameter": 7,
      "length": 4
    }]
  }');

  --обновление таблицы tb_results_for_project
  CREATE OR REPLACE FUNCTION update_results_for_project(new_name character varying, old_name character varying, new_time real,
                                            new_cost real) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_results_for_project WHERE tb_results_for_project.name = old_name) THEN
      UPDATE tb_results_for_project
      SET name = new_name,
          time = new_time,
          cost = new_cost
      WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    end if;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_results_for_project('РЕЗУЛЬТАТ(1)', 'РЕЗУЛЬТАТ(0)', 5.2, 2);

  --обновление таблицы tb_results_for_method
  CREATE OR REPLACE FUNCTION update_results_for_method(new_name character varying, old_name character varying, new_time real,
                                            new_cost real) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_results_for_method WHERE tb_results_for_method.name = old_name) THEN
      UPDATE tb_results_for_method
      SET name = new_name,
          time = new_time,
          cost = new_cost
      WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    end if;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_results_for_project('РЕЗУЛЬТАТ(3)', 'РЕЗУЛЬТАТ(3)', 6.2, 2);


  --обновление таблицы tb_groups
  CREATE OR REPLACE FUNCTION update_groups(new_name character varying, old_name character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_groups WHERE tb_groups.name = old_name) THEN
      UPDATE tb_groups SET name = new_name WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_groups('ГП(1/1)', 'ГП(1/0)');

  --обнвление таблицы tb_technical_operations
  CREATE OR REPLACE FUNCTION update_technical_operations(new_name character varying, old_name character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_technical_operations WHERE tb_technical_operations.name = old_name) THEN
      UPDATE tb_technical_operations SET name = new_name WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_technical_operations('ТО-1', 'ТО-0');


  --обновление таблицы tb_projects
  CREATE OR REPLACE FUNCTION update_projects(new_name character varying, old_name character varying,
                                             new_number int, new_company_name character varying,
                                             new_weight real, new_batch_size int) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_projects WHERE tb_projects.name = old_name) THEN
      UPDATE tb_projects
      SET name         = new_name,
          number       = new_number,
          company_name = new_company_name,
          weight       = new_weight,
          batch_size   = new_batch_size
      WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_projects('Деталь-1', 'Деталь-0', 2, 'TEST_COM-1', 3, 5);

  --обновление таблицы tb_workpiece_parameters_size
  CREATE OR REPLACE FUNCTION update_workpiece_parameters_size(new_id int,
                                                              new_parameters character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_workpiece_parameters_size WHERE tb_workpiece_parameters_size.id = new_id) THEN
      UPDATE tb_workpiece_parameters_size
      SET parameters = new_parameters::json
      WHERE tb_workpiece_parameters_size.id = id;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such id already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_workpiece_parameters_size(1, '{
    "parameters": [{
      "diameter": 7,
      "length": 4
    }]
  }');

  --обновление таблицы tb_materials
  CREATE OR REPLACE FUNCTION update_materials(new_name character varying, old_name character varying,
                                              new_measurement_system character varying, new_value real) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_materials WHERE tb_materials.name = old_name) THEN
      UPDATE tb_materials
      SET name               = new_name,
          measurement_system = new_measurement_system,
          value              = new_value
      WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_materials('M-1', 'M-0', 'HB', 5);

  --обновление таблицы tb_blocks
  CREATE OR REPLACE FUNCTION update_blocks(new_name character varying, old_name character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_blocks WHERE tb_blocks.name = old_name) THEN
      UPDATE tb_blocks SET name = new_name WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_blocks('БП(1)', 'БП(0)');

  --обновление таблицы tb_category_surface для номера
  CREATE OR REPLACE FUNCTION update_category_surface_for_number(old_name character varying, new_number int) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_categories_surface WHERE tb_categories_surface.name = old_name) THEN
      UPDATE tb_categories_surface SET number = new_number WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such number already exists!';
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_category_surface_for_number('Наружная коническая поверхность', 8);

  --обновление таблицы tb_type_surface для номера
  CREATE OR REPLACE FUNCTION update_type_surface_for_number(old_name character varying, new_number int) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_types_surface WHERE tb_types_surface.name = old_name) THEN
      UPDATE tb_types_surface SET number = new_number WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT update_type_surface_for_number('Цилиндрическая поверхность', 3);
