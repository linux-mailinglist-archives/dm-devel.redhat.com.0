Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8496EF9558
	for <lists+dm-devel@lfdr.de>; Tue, 12 Nov 2019 17:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573575412;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9eg/VvyBFvb45fgJG+dRlWjXm2wihxnsBplgJhAc7nA=;
	b=RGWkaDR9jlblGarBne9IhEVU+BZ5Q/nNJKXPWRRHw43mtnUe+R64mWqYeZzASYw/heHDyb
	HRAMN543jh8PIYLPQaijr2rrwHXim/oqC3hJDVS8dXox7RTIArMwUVpYoZnJxGOK1oHziY
	Tn3EI3jTpe2oCvefKk2SoW+0ob8/msQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-3yx6JX0cM-CKDMJnG89HPg-1; Tue, 12 Nov 2019 11:16:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12292DBF7;
	Tue, 12 Nov 2019 16:16:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB5275E1AF;
	Tue, 12 Nov 2019 16:16:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D3FD1809567;
	Tue, 12 Nov 2019 16:16:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xACGGWCb009479 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 Nov 2019 11:16:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF89360A97; Tue, 12 Nov 2019 16:16:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EA7E67E40;
	Tue, 12 Nov 2019 16:16:30 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xACGGTZK018091; Tue, 12 Nov 2019 11:16:29 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xACGGTeA018087; Tue, 12 Nov 2019 11:16:29 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 12 Nov 2019 11:16:29 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: tglx@linutronix.de, linux-rt-users@vger.kernel.org
Message-ID: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Nikos Tsironis <ntsironis@arrikto.com>,
	Daniel Wagner <dwagner@suse.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Scott Wood <swood@redhat.com>
Subject: [dm-devel] [PATCH RT 2/2 v2] list_bl: avoid BUG when the list is
	not locked
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 3yx6JX0cM-CKDMJnG89HPg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

list_bl would crash with BUG() if we used it without locking. dm-snapshot=
=20
uses its own locking on realtime kernels (it can't use list_bl because=20
list_bl uses raw spinlock and dm-snapshot takes other non-raw spinlocks=20
while holding bl_lock).

To avoid this BUG, we must set LIST_BL_LOCKMASK =3D 0.

This patch is intended only for the realtime kernel patchset, not for the=
=20
upstream kernel.

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

