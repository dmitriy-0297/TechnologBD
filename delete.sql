--Удаления:

--каскад для удаления/ поверхностей
  ALTER TABLE tb_blocks
  DROP CONSTRAINT tb_blocks,
  ADD CONSTRAINT tb_blocks FOREIGN KEY (id_surface) REFERENCES tb_surfaces (id)
  ON DELETE CASCADE;

  ALTER TABLE tb_groups_blocks
  ADD CONSTRAINT tb_groups_blocks_id_block_fkey FOREIGN KEY (id_blocks) REFERENCES tb_blocks (id)
  ON DELETE CASCADE;

  --удаление поверхностей
  CREATE OR REPLACE FUNCTION delete_surface(name_surface character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_surfaces WHERE tb_surfaces.name = name_surface) THEN
      DELETE FROM tb_surfaces WHERE tb_surfaces.name = name_surface;
    ELSE
      RAISE EXCEPTION 'Name not found';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT delete_surface('test');

  --удаление блоков
  CREATE OR REPLACE FUNCTION delete_block(name_block character varying) RETURNS VOID AS
    $$
    BEGIN
      IF EXISTS(SELECT 1 FROM tb_blocks WHERE tb_blocks.name = name_block) THEN
        DELETE FROM tb_blocks WHERE tb_blocks.name = name_block;
      ELSE
        RAISE EXCEPTION 'Name not found';
      END IF;
    END;
    $$
      LANGUAGE 'plpgsql';

  ----
  SELECT delete_block('БП(test)');

  --каскад для удаления групп
  ALTER TABLE tb_groups_technical_operations
  DROP CONSTRAINT tb_groups_technical_operations_id_group_fkey,
  ADD CONSTRAINT tb_groups_technical_operations_id_group_fkey FOREIGN KEY (id_group) REFERENCES tb_groups (id)
  ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE tb_groups_blocks
  ADD CONSTRAINT tb_groups_blocks_id_group_fkey FOREIGN KEY (id_group) REFERENCES tb_groups (id)
  ON DELETE CASCADE ON UPDATE CASCADE;

   --удаление групп
  CREATE OR REPLACE FUNCTION delete_group(name_group character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_groups WHERE tb_groups.name = name_group) THEN
      DELETE FROM tb_groups WHERE tb_groups.name = name_group;
    ELSE
      RAISE EXCEPTION 'Name not found';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT delete_group('TEST');

  --каскад для удаления операций
  ALTER TABLE tb_groups_technical_operations
  DROP CONSTRAINT tb_groups_technical_operations_id_technical_operation_fkey,
  ADD CONSTRAINT tb_groups_technical_operations_id_technical_operation_fkey FOREIGN KEY (id_technical_operation) REFERENCES tb_technical_operations (id)
  ON DELETE CASCADE ON UPDATE CASCADE;

  ALTER TABLE tb_technical_operations_projects
  DROP CONSTRAINT tb_app_technical_operations_project_id_technical_operation_fkey,
  ADD CONSTRAINT tb_technical_operations_project_id_technical_operation_fkey FOREIGN KEY (id_technical_operation) REFERENCES tb_technical_operations (id)
  ON DELETE CASCADE ON UPDATE CASCADE;

  --удаление операций
  CREATE OR REPLACE FUNCTION delete_technical_operations(name_to character varying) RETURNS VOID AS
  $$
  BEGIN
    IF EXISTS(SELECT 1 FROM tb_technical_operations WHERE tb_technical_operations.name = name_to) THEN
      DELETE FROM tb_technical_operations WHERE tb_technical_operations.name = name_to;
    ELSE
      RAISE EXCEPTION 'Name not found';
    END IF;
  END;
  $$
    LANGUAGE 'plpgsql';

  ----
  SELECT delete_technical_operations('TO-TEST');
