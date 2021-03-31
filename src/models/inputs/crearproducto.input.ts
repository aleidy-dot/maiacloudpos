import { Field, Float, Int, ObjectType } from "@nestjs/graphql";

@ObjectType()
export class Producto{
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
  productoCodigos: Array<{ codigo: string; codigointrno: string }>;
}

@ObjectType()
export class ProductoCodigo{
  @Field()
  codigo: string;

  @Field()
  codigointerno: string;
  
}