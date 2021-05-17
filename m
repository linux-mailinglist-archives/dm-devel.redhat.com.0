Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CBD9F386C25
	for <lists+dm-devel@lfdr.de>; Mon, 17 May 2021 23:20:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-pOJ3I35tPLG0lKmEZa1Www-1; Mon, 17 May 2021 17:20:08 -0400
X-MC-Unique: pOJ3I35tPLG0lKmEZa1Www-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CBBC800D62;
	Mon, 17 May 2021 21:20:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDD965D703;
	Mon, 17 May 2021 21:20:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10BE955347;
	Mon, 17 May 2021 21:19:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14HLJmJi030500 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 May 2021 17:19:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DCB25AB7F; Mon, 17 May 2021 21:19:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 891406E1D8
	for <dm-devel@redhat.com>; Mon, 17 May 2021 21:19:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E7CC857AA4
	for <dm-devel@redhat.com>; Mon, 17 May 2021 21:19:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-55-FWh4m5qCN5SuZ61zzJGJ7A-1;
	Mon, 17 May 2021 17:19:41 -0400
X-MC-Unique: FWh4m5qCN5SuZ61zzJGJ7A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 62381B11F;
	Mon, 17 May 2021 21:19:39 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Date: Mon, 17 May 2021 23:19:07 +0200
Message-Id: <20210517211909.21776-2-mwilck@suse.com>
In-Reply-To: <20210517211909.21776-1-mwilck@suse.com>
References: <20210517211909.21776-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14HLJmJi030500
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 2/4] multipathd: cli_getprkey(): fix return value
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

By setting (*reply)[19] = '\0', we always truncated a possible
":aptpl" suffix. Fix it, and use the return value of snprintf()
as length.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/cli_handlers.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 9606494..59d44b4 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -1540,7 +1540,7 @@ cli_getprkey(void * v, char ** reply, int * len, void * data)
 	struct multipath * mpp;
 	struct vectors * vecs = (struct vectors *)data;
 	char *mapname = get_keyparam(v, MAP);
-	char *flagstr = "";
+	uint64_t key;
 
 	mapname = convert_dev(mapname, 0);
 	condlog(3, "%s: get persistent reservation key (operator)", mapname);
@@ -1553,17 +1553,16 @@ cli_getprkey(void * v, char ** reply, int * len, void * data)
 	if (!*reply)
 		return 1;
 
-	if (!get_be64(mpp->reservation_key)) {
+	key = get_be64(mpp->reservation_key);
+	if (!key) {
 		sprintf(*reply, "none\n");
-		*len = strlen(*reply) + 1;
+		*len = sizeof("none\n");
 		return 0;
 	}
-	if (mpp->sa_flags & MPATH_F_APTPL_MASK)
-		flagstr = ":aptpl";
-	snprintf(*reply, 26, "0x%" PRIx64 "%s\n",
-		 get_be64(mpp->reservation_key), flagstr);
-	(*reply)[19] = '\0';
-	*len = strlen(*reply) + 1;
+
+	/* This snprintf() can't overflow - PRIx64 needs max 16 chars */
+	*len = snprintf(*reply, 26, "0x%" PRIx64 "%s\n", key,
+			mpp->sa_flags & MPATH_F_APTPL_MASK ? ":aptpl" : "") + 1;
 	return 0;
 }
 
-- 
2.31.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

