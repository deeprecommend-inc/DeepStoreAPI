use std::borrow::BorrowMut;

use loco_rs::schema::*;
use sea_orm_migration::prelude::*;

#[derive(DeriveMigrationName)]
pub struct Migration;

#[async_trait::async_trait]
impl MigrationTrait for Migration {
    async fn up(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .create_table(
                table_auto(Reservations::Table)
                    .col(pk_auto(Reservations::Id).borrow_mut())
                    .col(string_null(Reservations::ReservationDate).borrow_mut())
                    .col(string_null(Reservations::ArrivalDate).borrow_mut())
                    .col(string_null(Reservations::Location).borrow_mut())
                    .col(string_null(Reservations::StoreName).borrow_mut())
                    .col(string_null(Reservations::SendTo).borrow_mut())
                    .to_owned(),
            )
            .await
    }

    async fn down(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .drop_table(Table::drop().table(Reservations::Table).to_owned())
            .await
    }
}

#[derive(DeriveIden)]
enum Reservations {
    Table,
    Id,
    ReservationDate,
    ArrivalDate,
    Location,
    StoreName,
    SendTo,
    
}


