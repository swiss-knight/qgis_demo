-- INIT database script
DROP TABLE IF EXISTS public.family;
DROP TABLE IF EXISTS public.flower;

CREATE TABLE IF NOT EXISTS public.family( -- parent table
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "name" VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS public.flower( -- child table
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  species_id INT NOT NULL REFERENCES public.family(id) ON DELETE CASCADE,
  geom GEOMETRY(POINT, 4326) NOT NULL
);

CREATE INDEX ON public.flower(species_id);
CREATE INDEX ON public.flower USING GIST(geom);

INSERT INTO public.family("name") VALUES
  ('Asteraceae'),
  ('Fabaceae'),
  ('Lamiaceae'),
  ('Brassicaceae'),
  ('Poaceae'),
  ('Iridaceae');

INSERT INTO public.flower(species_id, geom) VALUES
  (1, ST_GeomFromText('POINT(9.171556 46.830251)')),
  (1, ST_GeomFromText('POINT(9.172019 46.828912)')),
  (2, ST_GeomFromText('POINT(9.171404 46.840012)')),
  (2, ST_GeomFromText('POINT(9.170045 46.837450)')),
  (3, ST_GeomFromText('POINT(9.174290 46.830297)'));
