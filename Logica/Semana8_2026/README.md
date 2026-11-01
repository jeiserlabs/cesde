# Semana 8 — Tienda Virtual y CineExpress (Lógica de Programación)

**Docente:** Ana Liliana Vera Gómez
**Tema:** estructuras de control `SI` y `CASO` (`switch-case`)
**Fecha:** octubre de 2026

## Ejercicio principal: Tienda en Línea

Se debe calcular el descuento de un cliente aplicando dos factores independientes:

| Factor | Regla |
|---|---|
| Tipo de cliente (`CASO`) | 1 Nuevo → 5 %; 2 Frecuente → 10 %; 3 VIP → 15 % |
| Monto de compra (`SI`) | `>= 10.000.000 COP` → 15 % adicional; `< 10.000.000 COP` → 5 % adicional |

Fórmulas:

```text
rebajaBase    = montoBruto * (porcBase / 100)
rebajaVolumen = montoBruto * (porcVolumen / 100)
rebajaTotal   = rebajaBase + rebajaVolumen
montoNeto     = montoBruto - rebajaTotal
```

## Archivos

| Archivo | Descripción |
|---|---|
| `TiendaVirtual_Semana8.java` | Implementación en Java con `Scanner`, `switch` e `if-else`. |
| `TiendaVirtual_Semana8.psc` | Pseudocódigo PSeInt con inicialización directa (sin `Definir`). |
| `TiendaVirtual_Analisis_EPS.txt` | Análisis Entrada–Proceso–Salida y reglas del ejercicio. |
| `CineExpress_VarianteSemana8.java` | Variante CineExpress con variables alternativas. |
| [PDF del taller](https://drive.google.com/drive/folders/1xjp04GhG3Pz1xnCjydvZG8IhUQgX8rdj) | Enunciado, mapeo de variables y código completo (Drive). |
| [ZIP de entregables](https://drive.google.com/drive/folders/1xjp04GhG3Pz1xnCjydvZG8IhUQgX8rdj) | Empaquetado de la variante para Sebastián (Drive privado). |

> La variante `para_sebastian/` se guarda solo en Drive: es trabajo de otro estudiante y no se publica en GitHub.
> Regla de la docente: PSeInt en perfil flexible, sin `Definir ... Como Tipo`; las variables se inicializan con `=` al inicio.
