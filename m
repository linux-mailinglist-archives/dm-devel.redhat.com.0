Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E0F75F75CF
	for <lists+dm-devel@lfdr.de>; Mon, 11 Nov 2019 15:00:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573480813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FmqiyEGUerwryq/BVw+Kr0F3I2dTRiv+umtWzyYXQEc=;
	b=d6tffFgk8Zpmyz+iOYs1yhKi4PhVzhJEPluXGaR2XC+vwClvILA/deMOYQpUhkxTN5H+mr
	x8k4qDNJ+FA2Y7qrRnWQ7ebHaoJ23MydT+q2mRU/9VN8ACh+2yj/L/bfSpnFySZ6JJ1sXH
	3NkXWQKBXUqKStVsqzMzxKqQ8kwHRBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-zCnaq7S7PvuCQES0gpjgYQ-1; Mon, 11 Nov 2019 09:00:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EB9592D3E;
	Mon, 11 Nov 2019 14:00:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 652E51D1;
	Mon, 11 Nov 2019 14:00:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A35218089CD;
	Mon, 11 Nov 2019 13:59:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xABDxi8O017350 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 Nov 2019 08:59:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E36C05EE1A; Mon, 11 Nov 2019 13:59:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C26D55EE0F;
	Mon, 11 Nov 2019 13:59:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xABDxif0032326; Mon, 11 Nov 2019 08:59:44 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xABDxiR9032322; Mon, 11 Nov 2019 08:59:44 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 11 Nov 2019 08:59:44 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Scott Wood <swood@redhat.com>
Message-ID: <alpine.LRH.2.02.1911110853100.30532@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Nikos Tsironis <ntsironis@arrikto.com>,
	Ilias Tsitsimpis <iliastsi@arrikto.com>
Subject: [dm-devel] [PATCH 2/2] realtime: avoid BUG when the list is not
	locked
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: zCnaq7S7PvuCQES0gpjgYQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

list_bl.h would crash with BUG() if we used it without locking.=20
dm-snapshot uses its own locking on readltime kernels, so to avoid this=20
BUG, we must set LIST_BL_LOCKMASK =3D 0.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-rt-devel/include/linux/list_bl.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-rt-devel.orig/include/linux/list_bl.h=092019-11-07 14:01:51.00000=
0000 +0100
+++ linux-rt-devel/include/linux/list_bl.h=092019-11-08 10:12:49.000000000 =
+0100
@@ -19,7 +19,7 @@
  * some fast and compact auxiliary data.
  */
=20
-#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
+#if (defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)) && !defined(CO=
NFIG_PREEMPT_RT_BASE)
 #define LIST_BL_LOCKMASK=091UL
 #else
 #define LIST_BL_LOCKMASK=090UL
@@ -161,9 +161,6 @@ static inline void hlist_bl_lock(struct
 =09bit_spin_lock(0, (unsigned long *)b);
 #else
 =09raw_spin_lock(&b->lock);
-#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
-=09__set_bit(0, (unsigned long *)b);
-#endif
 #endif
 }
=20
@@ -172,9 +169,6 @@ static inline void hlist_bl_unlock(struc
 #ifndef CONFIG_PREEMPT_RT_BASE
 =09__bit_spin_unlock(0, (unsigned long *)b);
 #else
-#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
-=09__clear_bit(0, (unsigned long *)b);
-#endif
 =09raw_spin_unlock(&b->lock);
 #endif
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

