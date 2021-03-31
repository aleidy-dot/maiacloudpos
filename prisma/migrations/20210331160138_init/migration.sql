-- CreateTable
CREATE TABLE "Cliente" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Factura" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "invoiceNo" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "taxRate" INTEGER NOT NULL,
    "issueDate" TEXT NOT NULL,
    "dueDate" TEXT NOT NULL,
    "note" TEXT NOT NULL,
    "taxAmount" INTEGER NOT NULL,
    "subTotal" INTEGER NOT NULL,
    "total" TEXT NOT NULL,
    "amountPaid" INTEGER NOT NULL,
    "outstandingBalance" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "clienteId" INTEGER,
    FOREIGN KEY ("clienteId") REFERENCES "Cliente" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Producto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT,
    "description" TEXT NOT NULL,
    "cantidadPresentacion" INTEGER NOT NULL,
    "precio" INTEGER NOT NULL,
    "codigo" TEXT NOT NULL,
    "Iva" INTEGER NOT NULL,
    "imagen" TEXT NOT NULL,
    "descmaxprod" REAL NOT NULL,
    "productoCategoriaId" INTEGER,
    "marcaLineaId" INTEGER,
    "marcaId" INTEGER,
    FOREIGN KEY ("productoCategoriaId") REFERENCES "ProductoCategoria" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY ("marcaLineaId") REFERENCES "MarcaLinea" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY ("marcaId") REFERENCES "Marca" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProductoCodigo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "codigo" TEXT NOT NULL,
    "codigoInterno" TEXT NOT NULL,
    "productoId" INTEGER,
    FOREIGN KEY ("productoId") REFERENCES "Producto" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Lote" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "codigo" TEXT NOT NULL,
    "fechaVencimiento" DATETIME NOT NULL,
    "productoId" INTEGER,
    FOREIGN KEY ("productoId") REFERENCES "Producto" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProductoImagen" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ruta" TEXT NOT NULL,
    "productoId" INTEGER,
    FOREIGN KEY ("productoId") REFERENCES "Producto" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProductoPrecio" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "precio" REAL NOT NULL,
    "productoId" INTEGER,
    FOREIGN KEY ("productoId") REFERENCES "Producto" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProductoCaracteristca" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "valor" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "ProductoCategoria" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "valor" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "MarcaLinea" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "valor" BOOLEAN NOT NULL,
    "marcaId" INTEGER,
    FOREIGN KEY ("marcaId") REFERENCES "Marca" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Marca" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "telefono" INTEGER NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "LineaFactura" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cantidad" INTEGER NOT NULL,
    "Total" DECIMAL NOT NULL,
    "facturaId" INTEGER,
    "productoId" INTEGER NOT NULL,
    FOREIGN KEY ("facturaId") REFERENCES "Factura" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY ("productoId") REFERENCES "Producto" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_ProductoToProductoCaracteristca" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    FOREIGN KEY ("A") REFERENCES "Producto" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "ProductoCaracteristca" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "LineaFactura_productoId_unique" ON "LineaFactura"("productoId");

-- CreateIndex
CREATE UNIQUE INDEX "_ProductoToProductoCaracteristca_AB_unique" ON "_ProductoToProductoCaracteristca"("A", "B");

-- CreateIndex
CREATE INDEX "_ProductoToProductoCaracteristca_B_index" ON "_ProductoToProductoCaracteristca"("B");
