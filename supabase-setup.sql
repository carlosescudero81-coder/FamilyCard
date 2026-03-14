-- ════════════════════════════════════════════════
-- FAMILYCART — Setup SQL para Supabase
-- Copia y pega esto en Supabase → SQL Editor → Run
-- ════════════════════════════════════════════════

-- 1. FAMILIAS
create table if not exists families (
  id         uuid primary key default gen_random_uuid(),
  name       text not null,
  code       text unique not null,
  owner_id   uuid references auth.users(id),
  created_at timestamptz default now()
);

-- 2. MIEMBROS DE FAMILIA
create table if not exists family_members (
  id         uuid primary key default gen_random_uuid(),
  family_id  uuid references families(id) on delete cascade,
  user_id    uuid references auth.users(id) on delete cascade,
  created_at timestamptz default now(),
  unique(family_id, user_id)
);

-- 3. ITEMS DE LA LISTA
create table if not exists items (
  id         uuid primary key default gen_random_uuid(),
  family_id  uuid references families(id) on delete cascade,
  name       text not null,
  quantity   text,
  checked    boolean default false,
  archived   boolean default false,
  created_at timestamptz default now()
);

-- 4. HISTORIAL DE COMPRAS
create table if not exists history (
  id              uuid primary key default gen_random_uuid(),
  family_id       uuid references families(id) on delete cascade,
  item_count      int,
  items_snapshot  text,
  created_at      timestamptz default now()
);

-- ════════════════════════════════════════════════
-- SEGURIDAD: Row Level Security (RLS)
-- Solo tu familia puede ver tus datos
-- ════════════════════════════════════════════════

alter table families       enable row level security;
alter table family_members enable row level security;
alter table items          enable row level security;
alter table history        enable row level security;

-- Familias: solo miembros pueden ver
create policy "family members can read" on families
  for select using (
    id in (
      select family_id from family_members
      where user_id = auth.uid()
    )
  );

create policy "authenticated can insert family" on families
  for insert with check (auth.uid() = owner_id);

-- family_members: acceso propio
create policy "members read own" on family_members
  for select using (user_id = auth.uid() or family_id in (
    select family_id from family_members where user_id = auth.uid()
  ));

create policy "members insert" on family_members
  for insert with check (auth.uid() is not null);

-- Items: solo tu familia
create policy "items family read" on items
  for select using (
    family_id in (
      select family_id from family_members where user_id = auth.uid()
    )
  );

create policy "items family insert" on items
  for insert with check (
    family_id in (
      select family_id from family_members where user_id = auth.uid()
    )
  );

create policy "items family update" on items
  for update using (
    family_id in (
      select family_id from family_members where user_id = auth.uid()
    )
  );

create policy "items family delete" on items
  for delete using (
    family_id in (
      select family_id from family_members where user_id = auth.uid()
    )
  );

-- History: solo tu familia
create policy "history family read" on history
  for select using (
    family_id in (
      select family_id from family_members where user_id = auth.uid()
    )
  );

create policy "history family insert" on history
  for insert with check (
    family_id in (
      select family_id from family_members where user_id = auth.uid()
    )
  );

-- ════════════════════════════════════════════════
-- REALTIME: activar para items
-- ════════════════════════════════════════════════
alter publication supabase_realtime add table items;

-- ════════════════════════════════════════════════
-- ✅ LISTO — Ahora ve a la app y configura las keys
-- ════════════════════════════════════════════════
