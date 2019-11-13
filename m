Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4F467FAF89
	for <lists+dm-devel@lfdr.de>; Wed, 13 Nov 2019 12:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573643908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RyOlP0mrM7ELB65vSgBvBwq5wnKYw34ChJgTC7X74sc=;
	b=a/JzYGnsJ481TES5anR89QqqfveAwVvZh73RYgG9BFRq0W+6IE80Z5psyI1AFcKyo+PmCm
	rDrUQU86MiK4meepec741UVP9an8UbuD0P3593xY/8Ytt7vgiw54Ad+mCQNadFSFeFF7KN
	/itbxzdGKwvYHyp291VBKglLEcv1l4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-IhxoAuAuMByKgszyCjctNg-1; Wed, 13 Nov 2019 06:18:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB0C1107ACC8;
	Wed, 13 Nov 2019 11:18:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9705150FC7;
	Wed, 13 Nov 2019 11:18:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 835CE4BB65;
	Wed, 13 Nov 2019 11:18:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADBICBX032464 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 06:18:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 457D3BA69; Wed, 13 Nov 2019 11:18:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4440D6106E;
	Wed, 13 Nov 2019 11:18:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xADBI8gN023568; Wed, 13 Nov 2019 06:18:08 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xADBI80c023564; Wed, 13 Nov 2019 06:18:08 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 13 Nov 2019 06:18:08 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: tglx@linutronix.de, linux-rt-users@vger.kernel.org
In-Reply-To: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.1911130616570.20335@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Nikos Tsironis <ntsironis@arrikto.com>,
	Daniel Wagner <dwagner@suse.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Scott Wood <swood@redhat.com>
Subject: [dm-devel] [PATCH RT 2/2 v3] list_bl: avoid BUG when the list is
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: IhxoAuAuMByKgszyCjctNg-1
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

---
 include/linux/list_bl.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-rt-devel/include/linux/list_bl.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-rt-devel.orig/include/linux/list_bl.h=092019-11-13 12:15:50.00000=
0000 +0100
+++ linux-rt-devel/include/linux/list_bl.h=092019-11-13 12:15:50.000000000 =
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

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

