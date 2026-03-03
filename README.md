## Trunk‑Based Development (flujo del equipo)

Este repo sigue **Trunk‑Based Development**: cambios pequeños, integración frecuente y `main` siempre en estado deployable.

### Ramas y entornos

- **`main` (trunk)**: rama principal. Cada merge a `main` se despliega a **dev** (al principio manual; luego automático con CI/CD).
- **`prepro`**: rama de promoción a **preproducción**. Solo el **tech lead** promueve cambios desde `main` a `prepro`.

Regla de oro: **nadie trabaja en ramas largas**. Todo se integra a `main` en horas (máximo 1 día).

### Cómo trabajamos (desarrollador/a)

- **Crear rama corta** desde `main`:
  - `feat/<tema-corto>` (feature)
  - `fix/<bug-corto>` (bugfix)
  - `chore/<mantenimiento>` (infra, deps, etc.)
- **Commits pequeños** y PR pequeño (ideal: 1–3 commits, < 300 líneas netas).
- **Antes de abrir PR / antes de pedir review**:
  - Ejecuta `make check`
  - Si el cambio está “incompleto”, debe ir **detrás de un flag** o mantener compatibilidad (branch by abstraction).
- **PR a `main`**:
  - Descripción clara del objetivo y del riesgo.
  - Plan de prueba (qué se probó en dev/local).
  - Si aplica: flag usado y cómo activarlo.
- **Merge a `main`** (sugerido: *squash merge*):
  - Mantiene historia limpia y PRs fáciles de revertir.

### Promoción a prepro (tech lead)

`prepro` es una **rama de promoción**, no una rama de desarrollo.

Flujo recomendado:

- Abrir PR **`main` → `prepro`** con título tipo: `Promote main to prepro (YYYY-MM-DD)`
- Verificar en dev (smoke test) y revisar cambios de alto riesgo.
- Merge del PR y despliegue de `prepro` a preproducción.

### Reglas sin CI (por ahora)

Hasta que exista CI, el “gate” es **local + revisión**:

- Todo PR debe incluir evidencia de `make check` (pega el output o marca checklist).
- Si se rompe `main`, se prioriza **revert rápido** y luego se reintenta.

### Checks locales (uv)

Instalar dependencias (incluye dev tools):

```bash
uv sync --all-groups
```

Ejecutar formato, lint y tests:

```bash
make check
```

### Cuando activemos CI

Este repo incluye workflows listos para que `main` no se rompa:

- Lint/format (ruff)
- Tests (pytest)

Al habilitar CI, se recomienda protección de ramas:

- **`main`**: requiere PR + 1 review + checks verdes.
- **`prepro`**: solo TL puede mergear + checks verdes.
