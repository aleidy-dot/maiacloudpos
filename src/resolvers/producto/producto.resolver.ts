import {Args, ID, Int, Mutation, Parent, Query, ResolveField, Resolver } from "@nestjs/graphql";
import { PrismaService } from "src/services/prisma.service";
import { ProductoService } from "src/services/producto.service";
import { Producto } from "src/models/producto.model";
import { ProductoInput } from "src/models/inputs/crearproducto.input";
@Resolver(of =>Producto)
export class ProductoResolver {
  constructor(private readonly prismaService: PrismaService,
    private readonly productoService: ProductoService,) {}
    

   @Query(returns => Producto)
  async producto(@Args('id', { type: () => Int }) id: number) {
    return this.productoService.producto({ id: Number(id) });
}

@Query(returns =>[Producto])
async findAll(): Promise<any[]> {
  return await this.productoService.findAll();
}

@Mutation(() => Producto)
  async createItem(@Args('input') input: ProductoInput): Promise<ProductoModel> {
    return this.productoService.createProducto(input);
  }
}