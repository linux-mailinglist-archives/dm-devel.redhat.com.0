Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D807DE0D7F
	for <lists+dm-devel@lfdr.de>; Tue, 22 Oct 2019 22:46:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571777194;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C+jOYXOpg2H2IDfq+5rHWSlMoLhocFBwj3kBrD84Ads=;
	b=EmySl4Lt5jCCY9b6y5IuB7z3Jh4LpVTsOkd7Tc2fxsRudaP1K8DACf336dF3TTUFVbk+5T
	o24lRzviES8Pf4YZdzGnlOg346QsGtgQNFIUFBS1pzRbjZ2hridbblPxpTRRqseb/dNsHP
	z5rzDE+5PvWll54z13fJrdA4MjVQlKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-JNgQtYeqOGm4pqdM_CG0EQ-1; Tue, 22 Oct 2019 16:46:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23471800D53;
	Tue, 22 Oct 2019 20:46:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 330C460C4E;
	Tue, 22 Oct 2019 20:46:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 140DA18089DC;
	Tue, 22 Oct 2019 20:46:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9MKkD6Z023539 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Oct 2019 16:46:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E38A360628; Tue, 22 Oct 2019 20:46:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (unknown [10.18.25.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94E8660619;
	Tue, 22 Oct 2019 20:46:07 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Tue, 22 Oct 2019 16:46:01 -0400
Message-Id: <1571777161-12082-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH RFC] dm dust: add limited write failure mode
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: JNgQtYeqOGm4pqdM_CG0EQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Add a limited write failure mode, which will allow a write to a
block to fail a specified amount of times, prior to remapping.

Add an interface for limited write failures, to be added by the
following message:

(Example: add bad block on block 60, with 5 write failures)

dmsetup message 0 dust1 addbadblock 60 5

The write failure counter will be printed for newly added
bad blocks.

Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/md/dm-dust.c | 48 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 8288887b7f94..3aecc0cb0fbd 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -17,6 +17,7 @@
 struct badblock {
 =09struct rb_node node;
 =09sector_t bb;
+=09unsigned char wr_fail_cnt;
 };
=20
 struct dust_device {
@@ -101,7 +102,9 @@ static int dust_remove_block(struct dust_device *dd, un=
signed long long block)
 =09return 0;
 }
=20
-static int dust_add_block(struct dust_device *dd, unsigned long long block=
)
+static int dust_add_block(struct dust_device *dd,
+=09=09=09=09unsigned long long block,
+=09=09=09=09unsigned char wr_fail_cnt)
 {
 =09struct badblock *bblock;
 =09unsigned long flags;
@@ -115,6 +118,7 @@ static int dust_add_block(struct dust_device *dd, unsig=
ned long long block)
=20
 =09spin_lock_irqsave(&dd->dust_lock, flags);
 =09bblock->bb =3D block;
+=09bblock->wr_fail_cnt =3D wr_fail_cnt;
 =09if (!dust_rb_insert(&dd->badblocklist, bblock)) {
 =09=09if (!dd->quiet_mode) {
 =09=09=09DMERR("%s: block %llu already in badblocklist",
@@ -127,7 +131,7 @@ static int dust_add_block(struct dust_device *dd, unsig=
ned long long block)
=20
 =09dd->badblock_count++;
 =09if (!dd->quiet_mode)
-=09=09DMINFO("%s: badblock added at block %llu", __func__, block);
+=09=09DMINFO("%s: badblock added at block %llu with write fail count %hhu"=
, __func__, block, wr_fail_cnt);
 =09spin_unlock_irqrestore(&dd->dust_lock, flags);
=20
 =09return 0;
@@ -175,10 +179,15 @@ static int dust_map_read(struct dust_device *dd, sect=
or_t thisblock,
 =09return ret;
 }
=20
-static void __dust_map_write(struct dust_device *dd, sector_t thisblock)
+static int __dust_map_write(struct dust_device *dd, sector_t thisblock)
 {
 =09struct badblock *bblk =3D dust_rb_search(&dd->badblocklist, thisblock);
=20
+=09if (bblk && bblk->wr_fail_cnt > 0) {
+=09=09bblk->wr_fail_cnt--;
+=09=09return DM_MAPIO_KILL;
+=09}
+
 =09if (bblk) {
 =09=09rb_erase(&bblk->node, &dd->badblocklist);
 =09=09dd->badblock_count--;
@@ -189,21 +198,24 @@ static void __dust_map_write(struct dust_device *dd, =
sector_t thisblock)
 =09=09=09       (unsigned long long)thisblock);
 =09=09}
 =09}
+
+=09return DM_MAPIO_REMAPPED;
 }
=20
 static int dust_map_write(struct dust_device *dd, sector_t thisblock,
 =09=09=09  bool fail_read_on_bb)
 {
 =09unsigned long flags;
+=09int ret =3D DM_MAPIO_REMAPPED;
=20
 =09if (fail_read_on_bb) {
 =09=09thisblock >>=3D dd->sect_per_block_shift;
 =09=09spin_lock_irqsave(&dd->dust_lock, flags);
-=09=09__dust_map_write(dd, thisblock);
+=09=09ret =3D __dust_map_write(dd, thisblock);
 =09=09spin_unlock_irqrestore(&dd->dust_lock, flags);
 =09}
=20
-=09return DM_MAPIO_REMAPPED;
+=09return ret;
 }
=20
 static int dust_map(struct dm_target *ti, struct bio *bio)
@@ -377,6 +389,8 @@ static int dust_message(struct dm_target *ti, unsigned =
int argc, char **argv,
 =09bool invalid_msg =3D false;
 =09int result =3D -EINVAL;
 =09unsigned long long tmp, block;
+=09unsigned char wr_fail_cnt;
+=09unsigned int tmp_ui;
 =09unsigned long flags;
 =09char dummy;
=20
@@ -422,14 +436,36 @@ static int dust_message(struct dm_target *ti, unsigne=
d int argc, char **argv,
 =09=09}
=20
 =09=09if (!strcasecmp(argv[0], "addbadblock"))
-=09=09=09result =3D dust_add_block(dd, block);
+=09=09=09result =3D dust_add_block(dd, block, 0);
 =09=09else if (!strcasecmp(argv[0], "removebadblock"))
 =09=09=09result =3D dust_remove_block(dd, block);
 =09=09else if (!strcasecmp(argv[0], "queryblock"))
 =09=09=09result =3D dust_query_block(dd, block);
 =09=09else
 =09=09=09invalid_msg =3D true;
+=09} else if (argc =3D=3D 3) {
+=09=09if (sscanf(argv[1], "%llu%c", &tmp, &dummy) !=3D 1)
+=09=09=09return result;
+
+=09=09if (sscanf(argv[2], "%u%c", &tmp_ui, &dummy) !=3D 1)
+=09=09=09return result;
=20
+=09=09block =3D tmp;
+=09=09if (tmp_ui > 255) {
+=09=09=09DMERR("selected write fail count out of range");
+=09=09=09return result;
+=09=09}
+=09=09wr_fail_cnt =3D tmp_ui;
+=09=09sector_div(size, dd->sect_per_block);
+=09=09if (block > size) {
+=09=09=09DMERR("selected block value out of range");
+=09=09=09return result;
+=09=09}
+
+=09=09if (!strcasecmp(argv[0], "addbadblock"))
+=09=09=09result =3D dust_add_block(dd, block, wr_fail_cnt);
+=09=09else
+=09=09=09invalid_msg =3D true;
 =09} else
 =09=09DMERR("invalid number of arguments '%d'", argc);
=20
--=20
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

