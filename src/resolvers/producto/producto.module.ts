  
import { Module } from '@nestjs/common';
import { ProductoService } from 'src/services/producto.service';
import { PrismaService } from '../../services/prisma.service';
import { ProductoResolver } from './producto.resolver';

@Module({
  providers: [ProductoResolver, PrismaService, ProductoService],
  exports: [ProductoService],
})
export class ProductoModule {}