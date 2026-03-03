## Contribuir

### Objetivo

Mantener `main` siempre en estado deployable, con PRs pequeños y frecuentes.

### Tamaño y cadencia

- PR ideal: **< 300 líneas netas**, enfocado en 1 objetivo.
- Rama ideal: **horas**, máximo **1 día**.
- Si el cambio es grande: divide en slices y usa **flags** o **branch by abstraction**.

### Convenciones

- **Nombres de ramas**:
  - `feat/<tema-corto>`
  - `fix/<bug-corto>`
  - `chore/<mantenimiento>`
- **Mensajes de commit**: claros y orientados a intención (por qué).
- **Merge**: preferir *squash merge* en `main`.

### Checklist antes de abrir PR

- [ ] Corrí `make check`
- [ ] El cambio está detrás de un flag o mantiene compatibilidad si no está “terminado”
- [ ] Actualicé README/guías si cambié el flujo o la operación

### Checklist de reviewer

- [ ] El PR es pequeño y entendible
- [ ] No introduce trabajo incompleto sin flag
- [ ] Riesgo y plan de prueba están claros

### Qué hacer si se rompe `main`

- Revert rápido (prioridad).
- Reintentar con PR más pequeño o con mejor aislamiento (flag/abstracción).
