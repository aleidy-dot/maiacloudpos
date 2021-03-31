import { Injectable } from "@nestjs/common";
import { Prisma, Producto } from "@prisma/client";
import { PrismaService } from "./prisma.service";

@Injectable()
export class ProductoService {
  constructor(private prisma: PrismaService) {}

  async producto(productoWhereUniqueInput: Prisma.ProductoWhereUniqueInput): Promise<Producto | null> {
    return this.prisma.producto.findUnique({
      where: productoWhereUniqueInput,
    });
  }


async  findAll(): Promise<Producto[]> {
  return this.prisma.producto.findMany();
}


async createProducto(data: Prisma.ProductoCreateInput): Promise<Producto> {
  return this.prisma.producto.create({
    data,
  });
}

}