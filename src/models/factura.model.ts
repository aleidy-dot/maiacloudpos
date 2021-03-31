
import { ObjectType, Field } from '@nestjs/graphql';
import { ClienteModel } from './cliente.model';
import { Producto } from './producto.model';



@ObjectType()
export class FacturaModel {
  @Field()
  id: string;

  @Field()
  invoiceNo: string;

  @Field()
  description: string;

  @Field(type => ClienteModel)
  customer: ClienteModel;

  @Field()
  taxRate: number;

  @Field()
  issueDate: string;

  @Field()
  dueDate: string;

  @Field()
  note: string;

  @Field( type => [Producto])
  productos: Producto[];
  @Field()
  taxAmount: number;
  @Field()
  subTotal: number;
  @Field()
  total: string;
  @Field()
  amountPaid: number;
  @Field()
  outstandingBalance: number;

  @Field()
  createdAt: Date;

  @Field()
  updatedAt: Date;
}


