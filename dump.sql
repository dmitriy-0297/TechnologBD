--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Ubuntu 11.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.2 (Ubuntu 11.2-1.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: azure_superuser
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO azure_superuser;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: azure_superuser
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: ct_for_surfaces_for_project; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_surfaces_for_project AS (
	surface_name character varying(50),
	project_name character varying(50)
);


ALTER TYPE public.ct_for_surfaces_for_project OWNER TO "Technolog";

--
-- Name: ct_for_tb_app_machines; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_app_machines AS (
	id integer,
	name character varying(50)
);


ALTER TYPE public.ct_for_tb_app_machines OWNER TO "Technolog";

--
-- Name: ct_for_tb_app_machines_methods; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_app_machines_methods AS (
	name_app_machine character varying(50),
	name_method character varying(50)
);


ALTER TYPE public.ct_for_tb_app_machines_methods OWNER TO "Technolog";

--
-- Name: ct_for_tb_app_machines_processing_steps; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_app_machines_processing_steps AS (
	name_app_machine character varying(50),
	id_processing_step integer
);


ALTER TYPE public.ct_for_tb_app_machines_processing_steps OWNER TO "Technolog";

--
-- Name: ct_for_tb_app_tools; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_app_tools AS (
	id integer,
	name character varying(50),
	type character varying(1000),
	parameters json
);


ALTER TYPE public.ct_for_tb_app_tools OWNER TO "Technolog";

--
-- Name: ct_for_tb_app_tools_processing_steps; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_app_tools_processing_steps AS (
	name_app_tool character varying(50),
	id_processing_step integer
);


ALTER TYPE public.ct_for_tb_app_tools_processing_steps OWNER TO "Technolog";

--
-- Name: ct_for_tb_app_tools_type; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_app_tools_type AS (
	id integer,
	name character varying(100)
);


ALTER TYPE public.ct_for_tb_app_tools_type OWNER TO "Technolog";

--
-- Name: ct_for_tb_blocks; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_blocks AS (
	id integer,
	name character varying(50),
	name_surface character varying(100)
);


ALTER TYPE public.ct_for_tb_blocks OWNER TO "Technolog";

--
-- Name: ct_for_tb_categories_surface; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_categories_surface AS (
	id integer,
	name character varying(50),
	number integer
);


ALTER TYPE public.ct_for_tb_categories_surface OWNER TO "Technolog";

--
-- Name: ct_for_tb_groups; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_groups AS (
	id integer,
	name character varying(50),
	id_processing_step integer
);


ALTER TYPE public.ct_for_tb_groups OWNER TO "Technolog";

--
-- Name: ct_for_tb_groups_blocks; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_groups_blocks AS (
	name_group character varying(50),
	name_block character varying(50)
);


ALTER TYPE public.ct_for_tb_groups_blocks OWNER TO "Technolog";

--
-- Name: ct_for_tb_groups_technical_operations; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_groups_technical_operations AS (
	name_group character varying(50),
	name_technical_operation character varying(50)
);


ALTER TYPE public.ct_for_tb_groups_technical_operations OWNER TO "Technolog";

--
-- Name: ct_for_tb_materials; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_materials AS (
	id integer,
	name character varying(50),
	measurement_system character varying(50),
	value real
);


ALTER TYPE public.ct_for_tb_materials OWNER TO "Technolog";

--
-- Name: ct_for_tb_methods; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_methods AS (
	id integer,
	name character varying(50),
	formulas json
);


ALTER TYPE public.ct_for_tb_methods OWNER TO "Technolog";

--
-- Name: ct_for_tb_methods_results_for_method; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_methods_results_for_method AS (
	name_result character varying(50),
	name_method character varying(50)
);


ALTER TYPE public.ct_for_tb_methods_results_for_method OWNER TO "Technolog";

--
-- Name: ct_for_tb_name_steps; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_name_steps AS (
	id integer,
	name character varying(50)
);


ALTER TYPE public.ct_for_tb_name_steps OWNER TO "Technolog";

--
-- Name: ct_for_tb_processing_steps; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_processing_steps AS (
	id integer,
	name_method character varying(50),
	name_step character varying(50),
	allowance character varying(50),
	applicability character varying(100),
	dimensional_accuracy real,
	cleanness_surface real,
	physical_and_mathematical_properties character varying(100)
);


ALTER TYPE public.ct_for_tb_processing_steps OWNER TO "Technolog";

--
-- Name: ct_for_tb_processing_steps_surface; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_processing_steps_surface AS (
	id_processing_step character varying(50),
	name_surface character varying(50)
);


ALTER TYPE public.ct_for_tb_processing_steps_surface OWNER TO "Technolog";

--
-- Name: ct_for_tb_projects; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_projects AS (
	id integer,
	name character varying(50),
	number integer,
	company_name character varying(50),
	weight real,
	name_material character varying(50),
	batch_size integer
);


ALTER TYPE public.ct_for_tb_projects OWNER TO "Technolog";

--
-- Name: ct_for_tb_results; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_results AS (
	id integer,
	name character varying(50),
	"time" real,
	cost real
);


ALTER TYPE public.ct_for_tb_results OWNER TO "Technolog";

--
-- Name: ct_for_tb_results_for_method; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_results_for_method AS (
	id integer,
	name character varying(50),
	"time" real,
	cost real
);


ALTER TYPE public.ct_for_tb_results_for_method OWNER TO "Technolog";

--
-- Name: ct_for_tb_results_for_project; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_results_for_project AS (
	id integer,
	name character varying(50),
	"time" real,
	cost real
);


ALTER TYPE public.ct_for_tb_results_for_project OWNER TO "Technolog";

--
-- Name: ct_for_tb_results_for_project_projects; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_results_for_project_projects AS (
	name_result character varying(50),
	name_project character varying(50)
);


ALTER TYPE public.ct_for_tb_results_for_project_projects OWNER TO "Technolog";

--
-- Name: ct_for_tb_results_projects; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_results_projects AS (
	name_result character varying(50),
	name_project character varying(50)
);


ALTER TYPE public.ct_for_tb_results_projects OWNER TO "Technolog";

--
-- Name: ct_for_tb_surfaces; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_surfaces AS (
	id integer,
	name_type character varying(50),
	name character varying(50),
	number integer,
	quantity integer,
	functional boolean,
	technical_processing_route integer
);


ALTER TYPE public.ct_for_tb_surfaces OWNER TO "Technolog";

--
-- Name: ct_for_tb_technical_operations; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_technical_operations AS (
	id integer,
	name character varying(50)
);


ALTER TYPE public.ct_for_tb_technical_operations OWNER TO "Technolog";

--
-- Name: ct_for_tb_technical_operations_projects; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_technical_operations_projects AS (
	name_technical_operation character varying(50),
	name_project character varying(50)
);


ALTER TYPE public.ct_for_tb_technical_operations_projects OWNER TO "Technolog";

--
-- Name: ct_for_tb_types; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_types AS (
	id integer,
	name_type_surface character varying(50),
	name_category_surface character varying(50),
	info json,
	path_for_image character varying(200)
);


ALTER TYPE public.ct_for_tb_types OWNER TO "Technolog";

--
-- Name: ct_for_tb_types_surface; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_types_surface AS (
	id integer,
	name character varying(50),
	number integer
);


ALTER TYPE public.ct_for_tb_types_surface OWNER TO "Technolog";

--
-- Name: ct_for_tb_types_surface_for_category; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_types_surface_for_category AS (
	type_surface_name character varying(100),
	category_surface_name character varying(100)
);


ALTER TYPE public.ct_for_tb_types_surface_for_category OWNER TO "Technolog";

--
-- Name: ct_for_tb_workpiece_parameters; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_workpiece_parameters AS (
	id integer,
	subtype character varying(100),
	type character varying(50),
	path_for_image character varying(200),
	parameters json
);


ALTER TYPE public.ct_for_tb_workpiece_parameters OWNER TO "Technolog";

--
-- Name: ct_for_tb_workpiece_parameters_size; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_for_tb_workpiece_parameters_size AS (
	id integer,
	id_project integer,
	id_workpiece_parameters integer
);


ALTER TYPE public.ct_for_tb_workpiece_parameters_size OWNER TO "Technolog";

--
-- Name: ct_processing_steps_for_surface; Type: TYPE; Schema: public; Owner: Technolog
--

CREATE TYPE public.ct_processing_steps_for_surface AS (
	id_processing_step integer,
	name_surface character varying(100)
);


ALTER TYPE public.ct_processing_steps_for_surface OWNER TO "Technolog";

--
-- Name: add_app_machine_method(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_app_machine_method(name_app_machine character varying, name_method character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
  DECLARE
    id_app_machine_ int;
    id_method_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_app_machines WHERE tb_app_machines.name = name_app_machine) THEN
       SELECT id INTO id_app_machine_ FROM tb_app_machines WHERE tb_app_machines.name = name_app_machine;
       IF 0 <= (SELECT COUNT(*) FROM tb_methods WHERE tb_methods.name = name_method) THEN
          SELECT id INTO id_method_ FROM tb_methods WHERE tb_methods.name = name_method;
          IF 1 <= (SELECT COUNT(*) FROM tb_app_machines_methods WHERE tb_app_machines_methods.id_app_machine = id_app_machine_
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
$$;


ALTER FUNCTION public.add_app_machine_method(name_app_machine character varying, name_method character varying) OWNER TO "Technolog";

--
-- Name: add_app_machine_processing_step(character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_app_machine_processing_step(name_app_machine character varying, id_processing_step integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_app_machine_processing_step(name_app_machine character varying, id_processing_step integer) OWNER TO "Technolog";

--
-- Name: add_app_tool(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_app_tool(new_name character varying, type_name character varying, new_parameters character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_app_tool(new_name character varying, type_name character varying, new_parameters character varying) OWNER TO "Technolog";

--
-- Name: add_app_tool_processing_step(character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_app_tool_processing_step(name_app_tool character varying, id_processing_step integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_app_tool_processing_step(name_app_tool character varying, id_processing_step integer) OWNER TO "Technolog";

--
-- Name: add_app_tool_type(character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_app_tool_type(new_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
  BEGIN
    INSERT INTO tb_app_tools_type (name)
    VALUES (new_name);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$;


ALTER FUNCTION public.add_app_tool_type(new_name character varying) OWNER TO "Technolog";

--
-- Name: add_block(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_block(new_name character varying, surface_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$;


ALTER FUNCTION public.add_block(new_name character varying, surface_name character varying) OWNER TO "Technolog";

--
-- Name: add_category_surface(character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_category_surface(new_name character varying, new_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
  BEGIN
    INSERT INTO tb_categories_surface (name, number) VALUES (new_name, new_number);
  EXCEPTION
    WHEN unique_violation THEN
      PERFORM update_category_surface_for_number(new_name, new_number);
  END
  $$;


ALTER FUNCTION public.add_category_surface(new_name character varying, new_number integer) OWNER TO "Technolog";

--
-- Name: add_group(character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_group(new_name character varying, id_processing_step_ integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_group(new_name character varying, id_processing_step_ integer) OWNER TO "Technolog";

--
-- Name: add_group_block(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_group_block(name_group character varying, name_block character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
  DECLARE
    id_group_ int;
    id_block_ int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_groups WHERE tb_groups.name = name_group) THEN
       SELECT id INTO id_group_ FROM tb_groups WHERE tb_groups.name = name_group;
       IF 0 <= (SELECT COUNT(*) FROM tb_blocks WHERE tb_blocks.name = name_block) THEN
          SELECT id INTO id_block_ FROM tb_blocks WHERE tb_blocks.name = name_block;
          IF 1 <= (SELECT COUNT(*) FROM tb_groups_blocks WHERE tb_groups_blocks.id_group = id_group_
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
$$;


ALTER FUNCTION public.add_group_block(name_group character varying, name_block character varying) OWNER TO "Technolog";

--
-- Name: add_group_technical_operation(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_group_technical_operation(name_group character varying, name_to character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
  DECLARE
    id_group_ int;
    id_to int;
BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_groups WHERE tb_groups.name = name_group) THEN
      SELECT id INTO id_group_ FROM tb_groups WHERE tb_groups.name = name_group;
      IF 0 <= (SELECT COUNT(*) FROM tb_technical_operations WHERE tb_technical_operations.name = name_to) THEN
        SELECT id INTO id_to FROM tb_technical_operations WHERE tb_technical_operations.name = name_to;
        IF 1 <= (SELECT COUNT(*) FROM tb_groups_technical_operations WHERE id_group = id_group_
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
$$;


ALTER FUNCTION public.add_group_technical_operation(name_group character varying, name_to character varying) OWNER TO "Technolog";

--
-- Name: add_machine(character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_machine(new_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO tb_app_machines (name)
  VALUES (new_name);
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists';
END
$$;


ALTER FUNCTION public.add_machine(new_name character varying) OWNER TO "Technolog";

--
-- Name: add_materials(character varying, character varying, real); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_materials(new_name character varying, new_measurement_system character varying, new_value real) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO tb_materials (name, measurement_system, value)
  VALUES (new_name, new_measurement_system, new_value);
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists';
END
$$;


ALTER FUNCTION public.add_materials(new_name character varying, new_measurement_system character varying, new_value real) OWNER TO "Technolog";

--
-- Name: add_method(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_method(new_name character varying, new_formulas character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO tb_methods (name, formulas)
  VALUES (new_name, new_formulas::json);
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists';
END
$$;


ALTER FUNCTION public.add_method(new_name character varying, new_formulas character varying) OWNER TO "Technolog";

--
-- Name: add_name_step(character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_name_step(new_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO tb_name_steps (name) VALUES (new_name);
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists';
END
$$;


ALTER FUNCTION public.add_name_step(new_name character varying) OWNER TO "Technolog";

--
-- Name: add_processing_step(character varying, character varying, character varying, character varying, real, real, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_processing_step(name_method character varying, name_name_step character varying, new_allowance character varying, new_applicability character varying, new_dimensional_accuracy real, new_cleanness_surface real, new_physical_and_mathenatical_properties character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_processing_step(name_method character varying, name_name_step character varying, new_allowance character varying, new_applicability character varying, new_dimensional_accuracy real, new_cleanness_surface real, new_physical_and_mathenatical_properties character varying) OWNER TO "Technolog";

--
-- Name: add_processing_step_surface(integer, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_processing_step_surface(id_processing_step integer, name_surface character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_processing_step_surface(id_processing_step integer, name_surface character varying) OWNER TO "Technolog";

--
-- Name: add_project(character varying, integer, character varying, real, character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_project(new_name character varying, new_number integer, new_company_name character varying, new_weight real, name_material character varying, new_batch_size integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.add_project(new_name character varying, new_number integer, new_company_name character varying, new_weight real, name_material character varying, new_batch_size integer) OWNER TO "Technolog";

--
-- Name: add_result(character varying, real, real); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_result(new_name character varying, new_time real, new_cost real) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO tb_results (name, time, cost)
  VALUES (new_name, new_time, new_cost);
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists';
END
$$;


ALTER FUNCTION public.add_result(new_name character varying, new_time real, new_cost real) OWNER TO "Technolog";

--
-- Name: add_result_project(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_result_project(name_result character varying, name_project character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
  DECLARE
    id_result_ int;
    id_project_ int;
BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_results WHERE tb_results.name = name_result) THEN
        SELECT id INTO id_result_ FROM tb_results WHERE tb_results.name = name_result;
          IF 0 <= (SELECT COUNT(*) FROM tb_projects WHERE tb_projects.name = name_project) THEN
            SELECT id INTO id_project_ FROM tb_projects WHERE tb_projects.name = name_project;
            IF 1 <= (SELECT COUNT(*) FROM tb_results_projects WHERE tb_results_projects.id_result = id_result_
              AND tb_results_projects.id_project = id_project_) THEN
                RAISE EXCEPTION 'Such names already exists';
            ELSE
                INSERT INTO tb_results_projects (id_result, id_project)
                VALUES (id_result_, id_project_);
            END IF;
          ELSE
            RAISE EXCEPTION 'Such name no found in tb_projects';
          END IF;
    ELSE
      RAISE EXCEPTION 'Such name no found in tb_results';
    END IF;
END
$$;


ALTER FUNCTION public.add_result_project(name_result character varying, name_project character varying) OWNER TO "Technolog";

--
-- Name: add_results_for_method(character varying, real, real); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_results_for_method(new_name character varying, new_time real, new_cost real) RETURNS void
    LANGUAGE plpgsql
    AS $$
  BEGIN
    INSERT INTO tb_results_for_method (name, time, cost)
    VALUES (new_name, new_time, new_cost);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$;


ALTER FUNCTION public.add_results_for_method(new_name character varying, new_time real, new_cost real) OWNER TO "Technolog";

--
-- Name: add_results_for_method_methods(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_results_for_method_methods(name_result character varying, name_method character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_results_for_method_methods(name_result character varying, name_method character varying) OWNER TO "Technolog";

--
-- Name: add_results_for_project(character varying, real, real); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_results_for_project(new_name character varying, new_time real, new_cost real) RETURNS void
    LANGUAGE plpgsql
    AS $$
  BEGIN
    INSERT INTO tb_results_for_project (name, time, cost)
    VALUES (new_name, new_time, new_cost);
  EXCEPTION
    WHEN unique_violation THEN
      RAISE EXCEPTION 'Such name already exists';
  END
  $$;


ALTER FUNCTION public.add_results_for_project(new_name character varying, new_time real, new_cost real) OWNER TO "Technolog";

--
-- Name: add_results_for_project_projects(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_results_for_project_projects(name_result_for_project character varying, name_project character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_results_for_project_projects(name_result_for_project character varying, name_project character varying) OWNER TO "Technolog";

--
-- Name: add_surface(integer, character varying, integer, integer, boolean, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_surface(id_type integer, new_name character varying, new_number integer, new_quantity integer, new_functional boolean, new_technical_processing_route integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_surface(id_type integer, new_name character varying, new_number integer, new_quantity integer, new_functional boolean, new_technical_processing_route integer) OWNER TO "Technolog";

--
-- Name: add_technical_operation(character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_technical_operation(new_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO tb_technical_operations (name)
  VALUES (new_name);
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists';
END
$$;


ALTER FUNCTION public.add_technical_operation(new_name character varying) OWNER TO "Technolog";

--
-- Name: add_technical_operations_projects(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_technical_operations_projects(name_to character varying, name_project character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
  DECLARE
    id_to int;
    id_project_ int;
BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_technical_operations WHERE tb_technical_operations.name = name_to) THEN
        SELECT id INTO id_to FROM tb_technical_operations WHERE tb_technical_operations.name = name_to;
          IF 0 <= (SELECT COUNT(*) FROM tb_projects WHERE tb_projects.name = name_project) THEN
            SELECT id INTO id_project_ FROM tb_projects WHERE tb_projects.name = name_project;
            IF 1 <= (SELECT COUNT(*) FROM tb_technical_operations_projects WHERE tb_technical_operations_projects.id_technical_operation = id_to
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
$$;


ALTER FUNCTION public.add_technical_operations_projects(name_to character varying, name_project character varying) OWNER TO "Technolog";

--
-- Name: add_type(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_type(name_type_surface character varying, name_categories_surface character varying, new_info character varying, new_path_for_image character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
  DECLARE
    id_type     int;
    id_category int;
  BEGIN
    IF 0 <= (SELECT COUNT(*) FROM tb_types_surface WHERE tb_types_surface.name = name_type_surface) THEN
      SELECT id INTO id_type FROM tb_types_surface WHERE tb_types_surface.name = name_type_surface;
      IF 0 <= (SELECT COUNT(*) FROM tb_categories_surface WHERE tb_categories_surface.name = name_categories_surface) THEN
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
      INSERT INTO tb_types (id_type_surface, id_category_surface, info, path_for_image)
      VALUES (id_type, id_category, new_info::json, new_path_for_image);
    END IF;
  END
  $$;


ALTER FUNCTION public.add_type(name_type_surface character varying, name_categories_surface character varying, new_info character varying, new_path_for_image character varying) OWNER TO "Technolog";

--
-- Name: add_type_surface(character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_type_surface(new_name character varying, new_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
  BEGIN
    INSERT INTO tb_types_surface (name, number) VALUES (new_name, new_number);
  EXCEPTION
    WHEN unique_violation THEN
      PERFORM update_type_surface_for_number(new_name, new_number);
  END
  $$;


ALTER FUNCTION public.add_type_surface(new_name character varying, new_number integer) OWNER TO "Technolog";

--
-- Name: add_workpiece_parameter_size(integer, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_workpiece_parameter_size(id_project integer, id_workpiece_parameter integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.add_workpiece_parameter_size(id_project integer, id_workpiece_parameter integer) OWNER TO "Technolog";

--
-- Name: add_workpiece_parameters(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.add_workpiece_parameters(new_subtype character varying, new_type character varying, new_path_for_image character varying, new_parameters character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
  BEGIN
    INSERT INTO tb_workpiece_parameters (subtype, type, path_for_image, parameters)
    VALUES (new_subtype, new_type, new_path_for_image, new_parameters);
  END
  $$;


ALTER FUNCTION public.add_workpiece_parameters(new_subtype character varying, new_type character varying, new_path_for_image character varying, new_parameters character varying) OWNER TO "Technolog";

--
-- Name: return_app_machines(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_app_machines() RETURNS SETOF public.ct_for_tb_app_machines
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.return_app_machines() OWNER TO "Technolog";

--
-- Name: return_app_machines_methods(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_app_machines_methods() RETURNS SETOF public.ct_for_tb_app_machines_methods
    LANGUAGE plpgsql
    AS $$
DECLARE
  result ct_for_tb_app_machines_methods;
BEGIN
  FOR result IN SELECT (SELECT name FROM tb_app_machines WHERE tb_app_machines_methods.id_app_machine = tb_app_machines.id),
                       (SELECT name FROM tb_methods WHERE tb_app_machines_methods.id_method = tb_methods.id) FROM tb_app_machines_methods
  LOOP
    RETURN NEXT result;
  END LOOP;
  IF result IS NULL THEN
     RAISE EXCEPTION 'table tb_app_machines_methods is empty';
  END IF;
  RETURN;
END
$$;


ALTER FUNCTION public.return_app_machines_methods() OWNER TO "Technolog";

--
-- Name: return_app_machines_processing_steps(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_app_machines_processing_steps() RETURNS SETOF public.ct_for_tb_app_machines_processing_steps
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_app_machines_processing_steps() OWNER TO "Technolog";

--
-- Name: return_app_tools(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_app_tools() RETURNS SETOF public.ct_for_tb_app_tools
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_app_tools() OWNER TO "Technolog";

--
-- Name: return_app_tools_processing_steps(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_app_tools_processing_steps() RETURNS SETOF public.ct_for_tb_app_tools_processing_steps
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_app_tools_processing_steps() OWNER TO "Technolog";

--
-- Name: return_app_tools_type(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_app_tools_type() RETURNS SETOF public.ct_for_tb_app_tools_type
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_app_tools_type() OWNER TO "Technolog";

--
-- Name: return_blocks(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_blocks() RETURNS SETOF public.ct_for_tb_blocks
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_blocks() OWNER TO "Technolog";

--
-- Name: return_categories_surface(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_categories_surface() RETURNS SETOF public.ct_for_tb_categories_surface
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_categories_surface() OWNER TO "Technolog";

--
-- Name: return_groups(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_groups() RETURNS SETOF public.ct_for_tb_groups
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_groups() OWNER TO "Technolog";

--
-- Name: return_groups_blocks(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_groups_blocks() RETURNS SETOF public.ct_for_tb_groups_blocks
    LANGUAGE plpgsql
    AS $$
DECLARE
  result ct_for_tb_groups_blocks;
BEGIN
  FOR result IN SELECT (SELECT name FROM tb_groups WHERE tb_groups_blocks.id_group = tb_groups.id),
                       (SELECT name FROM tb_blocks WHERE tb_groups_blocks.id_blocks = tb_blocks.id) FROM tb_groups_blocks
  LOOP
    RETURN NEXT result;
  END LOOP;
  IF result IS NULL THEN
     RAISE EXCEPTION 'table tb_groups_blocks is empty';
  END IF;
  RETURN;
END
$$;


ALTER FUNCTION public.return_groups_blocks() OWNER TO "Technolog";

--
-- Name: return_groups_technical_operations(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_groups_technical_operations() RETURNS SETOF public.ct_for_tb_groups_technical_operations
    LANGUAGE plpgsql
    AS $$
DECLARE
  result ct_for_tb_groups_technical_operations;
BEGIN
  FOR result IN SELECT (SELECT name FROM tb_groups WHERE tb_groups_technical_operations.id_group = tb_groups.id),
                       (SELECT name FROM tb_technical_operations WHERE tb_groups_technical_operations.id_technical_operation = tb_technical_operations.id) FROM tb_groups_technical_operations
  LOOP
    RETURN NEXT result;
  END LOOP;
  IF result IS NULL THEN
     RAISE EXCEPTION 'table tb_groups_technical_operations is empty';
  END IF;
  RETURN;
END
$$;


ALTER FUNCTION public.return_groups_technical_operations() OWNER TO "Technolog";

--
-- Name: return_material(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_material() RETURNS SETOF public.ct_for_tb_materials
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.return_material() OWNER TO "Technolog";

--
-- Name: return_methods(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_methods() RETURNS SETOF public.ct_for_tb_methods
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.return_methods() OWNER TO "Technolog";

--
-- Name: return_methods_results_for_method(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_methods_results_for_method() RETURNS SETOF public.ct_for_tb_methods_results_for_method
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_methods_results_for_method() OWNER TO "Technolog";

--
-- Name: return_name_steps(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_name_steps() RETURNS SETOF public.ct_for_tb_name_steps
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.return_name_steps() OWNER TO "Technolog";

--
-- Name: return_processing_steps(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_processing_steps() RETURNS SETOF public.ct_for_tb_processing_steps
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_processing_steps() OWNER TO "Technolog";

--
-- Name: return_processing_steps_for_surface(character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_processing_steps_for_surface(name_surface character varying) RETURNS SETOF public.ct_processing_steps_for_surface
    LANGUAGE plpgsql
    AS $$
  DECLARE
    result ct_processing_steps_for_surface;
  BEGIN
    FOR result IN SELECT s.id AS processing_step_id, ts.name AS surface_name
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
  $$;


ALTER FUNCTION public.return_processing_steps_for_surface(name_surface character varying) OWNER TO "Technolog";

--
-- Name: return_projects(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_projects() RETURNS SETOF public.ct_for_tb_projects
    LANGUAGE plpgsql
    AS $$
DECLARE
  result ct_for_tb_projects;
BEGIN
  FOR result IN SELECT id,
                       name, number,
                       company_name, weight, (SELECT name FROM tb_materials WHERE tb_materials.id = tb_projects.id_material),
                       batch_size FROM tb_projects
  LOOP
    RETURN NEXT result;
  END LOOP;
  IF result IS NULL THEN
     RAISE EXCEPTION 'table tb_projects is empty';
  END IF;
  RETURN;
END
$$;


ALTER FUNCTION public.return_projects() OWNER TO "Technolog";

--
-- Name: return_results(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_results() RETURNS SETOF public.ct_for_tb_results
    LANGUAGE plpgsql
    AS $$
DECLARE
  result ct_for_tb_results;
BEGIN
  FOR result IN SELECT id, name, time, cost FROM tb_results
  LOOP
    RETURN NEXT result;
  END LOOP;
  IF result IS NULL THEN
     RAISE EXCEPTION 'table tb_results is empty';
  END IF;
  RETURN;
END
$$;


ALTER FUNCTION public.return_results() OWNER TO "Technolog";

--
-- Name: return_results_for_method(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_results_for_method() RETURNS SETOF public.ct_for_tb_results_for_method
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_results_for_method() OWNER TO "Technolog";

--
-- Name: return_results_for_project(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_results_for_project() RETURNS SETOF public.ct_for_tb_results_for_project
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_results_for_project() OWNER TO "Technolog";

--
-- Name: return_results_for_project_projects(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_results_for_project_projects() RETURNS SETOF public.ct_for_tb_results_for_project_projects
    LANGUAGE plpgsql
    AS $$
  DECLARE
    result ct_for_tb_results_for_project_projects;
  BEGIN
    FOR result IN SELECT (SELECT name FROM tb_results_for_project WHERE tb_results_for_project_projects.id_result = tb_results_for_project.id),
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
  $$;


ALTER FUNCTION public.return_results_for_project_projects() OWNER TO "Technolog";

--
-- Name: return_results_projects(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_results_projects() RETURNS SETOF public.ct_for_tb_results_projects
    LANGUAGE plpgsql
    AS $$
DECLARE
  result ct_for_tb_results_projects;
BEGIN
  FOR result IN SELECT (SELECT name FROM tb_results WHERE tb_results_projects.id_result = tb_results.id),
                       (SELECT name FROM tb_projects WHERE tb_results_projects.id_project = tb_projects.id) FROM tb_results_projects
  LOOP
    RETURN NEXT result;
  END LOOP;
  IF result IS NULL THEN
     RAISE EXCEPTION 'table tb_result_project is empty';
  END IF;
  RETURN;
END
$$;


ALTER FUNCTION public.return_results_projects() OWNER TO "Technolog";

--
-- Name: return_surfaces(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_surfaces() RETURNS SETOF public.ct_for_tb_surfaces
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_surfaces() OWNER TO "Technolog";

--
-- Name: return_surfaces_for_project(character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_surfaces_for_project(name_project character varying) RETURNS SETOF public.ct_for_surfaces_for_project
    LANGUAGE plpgsql
    AS $$
  DECLARE
    result ct_for_surfaces_for_project;
  BEGIN
    FOR result IN SELECT ts.name AS surface_name, tp.name AS project_name
                  FROM tb_projects tp
                         INNER JOIN tb_technical_operations_projects t ON t.id_project = tp.id AND tp.name = name_project
                         INNER JOIN tb_technical_operations tto on t.id_technical_operation = tto.id
                         INNER JOIN tb_groups_technical_operations tgto on tto.id = tgto.id_technical_operation
                         INNER JOIN tb_groups tg on tgto.id_group = tg.id
                         INNER JOIN tb_groups_blocks tgb on tg.id = tgb.id_group
                         INNER JOIN tb_blocks tb on tgb.id_blocks = tb.id
                         INNER JOIN tb_surfaces ts on tb.id_surface = ts.id
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'Such name already exists!';
    END IF;
    RETURN;
  END;
  $$;


ALTER FUNCTION public.return_surfaces_for_project(name_project character varying) OWNER TO "Technolog";

--
-- Name: return_technical_operations(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_technical_operations() RETURNS SETOF public.ct_for_tb_technical_operations
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.return_technical_operations() OWNER TO "Technolog";

--
-- Name: return_technical_operations_projects(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_technical_operations_projects() RETURNS SETOF public.ct_for_tb_technical_operations_projects
    LANGUAGE plpgsql
    AS $$
DECLARE
  result ct_for_tb_technical_operations_projects;
BEGIN
  FOR result IN SELECT (SELECT name FROM tb_technical_operations WHERE tb_technical_operations_projects.id_technical_operation = tb_technical_operations.id),
                       (SELECT name FROM tb_projects WHERE tb_projects.id = tb_technical_operations_projects.id_project) FROM tb_technical_operations_projects
  LOOP
    RETURN NEXT result;
  END LOOP;
  IF result IS NULL THEN
     RAISE EXCEPTION 'table tb_technical_operations_projects is empty';
  END IF;
  RETURN;
END
$$;


ALTER FUNCTION public.return_technical_operations_projects() OWNER TO "Technolog";

--
-- Name: return_types(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_types() RETURNS SETOF public.ct_for_tb_types
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_types() OWNER TO "Technolog";

--
-- Name: return_types_surface(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_types_surface() RETURNS SETOF public.ct_for_tb_types_surface
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_types_surface() OWNER TO "Technolog";

--
-- Name: return_types_surface_for_category(character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_types_surface_for_category(name_category character varying) RETURNS SETOF public.ct_for_tb_types_surface_for_category
    LANGUAGE plpgsql
    AS $$
  DECLARE
    result ct_for_tb_types_surface_for_category;
  BEGIN
    FOR result IN SELECT ts.name AS type_surface_name, ts.number AS type_surface_number, ct.name AS category_surface_name
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
  $$;


ALTER FUNCTION public.return_types_surface_for_category(name_category character varying) OWNER TO "Technolog";

--
-- Name: return_workpiece_parameters(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_workpiece_parameters() RETURNS SETOF public.ct_for_tb_workpiece_parameters
    LANGUAGE plpgsql
    AS $$
  DECLARE
    result ct_for_tb_workpiece_parameters;
  BEGIN
    FOR result IN SELECT id subtype, type, path_for_image, parameters::json FROM tb_workpiece_parameters
      LOOP
        RETURN NEXT result;
      END LOOP;
    IF result IS NULL THEN
      RAISE EXCEPTION 'table tb_workpiece_parameters is empty';
    END IF;
    RETURN;
  END
  $$;


ALTER FUNCTION public.return_workpiece_parameters() OWNER TO "Technolog";

--
-- Name: return_workpiece_parameters_size(); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.return_workpiece_parameters_size() RETURNS SETOF public.ct_for_tb_workpiece_parameters_size
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.return_workpiece_parameters_size() OWNER TO "Technolog";

--
-- Name: update_app_machines(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_app_machines(new_name character varying, old_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.update_app_machines(new_name character varying, old_name character varying) OWNER TO "Technolog";

--
-- Name: update_app_tools(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_app_tools(new_name character varying, old_name character varying, new_parameters character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_app_tools(new_name character varying, old_name character varying, new_parameters character varying) OWNER TO "Technolog";

--
-- Name: update_app_tools_type(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_app_tools_type(new_name character varying, old_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_app_tools_type(new_name character varying, old_name character varying) OWNER TO "Technolog";

--
-- Name: update_blocks(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_blocks(new_name character varying, old_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.update_blocks(new_name character varying, old_name character varying) OWNER TO "Technolog";

--
-- Name: update_categories_surface(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_categories_surface(new_name character varying, old_name character varying, new_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_categories_surface(new_name character varying, old_name character varying, new_number integer) OWNER TO "Technolog";

--
-- Name: update_category_surface_for_number(character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_category_surface_for_number(old_name character varying, new_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_category_surface_for_number(old_name character varying, new_number integer) OWNER TO "Technolog";

--
-- Name: update_groups(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_groups(new_name character varying, old_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.update_groups(new_name character varying, old_name character varying) OWNER TO "Technolog";

--
-- Name: update_materials(character varying, character varying, character varying, real); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_materials(new_name character varying, old_name character varying, new_measurement_system character varying, new_value real) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS(SELECT 1 FROM tb_materials WHERE tb_materials.name = old_name) THEN
    UPDATE tb_materials SET name = new_name, measurement_system = new_measurement_system, value = new_value WHERE name = old_name;
  ELSE
    RAISE EXCEPTION 'Value does not exist!';
  END IF;
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists!';
END;
$$;


ALTER FUNCTION public.update_materials(new_name character varying, old_name character varying, new_measurement_system character varying, new_value real) OWNER TO "Technolog";

--
-- Name: update_methods(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_methods(new_name character varying, old_name character varying, new_formulas character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS(SELECT 1 FROM tb_methods WHERE tb_methods.name = old_name) THEN
    UPDATE tb_methods SET name = new_name,
                          formulas = new_formulas::json
    WHERE name = old_name;
  ELSE
    RAISE EXCEPTION 'Value does not exist!';
  END IF;
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists!';
END;
$$;


ALTER FUNCTION public.update_methods(new_name character varying, old_name character varying, new_formulas character varying) OWNER TO "Technolog";

--
-- Name: update_name_steps(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_name_steps(new_name character varying, old_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.update_name_steps(new_name character varying, old_name character varying) OWNER TO "Technolog";

--
-- Name: update_processing_steps(integer, character varying, character varying, real, real, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_processing_steps(old_id integer, new_allowance character varying, new_applicability character varying, new_dimensional_accuracy real, new_cleanness_surface real, new_physical_and_mathematical_properties character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_processing_steps(old_id integer, new_allowance character varying, new_applicability character varying, new_dimensional_accuracy real, new_cleanness_surface real, new_physical_and_mathematical_properties character varying) OWNER TO "Technolog";

--
-- Name: update_projects(character varying, character varying, integer, character varying, real, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_projects(new_name character varying, old_name character varying, new_number integer, new_company_name character varying, new_weight real, new_batch_size integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS(SELECT 1 FROM tb_projects WHERE tb_projects.name = old_name) THEN
    UPDATE tb_projects SET name = new_name, number = new_number, company_name = new_company_name, weight = new_weight, batch_size = new_batch_size WHERE name = old_name;
  ELSE
    RAISE EXCEPTION 'Value does not exist!';
  END IF;
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'Such name already exists!';
END;
$$;


ALTER FUNCTION public.update_projects(new_name character varying, old_name character varying, new_number integer, new_company_name character varying, new_weight real, new_batch_size integer) OWNER TO "Technolog";

--
-- Name: update_results(character varying, character varying, real, real); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_results(new_name character varying, old_name character varying, new_time real, new_cost real) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS(SELECT 1 FROM tb_results WHERE tb_results.name = old_name) THEN
    UPDATE tb_results
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
$$;


ALTER FUNCTION public.update_results(new_name character varying, old_name character varying, new_time real, new_cost real) OWNER TO "Technolog";

--
-- Name: update_results_for_method(character varying, character varying, real, real); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_results_for_method(new_name character varying, old_name character varying, new_time real, new_cost real) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_results_for_method(new_name character varying, old_name character varying, new_time real, new_cost real) OWNER TO "Technolog";

--
-- Name: update_results_for_project(character varying, character varying, real, real); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_results_for_project(new_name character varying, old_name character varying, new_time real, new_cost real) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_results_for_project(new_name character varying, old_name character varying, new_time real, new_cost real) OWNER TO "Technolog";

--
-- Name: update_surfaces(character varying, character varying, integer, integer, boolean, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_surfaces(new_name character varying, old_name character varying, new_number integer, new_quantity integer, new_functional boolean, new_technical_processing_route integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_surfaces(new_name character varying, old_name character varying, new_number integer, new_quantity integer, new_functional boolean, new_technical_processing_route integer) OWNER TO "Technolog";

--
-- Name: update_technical_operations(character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_technical_operations(new_name character varying, old_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.update_technical_operations(new_name character varying, old_name character varying) OWNER TO "Technolog";

--
-- Name: update_type_surface_for_number(character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_type_surface_for_number(old_name character varying, new_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_types_surface WHERE tb_types_surface.name = old_name) THEN
      UPDATE tb_types_surface SET number = new_number WHERE name = old_name;
    ELSE
      RAISE EXCEPTION 'Value does not exist!';
    END IF;
  END;
  $$;


ALTER FUNCTION public.update_type_surface_for_number(old_name character varying, new_number integer) OWNER TO "Technolog";

--
-- Name: update_types(integer, character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_types(old_id integer, new_info character varying, new_path_for_image character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_types(old_id integer, new_info character varying, new_path_for_image character varying) OWNER TO "Technolog";

--
-- Name: update_types_surface(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_types_surface(new_name character varying, old_name character varying, new_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_types_surface(new_name character varying, old_name character varying, new_number integer) OWNER TO "Technolog";

--
-- Name: update_workpiece_parameters(integer, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: Technolog
--

CREATE FUNCTION public.update_workpiece_parameters(old_id integer, new_subtype character varying, new_type character varying, new_path_for_image character varying, new_parameters character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
  $$;


ALTER FUNCTION public.update_workpiece_parameters(old_id integer, new_subtype character varying, new_type character varying, new_path_for_image character varying, new_parameters character varying) OWNER TO "Technolog";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tb_categories_surface; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_categories_surface (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    number integer
);


ALTER TABLE public.tb_categories_surface OWNER TO "Technolog";

--
-- Name: categories_surface_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.categories_surface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_surface_id_seq OWNER TO "Technolog";

--
-- Name: categories_surface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.categories_surface_id_seq OWNED BY public.tb_categories_surface.id;


--
-- Name: processing_step_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.processing_step_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.processing_step_id_seq OWNER TO "Technolog";

--
-- Name: processing_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.processing_steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.processing_steps_id_seq OWNER TO "Technolog";

--
-- Name: tb_app_machines; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_app_machines (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tb_app_machines OWNER TO "Technolog";

--
-- Name: tb_app_machines_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_app_machines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_app_machines_id_seq OWNER TO "Technolog";

--
-- Name: tb_app_machines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_app_machines_id_seq OWNED BY public.tb_app_machines.id;


--
-- Name: tb_app_machines_methods; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_app_machines_methods (
    id_app_machine integer,
    id_method integer
);


ALTER TABLE public.tb_app_machines_methods OWNER TO "Technolog";

--
-- Name: tb_app_machines_processing_steps; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_app_machines_processing_steps (
    id_app_machine integer,
    id_processing_step integer
);


ALTER TABLE public.tb_app_machines_processing_steps OWNER TO "Technolog";

--
-- Name: tb_app_tools; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_app_tools (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    parameters json NOT NULL,
    id_app_tools_type integer
);


ALTER TABLE public.tb_app_tools OWNER TO "Technolog";

--
-- Name: tb_app_tools_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_app_tools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_app_tools_id_seq OWNER TO "Technolog";

--
-- Name: tb_app_tools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_app_tools_id_seq OWNED BY public.tb_app_tools.id;


--
-- Name: tb_app_tools_processing_steps; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_app_tools_processing_steps (
    id_app_tool integer,
    id_processing_step integer
);


ALTER TABLE public.tb_app_tools_processing_steps OWNER TO "Technolog";

--
-- Name: tb_app_tools_type; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_app_tools_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.tb_app_tools_type OWNER TO "Technolog";

--
-- Name: tb_app_tools_type_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_app_tools_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_app_tools_type_id_seq OWNER TO "Technolog";

--
-- Name: tb_app_tools_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_app_tools_type_id_seq OWNED BY public.tb_app_tools_type.id;


--
-- Name: tb_blocks; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_blocks (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    id_surface integer
);


ALTER TABLE public.tb_blocks OWNER TO "Technolog";

--
-- Name: tb_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_blocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_blocks_id_seq OWNER TO "Technolog";

--
-- Name: tb_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_blocks_id_seq OWNED BY public.tb_blocks.id;


--
-- Name: tb_categories_surface_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_categories_surface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_categories_surface_id_seq OWNER TO "Technolog";

--
-- Name: tb_categories_surface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_categories_surface_id_seq OWNED BY public.tb_categories_surface.id;


--
-- Name: tb_groups; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_groups (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    id_processing_step integer
);


ALTER TABLE public.tb_groups OWNER TO "Technolog";

--
-- Name: tb_groups_blocks; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_groups_blocks (
    id_group integer,
    id_blocks integer
);


ALTER TABLE public.tb_groups_blocks OWNER TO "Technolog";

--
-- Name: tb_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_groups_id_seq OWNER TO "Technolog";

--
-- Name: tb_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_groups_id_seq OWNED BY public.tb_groups.id;


--
-- Name: tb_groups_technical_operations; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_groups_technical_operations (
    id_group integer NOT NULL,
    id_technical_operation integer NOT NULL
);


ALTER TABLE public.tb_groups_technical_operations OWNER TO "Technolog";

--
-- Name: tb_materials; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_materials (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    measurement_system character varying(50),
    value real
);


ALTER TABLE public.tb_materials OWNER TO "Technolog";

--
-- Name: tb_materials_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_materials_id_seq OWNER TO "Technolog";

--
-- Name: tb_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_materials_id_seq OWNED BY public.tb_materials.id;


--
-- Name: tb_methods; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_methods (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    formulas json
);


ALTER TABLE public.tb_methods OWNER TO "Technolog";

--
-- Name: tb_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_methods_id_seq OWNER TO "Technolog";

--
-- Name: tb_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_methods_id_seq OWNED BY public.tb_methods.id;


--
-- Name: tb_methods_results_for_method; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_methods_results_for_method (
    id_method integer,
    id_result_for_method integer
);


ALTER TABLE public.tb_methods_results_for_method OWNER TO "Technolog";

--
-- Name: tb_name_steps; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_name_steps (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tb_name_steps OWNER TO "Technolog";

--
-- Name: tb_processing_steps; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_processing_steps (
    id integer NOT NULL,
    id_method integer,
    id_name_step integer,
    allowance character varying(50),
    applicability character varying(100),
    dimensional_accuracy real,
    cleanness_surface real,
    physical_and_mathematical_properties character varying(100)
);


ALTER TABLE public.tb_processing_steps OWNER TO "Technolog";

--
-- Name: tb_processing_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_processing_steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_processing_steps_id_seq OWNER TO "Technolog";

--
-- Name: tb_processing_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_processing_steps_id_seq OWNED BY public.tb_name_steps.id;


--
-- Name: tb_processing_steps_id_seq1; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_processing_steps_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_processing_steps_id_seq1 OWNER TO "Technolog";

--
-- Name: tb_processing_steps_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_processing_steps_id_seq1 OWNED BY public.tb_processing_steps.id;


--
-- Name: tb_processing_steps_surfaces; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_processing_steps_surfaces (
    id_processing_step integer,
    id_surface integer
);


ALTER TABLE public.tb_processing_steps_surfaces OWNER TO "Technolog";

--
-- Name: tb_projects; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_projects (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    number integer,
    company_name character varying(50),
    weight real,
    id_material integer,
    batch_size integer
);


ALTER TABLE public.tb_projects OWNER TO "Technolog";

--
-- Name: tb_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_projects_id_seq OWNER TO "Technolog";

--
-- Name: tb_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_projects_id_seq OWNED BY public.tb_projects.id;


--
-- Name: tb_results_for_project; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_results_for_project (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    "time" real,
    cost real
);


ALTER TABLE public.tb_results_for_project OWNER TO "Technolog";

--
-- Name: tb_results_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_results_id_seq OWNER TO "Technolog";

--
-- Name: tb_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_results_id_seq OWNED BY public.tb_results_for_project.id;


--
-- Name: tb_results; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_results (
    id integer DEFAULT nextval('public.tb_results_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    "time" real,
    cost real
);


ALTER TABLE public.tb_results OWNER TO "Technolog";

--
-- Name: tb_results_for_method; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_results_for_method (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    "time" real,
    cost real
);


ALTER TABLE public.tb_results_for_method OWNER TO "Technolog";

--
-- Name: tb_results_for_method_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_results_for_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_results_for_method_id_seq OWNER TO "Technolog";

--
-- Name: tb_results_for_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_results_for_method_id_seq OWNED BY public.tb_results_for_method.id;


--
-- Name: tb_results_for_project_projects; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_results_for_project_projects (
    id_result_for_project integer,
    id_project integer
);


ALTER TABLE public.tb_results_for_project_projects OWNER TO "Technolog";

--
-- Name: tb_results_projects; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_results_projects (
    id_result integer,
    id_project integer
);


ALTER TABLE public.tb_results_projects OWNER TO "Technolog";

--
-- Name: tb_surfaces; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_surfaces (
    id integer NOT NULL,
    id_type integer,
    name character varying(50) NOT NULL,
    number integer,
    quantity integer,
    functional boolean,
    technical_processing_route integer
);


ALTER TABLE public.tb_surfaces OWNER TO "Technolog";

--
-- Name: tb_surfaces_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_surfaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_surfaces_id_seq OWNER TO "Technolog";

--
-- Name: tb_surfaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_surfaces_id_seq OWNED BY public.tb_surfaces.id;


--
-- Name: tb_technical_operations; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_technical_operations (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.tb_technical_operations OWNER TO "Technolog";

--
-- Name: tb_technical_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_technical_operations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_technical_operations_id_seq OWNER TO "Technolog";

--
-- Name: tb_technical_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_technical_operations_id_seq OWNED BY public.tb_technical_operations.id;


--
-- Name: tb_technical_operations_projects; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_technical_operations_projects (
    id_technical_operation integer NOT NULL,
    id_project integer NOT NULL
);


ALTER TABLE public.tb_technical_operations_projects OWNER TO "Technolog";

--
-- Name: tb_types; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_types (
    id integer NOT NULL,
    id_type_surface integer,
    id_category_surface integer,
    info json,
    path_for_image character varying(200)
);


ALTER TABLE public.tb_types OWNER TO "Technolog";

--
-- Name: tb_types_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_types_id_seq OWNER TO "Technolog";

--
-- Name: tb_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_types_id_seq OWNED BY public.tb_types.id;


--
-- Name: tb_types_surface; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_types_surface (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    number integer
);


ALTER TABLE public.tb_types_surface OWNER TO "Technolog";

--
-- Name: tb_types_surface_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_types_surface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_types_surface_id_seq OWNER TO "Technolog";

--
-- Name: tb_types_surface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_types_surface_id_seq OWNED BY public.tb_types_surface.id;


--
-- Name: tb_workpiece_parameters; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_workpiece_parameters (
    id integer NOT NULL,
    subtype character varying(50),
    type character varying(50),
    path_for_image character varying(200),
    parameters json
);


ALTER TABLE public.tb_workpiece_parameters OWNER TO "Technolog";

--
-- Name: tb_workpiece_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_workpiece_parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_workpiece_parameters_id_seq OWNER TO "Technolog";

--
-- Name: tb_workpiece_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_workpiece_parameters_id_seq OWNED BY public.tb_workpiece_parameters.id;


--
-- Name: tb_workpiece_parameters_size; Type: TABLE; Schema: public; Owner: Technolog
--

CREATE TABLE public.tb_workpiece_parameters_size (
    id integer NOT NULL,
    id_project integer,
    id_workpiece_parameters integer
);


ALTER TABLE public.tb_workpiece_parameters_size OWNER TO "Technolog";

--
-- Name: tb_workpiece_parameters_size_id_seq; Type: SEQUENCE; Schema: public; Owner: Technolog
--

CREATE SEQUENCE public.tb_workpiece_parameters_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_workpiece_parameters_size_id_seq OWNER TO "Technolog";

--
-- Name: tb_workpiece_parameters_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Technolog
--

ALTER SEQUENCE public.tb_workpiece_parameters_size_id_seq OWNED BY public.tb_workpiece_parameters_size.id;


--
-- Name: tb_app_machines id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_machines ALTER COLUMN id SET DEFAULT nextval('public.tb_app_machines_id_seq'::regclass);


--
-- Name: tb_app_tools id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_tools ALTER COLUMN id SET DEFAULT nextval('public.tb_app_tools_id_seq'::regclass);


--
-- Name: tb_app_tools_type id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_tools_type ALTER COLUMN id SET DEFAULT nextval('public.tb_app_tools_type_id_seq'::regclass);


--
-- Name: tb_blocks id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_blocks ALTER COLUMN id SET DEFAULT nextval('public.tb_blocks_id_seq'::regclass);


--
-- Name: tb_categories_surface id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_categories_surface ALTER COLUMN id SET DEFAULT nextval('public.categories_surface_id_seq'::regclass);


--
-- Name: tb_groups id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_groups ALTER COLUMN id SET DEFAULT nextval('public.tb_groups_id_seq'::regclass);


--
-- Name: tb_materials id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_materials ALTER COLUMN id SET DEFAULT nextval('public.tb_materials_id_seq'::regclass);


--
-- Name: tb_methods id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_methods ALTER COLUMN id SET DEFAULT nextval('public.tb_methods_id_seq'::regclass);


--
-- Name: tb_name_steps id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_name_steps ALTER COLUMN id SET DEFAULT nextval('public.tb_processing_steps_id_seq'::regclass);


--
-- Name: tb_processing_steps id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_processing_steps ALTER COLUMN id SET DEFAULT nextval('public.tb_processing_steps_id_seq1'::regclass);


--
-- Name: tb_projects id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_projects ALTER COLUMN id SET DEFAULT nextval('public.tb_projects_id_seq'::regclass);


--
-- Name: tb_results_for_method id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_results_for_method ALTER COLUMN id SET DEFAULT nextval('public.tb_results_for_method_id_seq'::regclass);


--
-- Name: tb_results_for_project id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_results_for_project ALTER COLUMN id SET DEFAULT nextval('public.tb_results_id_seq'::regclass);


--
-- Name: tb_surfaces id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_surfaces ALTER COLUMN id SET DEFAULT nextval('public.tb_surfaces_id_seq'::regclass);


--
-- Name: tb_technical_operations id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_technical_operations ALTER COLUMN id SET DEFAULT nextval('public.tb_technical_operations_id_seq'::regclass);


--
-- Name: tb_types id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_types ALTER COLUMN id SET DEFAULT nextval('public.tb_types_id_seq'::regclass);


--
-- Name: tb_types_surface id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_types_surface ALTER COLUMN id SET DEFAULT nextval('public.tb_types_surface_id_seq'::regclass);


--
-- Name: tb_workpiece_parameters id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_workpiece_parameters ALTER COLUMN id SET DEFAULT nextval('public.tb_workpiece_parameters_id_seq'::regclass);


--
-- Name: tb_workpiece_parameters_size id; Type: DEFAULT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_workpiece_parameters_size ALTER COLUMN id SET DEFAULT nextval('public.tb_workpiece_parameters_size_id_seq'::regclass);


--
-- Data for Name: tb_app_machines; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_app_machines (id, name) FROM stdin;
1	M1
\.


--
-- Data for Name: tb_app_machines_methods; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_app_machines_methods (id_app_machine, id_method) FROM stdin;
1	2
1	2
1	2
1	2
1	2
\.


--
-- Data for Name: tb_app_machines_processing_steps; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_app_machines_processing_steps (id_app_machine, id_processing_step) FROM stdin;
1	1
1	1
1	1
1	1
1	1
\.


--
-- Data for Name: tb_app_tools; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_app_tools (id, name, parameters, id_app_tools_type) FROM stdin;
9	CT_1_6	{\n    "parameters": [{\n      "d": 8,\n      "h": 0\n    }]\n  }	1
1	СТ_1_2	{\n  "parameters": [{\n      "v_min": 100,\n      "v_max": 200,\n      "s_min": 200,\n      "s_max": 200,\n      "t_min": 200,\n      "t_max": 200,\n      "durab_min": 200,\n      "durab_max": 200\n    }]\n  }	2
7	CT_1_4	{\n    "parameters": [{\n      "d": 8,\n      "h": 0\n    }]\n  }	2
3	CT_1_1	{\n  "parameters": [{\n      "v_min": 100,\n      "v_max": 200,\n      "s_min": 200,\n      "s_max": 200,\n      "t_min": 100,\n      "t_max": 200,\n      "durab_min": 200,\n      "durab_max": 100\n    }]\n  }	1
\.


--
-- Data for Name: tb_app_tools_processing_steps; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_app_tools_processing_steps (id_app_tool, id_processing_step) FROM stdin;
1	1
1	1
1	1
1	1
1	1
\.


--
-- Data for Name: tb_app_tools_type; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_app_tools_type (id, name) FROM stdin;
2	TYPE-2
1	TYPE-1
\.


--
-- Data for Name: tb_blocks; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_blocks (id, name, id_surface) FROM stdin;
5	БП(0)	9
1	БП(1)	1
\.


--
-- Data for Name: tb_categories_surface; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_categories_surface (id, name, number) FROM stdin;
6	Наружная цилиндрическая поверхность	6
25	Криволинейная поверхность	3
21	Внутренняя поверхности вращения	2
20	Наружная поверхности вращения	1
22	Крепежные отверстия	4
23	Криволинейная плоскость	5
7	Наружная коническая поверхность	9
\.


--
-- Data for Name: tb_groups; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_groups (id, name, id_processing_step) FROM stdin;
1	ГП(1/1)	1
6	ГП(1/10)	1
\.


--
-- Data for Name: tb_groups_blocks; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_groups_blocks (id_group, id_blocks) FROM stdin;
1	1
\.


--
-- Data for Name: tb_groups_technical_operations; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_groups_technical_operations (id_group, id_technical_operation) FROM stdin;
1	2
\.


--
-- Data for Name: tb_materials; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_materials (id, name, measurement_system, value) FROM stdin;
1	M-1	HB	5
\.


--
-- Data for Name: tb_methods; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_methods (id, name, formulas) FROM stdin;
5	Точение	\N
2	Сверление	{\n  "formulas": [\n        {\n          "i": "h / t",\n          "n": "(1000 * v) / (pi * d)",\n          "l_de": "(Dmax - Dmin) / 2",\n          "L_2": "l_de + l_1 + l_2",\n          "L_1": "l_de + l_1 + l_2",\n          "T_2": "L_2 / (n * s) * i_2",\n          "T_1": "L_1 / (n * s) * i_1",\n          "T_m": "T_1 + T_2",\n          "T_method": "T_m + (20 * T_m / 100)",\n          "Cost_work_on_machine": "T_method * W_h",\n          "Cost_method": "Cost_work_on_machine + Cost_Ri"\n        }\n    ]\n}\n
6	Нарезание резьбы метчиком	\N
7	Фрезирование	\N
\.


--
-- Data for Name: tb_methods_results_for_method; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_methods_results_for_method (id_method, id_result_for_method) FROM stdin;
5	1
\.


--
-- Data for Name: tb_name_steps; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_name_steps (id, name) FROM stdin;
4	Тест Этап 2
\.


--
-- Data for Name: tb_processing_steps; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_processing_steps (id, id_method, id_name_step, allowance, applicability, dimensional_accuracy, cleanness_surface, physical_and_mathematical_properties) FROM stdin;
1	2	4	test	test	12	10	test
\.


--
-- Data for Name: tb_processing_steps_surfaces; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_processing_steps_surfaces (id_processing_step, id_surface) FROM stdin;
1	1
\.


--
-- Data for Name: tb_projects; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_projects (id, name, number, company_name, weight, id_material, batch_size) FROM stdin;
3	Деталь-1	2	TEST_COM-1	3	1	5
10	Деталь-2	1	TEST_COMPANY	12	1	4
\.


--
-- Data for Name: tb_results; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_results (id, name, "time", cost) FROM stdin;
1	РЕЗУЛЬТАТ(1)	5.19999981	2
\.


--
-- Data for Name: tb_results_for_method; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_results_for_method (id, name, "time", cost) FROM stdin;
1	РЕЗУЛЬТАТ(3)	5.19999981	2
\.


--
-- Data for Name: tb_results_for_project; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_results_for_project (id, name, "time", cost) FROM stdin;
1	РЕЗУЛЬТАТ(1)	5.19999981	2
3	РЕЗУЛЬТАТ(3)	6.19999981	2
\.


--
-- Data for Name: tb_results_for_project_projects; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_results_for_project_projects (id_result_for_project, id_project) FROM stdin;
1	3
3	3
\.


--
-- Data for Name: tb_results_projects; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_results_projects (id_result, id_project) FROM stdin;
1	3
1	3
1	3
1	3
\.


--
-- Data for Name: tb_surfaces; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_surfaces (id, id_type, name, number, quantity, functional, technical_processing_route) FROM stdin;
1	1	Наружная поверхность вращения, цилиндрическая	5	\N	\N	\N
9	1	Наружная поверхность вращения, плоская	5	6	\N	\N
11	\N	Наружная поверхность вращения, плоскаяz	4	2	\N	\N
\.


--
-- Data for Name: tb_technical_operations; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_technical_operations (id, name) FROM stdin;
1	ТО-2
2	ТО-1
\.


--
-- Data for Name: tb_technical_operations_projects; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_technical_operations_projects (id_technical_operation, id_project) FROM stdin;
2	3
\.


--
-- Data for Name: tb_types; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_types (id, id_type_surface, id_category_surface, info, path_for_image) FROM stdin;
1	1	6	{\n\t"values": [{\n\t\t"d_n": 17,\n\t\t"l_nc": 3,\n    "q": 3\n\t}]\n}	\N
\.


--
-- Data for Name: tb_types_surface; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_types_surface (id, name, number) FROM stdin;
11	Коническая поверхность	2
12	Контур	1
1	Цилиндрическая поверхность	3
18	Наружная поверхность точения	8
\.


--
-- Data for Name: tb_workpiece_parameters; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_workpiece_parameters (id, subtype, type, path_for_image, parameters) FROM stdin;
11	subtype-2	Round	path	{\n    "parameters": [{\n      "diameter": 7,\n      "length": 4\n    }]\n  }
9	\N	Поковка	\N	{\n    "parameters": [{\n      "diameter": 7,\n      "length": 4\n    }]\n  }
5	Круглый прокат	Сортовой прокат	primary_blanks/RoundBars.jpg	{\n    "parameters": [{\n      "diameter": 7,\n      "length": 4\n    }]\n  }
8	test	Round	path	  {\n    "parameters": [{\n      "diameter": 7,\n      "length": 4\n    }]\n  }
\.


--
-- Data for Name: tb_workpiece_parameters_size; Type: TABLE DATA; Schema: public; Owner: Technolog
--

COPY public.tb_workpiece_parameters_size (id, id_project, id_workpiece_parameters) FROM stdin;
1	3	5
3	3	5
4	3	5
\.


--
-- Name: categories_surface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.categories_surface_id_seq', 39, true);


--
-- Name: processing_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.processing_step_id_seq', 1, false);


--
-- Name: processing_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.processing_steps_id_seq', 1, false);


--
-- Name: tb_app_machines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_app_machines_id_seq', 2, true);


--
-- Name: tb_app_tools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_app_tools_id_seq', 9, true);


--
-- Name: tb_app_tools_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_app_tools_type_id_seq', 2, true);


--
-- Name: tb_blocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_blocks_id_seq', 5, true);


--
-- Name: tb_categories_surface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_categories_surface_id_seq', 1, false);


--
-- Name: tb_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_groups_id_seq', 6, true);


--
-- Name: tb_materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_materials_id_seq', 1, true);


--
-- Name: tb_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_methods_id_seq', 7, true);


--
-- Name: tb_processing_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_processing_steps_id_seq', 5, true);


--
-- Name: tb_processing_steps_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_processing_steps_id_seq1', 2, true);


--
-- Name: tb_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_projects_id_seq', 12, true);


--
-- Name: tb_results_for_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_results_for_method_id_seq', 1, true);


--
-- Name: tb_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_results_id_seq', 3, true);


--
-- Name: tb_surfaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_surfaces_id_seq', 11, true);


--
-- Name: tb_technical_operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_technical_operations_id_seq', 3, true);


--
-- Name: tb_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_types_id_seq', 23, true);


--
-- Name: tb_types_surface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_types_surface_id_seq', 21, true);


--
-- Name: tb_workpiece_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_workpiece_parameters_id_seq', 12, true);


--
-- Name: tb_workpiece_parameters_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Technolog
--

SELECT pg_catalog.setval('public.tb_workpiece_parameters_size_id_seq', 4, true);


--
-- Name: tb_app_machines tb_app_machines_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_machines
    ADD CONSTRAINT tb_app_machines_pkey PRIMARY KEY (id);


--
-- Name: tb_app_tools tb_app_tools_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_tools
    ADD CONSTRAINT tb_app_tools_pkey PRIMARY KEY (id);


--
-- Name: tb_app_tools_type tb_app_tools_type_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_tools_type
    ADD CONSTRAINT tb_app_tools_type_pkey PRIMARY KEY (id);


--
-- Name: tb_blocks tb_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_blocks
    ADD CONSTRAINT tb_blocks_pkey PRIMARY KEY (id);


--
-- Name: tb_categories_surface tb_categories_surface_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_categories_surface
    ADD CONSTRAINT tb_categories_surface_pkey PRIMARY KEY (id);


--
-- Name: tb_groups tb_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_groups
    ADD CONSTRAINT tb_groups_pkey PRIMARY KEY (id);


--
-- Name: tb_materials tb_materials_pk; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_materials
    ADD CONSTRAINT tb_materials_pk PRIMARY KEY (id);


--
-- Name: tb_methods tb_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_methods
    ADD CONSTRAINT tb_methods_pkey PRIMARY KEY (id);


--
-- Name: tb_name_steps tb_processing_steps_pk; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_name_steps
    ADD CONSTRAINT tb_processing_steps_pk PRIMARY KEY (id);


--
-- Name: tb_processing_steps tb_processing_steps_pk_2; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_processing_steps
    ADD CONSTRAINT tb_processing_steps_pk_2 PRIMARY KEY (id);


--
-- Name: tb_projects tb_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_projects
    ADD CONSTRAINT tb_projects_pkey PRIMARY KEY (id);


--
-- Name: tb_results_for_method tb_results_for_method_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_results_for_method
    ADD CONSTRAINT tb_results_for_method_pkey PRIMARY KEY (id);


--
-- Name: tb_results tb_results_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_results
    ADD CONSTRAINT tb_results_pkey PRIMARY KEY (id);


--
-- Name: tb_surfaces tb_surfaces_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_surfaces
    ADD CONSTRAINT tb_surfaces_pkey PRIMARY KEY (id);


--
-- Name: tb_technical_operations tb_technical_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_technical_operations
    ADD CONSTRAINT tb_technical_operations_pkey PRIMARY KEY (id);


--
-- Name: tb_types tb_types_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_types
    ADD CONSTRAINT tb_types_pkey PRIMARY KEY (id);


--
-- Name: tb_types_surface tb_types_surface_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_types_surface
    ADD CONSTRAINT tb_types_surface_pkey PRIMARY KEY (id);


--
-- Name: tb_workpiece_parameters tb_workpiece_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_workpiece_parameters
    ADD CONSTRAINT tb_workpiece_parameters_pkey PRIMARY KEY (id);


--
-- Name: tb_workpiece_parameters_size tb_workpiece_parameters_size_pk; Type: CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_workpiece_parameters_size
    ADD CONSTRAINT tb_workpiece_parameters_size_pk PRIMARY KEY (id);


--
-- Name: tb_app_machines_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_app_machines_name_uindex ON public.tb_app_machines USING btree (name);


--
-- Name: tb_app_tools_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_app_tools_name_uindex ON public.tb_app_tools USING btree (name);


--
-- Name: tb_app_tools_type_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_app_tools_type_name_uindex ON public.tb_app_tools_type USING btree (name);


--
-- Name: tb_blocks_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_blocks_name_uindex ON public.tb_blocks USING btree (name);


--
-- Name: tb_categories_surface_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_categories_surface_name_uindex ON public.tb_categories_surface USING btree (name);


--
-- Name: tb_categories_surface_number_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_categories_surface_number_uindex ON public.tb_categories_surface USING btree (number);


--
-- Name: tb_groups_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_groups_name_uindex ON public.tb_groups USING btree (name);


--
-- Name: tb_materials_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_materials_name_uindex ON public.tb_materials USING btree (name);


--
-- Name: tb_methods_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_methods_name_uindex ON public.tb_methods USING btree (name);


--
-- Name: tb_processing_steps_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_processing_steps_name_uindex ON public.tb_name_steps USING btree (name);


--
-- Name: tb_projects_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_projects_name_uindex ON public.tb_projects USING btree (name);


--
-- Name: tb_results_for_method_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_results_for_method_name_uindex ON public.tb_results_for_method USING btree (name);


--
-- Name: tb_results_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_results_name_uindex ON public.tb_results USING btree (name);


--
-- Name: tb_surfaces_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_surfaces_name_uindex ON public.tb_surfaces USING btree (name);


--
-- Name: tb_technical_operations_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_technical_operations_name_uindex ON public.tb_technical_operations USING btree (name);


--
-- Name: tb_types_surface_name_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_types_surface_name_uindex ON public.tb_types_surface USING btree (name);


--
-- Name: tb_workpiece_parameters_size_id_uindex; Type: INDEX; Schema: public; Owner: Technolog
--

CREATE UNIQUE INDEX tb_workpiece_parameters_size_id_uindex ON public.tb_workpiece_parameters_size USING btree (id);


--
-- Name: tb_app_machines_methods tb_app_machines_methods_id_app_machine_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_machines_methods
    ADD CONSTRAINT tb_app_machines_methods_id_app_machine_fkey FOREIGN KEY (id_app_machine) REFERENCES public.tb_app_machines(id);


--
-- Name: tb_app_machines_methods tb_app_machines_methods_id_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_machines_methods
    ADD CONSTRAINT tb_app_machines_methods_id_method_fkey FOREIGN KEY (id_method) REFERENCES public.tb_methods(id);


--
-- Name: tb_app_machines_processing_steps tb_app_machines_processing_steps_id_app_machine_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_machines_processing_steps
    ADD CONSTRAINT tb_app_machines_processing_steps_id_app_machine_fkey FOREIGN KEY (id_app_machine) REFERENCES public.tb_app_machines(id);


--
-- Name: tb_app_machines_processing_steps tb_app_machines_processing_steps_id_processing_step_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_machines_processing_steps
    ADD CONSTRAINT tb_app_machines_processing_steps_id_processing_step_fkey FOREIGN KEY (id_processing_step) REFERENCES public.tb_processing_steps(id);


--
-- Name: tb_technical_operations_projects tb_app_technical_operations_project_id_technical_operation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_technical_operations_projects
    ADD CONSTRAINT tb_app_technical_operations_project_id_technical_operation_fkey FOREIGN KEY (id_technical_operation) REFERENCES public.tb_technical_operations(id);


--
-- Name: tb_technical_operations_projects tb_app_technical_operations_projects_id_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_technical_operations_projects
    ADD CONSTRAINT tb_app_technical_operations_projects_id_project_fkey FOREIGN KEY (id_project) REFERENCES public.tb_projects(id);


--
-- Name: tb_app_tools tb_app_tools; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_tools
    ADD CONSTRAINT tb_app_tools FOREIGN KEY (id_app_tools_type) REFERENCES public.tb_app_tools_type(id);


--
-- Name: tb_app_tools_processing_steps tb_app_tools_processing_steps_id_app_tool_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_tools_processing_steps
    ADD CONSTRAINT tb_app_tools_processing_steps_id_app_tool_fkey FOREIGN KEY (id_app_tool) REFERENCES public.tb_app_tools(id);


--
-- Name: tb_app_tools_processing_steps tb_app_tools_processing_steps_id_processing_step_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_app_tools_processing_steps
    ADD CONSTRAINT tb_app_tools_processing_steps_id_processing_step_fkey FOREIGN KEY (id_processing_step) REFERENCES public.tb_processing_steps(id);


--
-- Name: tb_blocks tb_blocks; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_blocks
    ADD CONSTRAINT tb_blocks FOREIGN KEY (id_surface) REFERENCES public.tb_surfaces(id);


--
-- Name: tb_groups tb_groups; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_groups
    ADD CONSTRAINT tb_groups FOREIGN KEY (id_processing_step) REFERENCES public.tb_processing_steps(id);


--
-- Name: tb_groups_blocks tb_groups_blocks_id_blocks_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_groups_blocks
    ADD CONSTRAINT tb_groups_blocks_id_blocks_fkey FOREIGN KEY (id_blocks) REFERENCES public.tb_blocks(id);


--
-- Name: tb_groups_blocks tb_groups_blocks_id_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_groups_blocks
    ADD CONSTRAINT tb_groups_blocks_id_group_fkey FOREIGN KEY (id_group) REFERENCES public.tb_groups(id);


--
-- Name: tb_groups_technical_operations tb_groups_technical_operations_id_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_groups_technical_operations
    ADD CONSTRAINT tb_groups_technical_operations_id_group_fkey FOREIGN KEY (id_group) REFERENCES public.tb_groups(id);


--
-- Name: tb_groups_technical_operations tb_groups_technical_operations_id_technical_operation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_groups_technical_operations
    ADD CONSTRAINT tb_groups_technical_operations_id_technical_operation_fkey FOREIGN KEY (id_technical_operation) REFERENCES public.tb_technical_operations(id);


--
-- Name: tb_methods_results_for_method tb_methods_results_for_method_id_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_methods_results_for_method
    ADD CONSTRAINT tb_methods_results_for_method_id_method_fkey FOREIGN KEY (id_method) REFERENCES public.tb_methods(id);


--
-- Name: tb_methods_results_for_method tb_methods_results_for_method_id_result_for_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_methods_results_for_method
    ADD CONSTRAINT tb_methods_results_for_method_id_result_for_method_fkey FOREIGN KEY (id_result_for_method) REFERENCES public.tb_results_for_method(id);


--
-- Name: tb_processing_steps tb_processing_steps_id_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_processing_steps
    ADD CONSTRAINT tb_processing_steps_id_method_fkey FOREIGN KEY (id_method) REFERENCES public.tb_methods(id);


--
-- Name: tb_processing_steps tb_processing_steps_id_name_step_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_processing_steps
    ADD CONSTRAINT tb_processing_steps_id_name_step_fkey FOREIGN KEY (id_name_step) REFERENCES public.tb_name_steps(id);


--
-- Name: tb_processing_steps_surfaces tb_processing_steps_surfaces_id_processing_step_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_processing_steps_surfaces
    ADD CONSTRAINT tb_processing_steps_surfaces_id_processing_step_fkey FOREIGN KEY (id_processing_step) REFERENCES public.tb_processing_steps(id);


--
-- Name: tb_processing_steps_surfaces tb_processing_steps_surfaces_id_surface_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_processing_steps_surfaces
    ADD CONSTRAINT tb_processing_steps_surfaces_id_surface_fkey FOREIGN KEY (id_surface) REFERENCES public.tb_surfaces(id);


--
-- Name: tb_projects tb_project_id_material_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_projects
    ADD CONSTRAINT tb_project_id_material_fkey FOREIGN KEY (id_material) REFERENCES public.tb_materials(id);


--
-- Name: tb_results_projects tb_results_projects_id_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_results_projects
    ADD CONSTRAINT tb_results_projects_id_project_fkey FOREIGN KEY (id_project) REFERENCES public.tb_projects(id);


--
-- Name: tb_results_for_project_projects tb_results_projects_id_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_results_for_project_projects
    ADD CONSTRAINT tb_results_projects_id_project_fkey FOREIGN KEY (id_project) REFERENCES public.tb_projects(id);


--
-- Name: tb_results_projects tb_results_projects_id_result_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_results_projects
    ADD CONSTRAINT tb_results_projects_id_result_fkey FOREIGN KEY (id_result) REFERENCES public.tb_results(id);


--
-- Name: tb_surfaces tb_surfaces_id_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_surfaces
    ADD CONSTRAINT tb_surfaces_id_type_fkey FOREIGN KEY (id_type) REFERENCES public.tb_types(id);


--
-- Name: tb_types tb_types_id_category_surface_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_types
    ADD CONSTRAINT tb_types_id_category_surface_fkey FOREIGN KEY (id_category_surface) REFERENCES public.tb_categories_surface(id);


--
-- Name: tb_types tb_types_id_type_surface_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_types
    ADD CONSTRAINT tb_types_id_type_surface_fkey FOREIGN KEY (id_type_surface) REFERENCES public.tb_types_surface(id);


--
-- Name: tb_workpiece_parameters_size tb_workpiece_parameters_size_id_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_workpiece_parameters_size
    ADD CONSTRAINT tb_workpiece_parameters_size_id_project_fkey FOREIGN KEY (id_project) REFERENCES public.tb_projects(id);


--
-- Name: tb_workpiece_parameters_size tb_workpiece_parameters_size_id_workpiece_parameters_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Technolog
--

ALTER TABLE ONLY public.tb_workpiece_parameters_size
    ADD CONSTRAINT tb_workpiece_parameters_size_id_workpiece_parameters_fkey FOREIGN KEY (id_workpiece_parameters) REFERENCES public.tb_workpiece_parameters(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: azure_superuser
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO azure_superuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

