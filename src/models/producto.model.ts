import { Field, Float, Int, ObjectType } from "@nestjs/graphql";

@ObjectType()
export class Producto{
  @Field(type => Int)
  id: number;
  @Field({ nullable: true })
  nombre: string;
  @Field({ nullable: true })
  description: string;
  @Field(type => Int)
  cantidadPresentacion: number;
  @Field({ nullable: true })
  precio: number;
  @Field({ nullable: true })
  codigo: string 
  @Field({ nullable: true })
  Iva: number;
  @Field({ nullable: true })
  imagen: string;
  @Field(type => Float)
  descmaxprod:number;
  @Field(type => [ProductoCodigo])
  productoCodigos: ProductoCodigo[]
}

@ObjectType()
export class ProductoCodigo{
  @Field()
  codigo: string;

  @Field()
  codigointerno: string;
  
}

/* lotes                   Lote[]
productoImagenes        ProductoImagen[]
productoPrecios         ProductoPrecio[]
productoCaracteristicas ProductoCaracteristca[]
ProductoCategoria       ProductoCategoria?      @relation(fields: [productoCategoriaId], references: [id])
productoCategoriaId     Int?
MarcaLinea              MarcaLinea?             @relation(fields: [marcaLineaId], references: [id])
marcaLineaId            Int?
Marca                   Marca?                  @relation(fields: [marcaId], references: [id])
marcaId                 Int?
lineaFactra               LineaFactura? */