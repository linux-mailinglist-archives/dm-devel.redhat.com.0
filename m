Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 84EF0E1CE7
	for <lists+dm-devel@lfdr.de>; Wed, 23 Oct 2019 15:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571838007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q9kRHRhEhho1QNGCqkjcGxJoTuA2PD2H3yFrvB/slws=;
	b=LjBLsnS1AbCgUYiL31ibxe8NinbgTUxTdU1l/gDx27XN5VhqAoyaB2i1+FctwDeMNDCImy
	AruZv/tZuE4x7e6pm9bmKt/btxnquKcFefu+yFFRngslfo0XN1FhbBuQO1FDrZIFR0QrNP
	Mc4eQgVsKNUn1e/sCPe9TLQpzdO+ltE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-yexyQ2jXO9KkZzePUt8eKA-1; Wed, 23 Oct 2019 09:40:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2420C100551D;
	Wed, 23 Oct 2019 13:39:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6C125D717;
	Wed, 23 Oct 2019 13:39:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F325F4EE6A;
	Wed, 23 Oct 2019 13:39:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9NDdj4x028572 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 09:39:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA1F95C219; Wed, 23 Oct 2019 13:39:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE5C5C1D4;
	Wed, 23 Oct 2019 13:39:43 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x9NDdgjK030172; Wed, 23 Oct 2019 09:39:42 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x9NDdgVC030168; Wed, 23 Oct 2019 09:39:42 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 23 Oct 2019 09:39:42 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Joe Thornber <thornber@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Message-ID: <alpine.LRH.2.02.1910230939160.29580@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-bio-prison-v2: replace spin_lock_irqsave with
 spin_lock_irq
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: yexyQ2jXO9KkZzePUt8eKA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Replace spin_lock_irqsave/irqrestore with spin_lock_irq/spin_unlock_irq.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bio-prison-v2.c |   26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

Index: linux-2.6/drivers/md/dm-bio-prison-v2.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.orig/drivers/md/dm-bio-prison-v2.c=092019-10-10 16:52:03.0000=
00000 +0200
+++ linux-2.6/drivers/md/dm-bio-prison-v2.c=092019-10-16 17:08:47.000000000=
 +0200
@@ -177,11 +177,10 @@ bool dm_cell_get_v2(struct dm_bio_prison
 =09=09    struct dm_bio_prison_cell_v2 **cell_result)
 {
 =09int r;
-=09unsigned long flags;
=20
-=09spin_lock_irqsave(&prison->lock, flags);
+=09spin_lock_irq(&prison->lock);
 =09r =3D __get(prison, key, lock_level, inmate, cell_prealloc, cell_result=
);
-=09spin_unlock_irqrestore(&prison->lock, flags);
+=09spin_unlock_irq(&prison->lock);
=20
 =09return r;
 }
@@ -261,11 +260,10 @@ int dm_cell_lock_v2(struct dm_bio_prison
 =09=09    struct dm_bio_prison_cell_v2 **cell_result)
 {
 =09int r;
-=09unsigned long flags;
=20
-=09spin_lock_irqsave(&prison->lock, flags);
+=09spin_lock_irq(&prison->lock);
 =09r =3D __lock(prison, key, lock_level, cell_prealloc, cell_result);
-=09spin_unlock_irqrestore(&prison->lock, flags);
+=09spin_unlock_irq(&prison->lock);
=20
 =09return r;
 }
@@ -285,11 +283,9 @@ void dm_cell_quiesce_v2(struct dm_bio_pr
 =09=09=09struct dm_bio_prison_cell_v2 *cell,
 =09=09=09struct work_struct *continuation)
 {
-=09unsigned long flags;
-
-=09spin_lock_irqsave(&prison->lock, flags);
+=09spin_lock_irq(&prison->lock);
 =09__quiesce(prison, cell, continuation);
-=09spin_unlock_irqrestore(&prison->lock, flags);
+=09spin_unlock_irq(&prison->lock);
 }
 EXPORT_SYMBOL_GPL(dm_cell_quiesce_v2);
=20
@@ -309,11 +305,10 @@ int dm_cell_lock_promote_v2(struct dm_bi
 =09=09=09    unsigned new_lock_level)
 {
 =09int r;
-=09unsigned long flags;
=20
-=09spin_lock_irqsave(&prison->lock, flags);
+=09spin_lock_irq(&prison->lock);
 =09r =3D __promote(prison, cell, new_lock_level);
-=09spin_unlock_irqrestore(&prison->lock, flags);
+=09spin_unlock_irq(&prison->lock);
=20
 =09return r;
 }
@@ -342,11 +337,10 @@ bool dm_cell_unlock_v2(struct dm_bio_pri
 =09=09       struct bio_list *bios)
 {
 =09bool r;
-=09unsigned long flags;
=20
-=09spin_lock_irqsave(&prison->lock, flags);
+=09spin_lock_irq(&prison->lock);
 =09r =3D __unlock(prison, cell, bios);
-=09spin_unlock_irqrestore(&prison->lock, flags);
+=09spin_unlock_irq(&prison->lock);
=20
 =09return r;
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

