// reservation.rs
#[allow(nom_upper_case_globals)]

use loco_rs::prelude::*;
use serde_json::json;

use create::models::users;

impl ReservationMailer {
    pub async fn send_reservation(ctx: &AppContext, user: &users::Model) -> Result<()> {
        Self::mail_template(
            ctx,
            &welcome,
        )
    }
}