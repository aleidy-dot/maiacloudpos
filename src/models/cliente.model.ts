
import { ObjectType, Field } from '@nestjs/graphql';
import { FacturaModel } from './factura.model';

@ObjectType()
export class ClienteModel {
  @Field(type => String)
  id: string;
  @Field(type => String)
  name: string;
  @Field(type => String)
  email: string;
  @Field(type => String)
  phone: string;
  @Field(type => String)
  address: string;

  @Field(type => [FacturaModel], { nullable: true })
  facturas: FacturaModel[]
  @Field(type => Date)
  created_at: Date;
  @Field(type => Date)
  updated_at: Date;
}