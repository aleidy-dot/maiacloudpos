import { Field, ObjectType } from "@nestjs/graphql";
import { Producto } from "./producto.model";

@ObjectType()
 export class LineaFactura{
  @Field()
  description: string;

  @Field()
  cantidad: number;

  @Field()
  total: number 
  @Field(type => Producto, { nullable: false })
  producto : Producto;
}
