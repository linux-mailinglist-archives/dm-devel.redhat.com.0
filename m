Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC40518F0A
	for <lists+dm-devel@lfdr.de>; Tue,  3 May 2022 22:38:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651610312;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XhvODCPdbGSG//FzTV9N03Kbh/dc9CsOoVbdA8CJVzI=;
	b=GbNvGOB3XJnX7hfx616/9J3bGxdJ723rKQgF+J+2ukzfMCpCwgE1g4KZLft/NTZ6Ffdd78
	67TL0g8b/TPUT9O/ELthxXfY7LQOjcN4NEytodvgVwlAhXwbo2d+ydexxZ74U1GKxQGVwo
	mgfRUPKJjHDGXOqRMDDfMpOTAlcwM0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-f6GmYdn-Po2voS159DYIIg-1; Tue, 03 May 2022 16:38:05 -0400
X-MC-Unique: f6GmYdn-Po2voS159DYIIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1F8A10187EB;
	Tue,  3 May 2022 20:38:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D7C7C202CB;
	Tue,  3 May 2022 20:37:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 49927194707B;
	Tue,  3 May 2022 20:37:48 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 246C41947043
 for <dm-devel@listman.corp.redhat.com>; Tue,  3 May 2022 20:37:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 056035521C8; Tue,  3 May 2022 20:37:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F31AC551E99;
 Tue,  3 May 2022 20:37:45 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 243Kbjv6011673; Tue, 3 May 2022 16:37:45 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 243Kbjx4011669; Tue, 3 May 2022 16:37:45 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 3 May 2022 16:37:45 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <alpine.LRH.2.02.2205031635530.11434@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH v4.14] dm: interlock pending dm_io and
 dm_wait_for_bios_completion
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Mike Snitzer <msnitzer@redhat.com>, dm-devel@redhat.com,
 stable@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is backport of the patch 9f6dc6337610 ("dm: interlock pending dm_io
and dm_wait_for_bios_completion") for the kernel 4.14.

The bugs fixed by this patch can cause random crashing when reloading dm
table, so it is eligible for stable backport.

Note that the kernel 4.14 uses md->pending to count the number of
in-progress I/Os and md->pending is decremented after dm_stats_account_io,
so the race condition doesn't really exist there (except for missing
smp_rmb()).

The percpu variable md->pending_io is not needed in the stable kernels,
because md->pending counts the same value, so it is not backported.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reviewed-by: Mike Snitzer <snitzer@kernel.org>

---
 drivers/md/dm.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux-stable/drivers/md/dm.c
===================================================================
--- linux-stable.orig/drivers/md/dm.c	2022-04-30 19:16:55.000000000 +0200
+++ linux-stable/drivers/md/dm.c	2022-04-30 19:16:55.000000000 +0200
@@ -2230,6 +2230,8 @@ static int dm_wait_for_completion(struct
 	}
 	finish_wait(&md->wait, &wait);
 
+	smp_rmb(); /* paired with atomic_dec_return in end_io_acct */
+
 	return r;
 }
 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

