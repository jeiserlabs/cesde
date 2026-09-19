# 🎨 Anotaciones de Clase: CSS Flexbox
> **Fecha:** 19 de Septiembre de 2026  
> **Materia:** Introducción a la Programación / Frontend (CESDE)  
> **Tema:** Flexbox (Flexible Box Layout Model)

---

## 📌 1. ¿Qué es Flexbox?
Es un modelo de maquetación unidimensional ($1\text{D}$) de CSS diseñado para distribuir el espacio entre los elementos de una interfaz y mejorar sus capacidades de alineación, incluso cuando sus dimensiones son desconocidas o dinámicas.

---

## 📦 2. Propiedades del Contenedor Padre (`Flex Container`)

```css
.contenedor {
    display: flex; /* Activa el contexto flexbox en los hijos directos */
}
```

### A. Dirección del Eje (`flex-direction`)
Determina el **eje principal** (*Main Axis*):
* `row` (predeterminado): Elementos en fila horizontal de izquierda a derecha.
* `row-reverse`: Fila horizontal invertida.
* `column`: Elementos en columna vertical de arriba a abajo.
* `column-reverse`: Columna vertical de abajo a arriba.

### B. Alineación en Eje Principal (`justify-content`)
Alinea a lo largo de la dirección definida por `flex-direction`:
* `flex-start` (predeterminado): Al inicio del contenedor.
* `center`: Centrado en el eje principal.
* `flex-end`: Al final del contenedor.
* `space-between`: Primer y último hijo pegados a los bordes; espacio uniforme entre ellos.
* `space-around`: Espacio idéntico a los lados de cada elemento (los espacios entre elementos se suman).
* `space-evenly`: Espacio exactamente idéntico entre bordes y entre elementos.

### C. Alineación en Eje Secundario (`align-items`)
Alinea a lo largo del **eje transversal** (*Cross Axis*, perpendicular al principal):
* `stretch` (predeterminado): Los hijos se estiran para ocupar toda la altura/ancho del contenedor.
* `center`: Centrado perpendicular.
* `flex-start`: Alineado al inicio del eje secundario.
* `flex-end`: Alineado al final del eje secundario.
* `baseline`: Alineado según la línea base del texto de cada hijo.

### D. Envoltura de Línea (`flex-wrap`)
* `nowrap` (predeterminado): Todos los elementos se comprimen en una sola fila/columna.
* `wrap`: Si no caben en pantalla, saltan automáticamente a la siguiente línea.

### E. Separación Limpia (`gap`)
* `gap: 15px;`: Reemplaza la necesidad de aplicar `margin` manual a los hijos.
* `row-gap`: Separación entre filas.
* `column-gap`: Separación entre columnas.

---

## 🧱 3. Propiedades de los Elementos Hijos (`Flex Items`)

* `flex: 1;`: El elemento absorbe proporcionalmente el espacio vacío disponible.
* `align-self`: Sobrescribe `align-items` del padre únicamente para este elemento (`flex-start`, `center`, `flex-end`).
* `order`: Número entero (`1`, `2`, `-1`) que cambia la secuencia de renderizado visual sin modificar el HTML.

---

## 💡 4. El "Centrado Perfecto" Absoluto

```css
.pantalla-completa {
    display: flex;
    justify-content: center; /* Centrado en eje principal */
    align-items: center;     /* Centrado en eje secundario */
    height: 100vh;           /* 100% de la altura de la ventana */
}
```
