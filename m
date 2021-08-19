Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CC2F43F4516
	for <lists+dm-devel@lfdr.de>; Mon, 23 Aug 2021 08:41:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-D6x88XiNNFSu1yVHXpb1ZA-1; Mon, 23 Aug 2021 02:40:31 -0400
X-MC-Unique: D6x88XiNNFSu1yVHXpb1ZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5A7187D54D;
	Mon, 23 Aug 2021 06:40:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C45E660CC4;
	Mon, 23 Aug 2021 06:40:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F755181A1CD;
	Mon, 23 Aug 2021 06:40:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JCgD1F009622 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 08:42:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C4D4208AB7F; Thu, 19 Aug 2021 12:42:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37CF4208AB7E
	for <dm-devel@redhat.com>; Thu, 19 Aug 2021 12:42:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BDEF18A01A9
	for <dm-devel@redhat.com>; Thu, 19 Aug 2021 12:42:10 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-554-X4iK5GxmORm98wuKlqIIzA-1;
	Thu, 19 Aug 2021 08:42:05 -0400
X-MC-Unique: X4iK5GxmORm98wuKlqIIzA-1
Received: from [192.168.15.108] by relay.sw.ru with esmtp (Exim 4.94.2)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1mGh7a-008DV7-Fe; Thu, 19 Aug 2021 15:26:10 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	dm-devel@redhat.com, Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <d350c91e-8b67-d1db-6a59-94ee14f0b51c@virtuozzo.com>
Date: Thu, 19 Aug 2021 15:26:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.12.0
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Aug 2021 02:39:55 -0400
Subject: [dm-devel] [Q] dm: Can singleton rq-based target refer to a device?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, Mike, Alasdair, all,

I have out-of-tree rq-based driver. It uses dm_get_device() to acquire underlining device.
My goal is to register it as just DM_TARGET_SINGLETON without DM_TARGET_IMMUTABLE flag,
since I need a possibility to reload it with another target.

There is a check in dm_table_determine_type(), which prevents that. It's not obvious,
what the reasons of this limitation are. Could you please explain, why this is required?
Can we make the check weaker like in the patch below?

Thanks,
Kirill

---
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 0543cdf89e92..81fd45142e42 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -936,30 +936,27 @@ static int dm_table_determine_type(struct dm_table *t)
 
 	if (list_empty(devices)) {
 		int srcu_idx;
 		struct dm_table *live_table = dm_get_live_table(t->md, &srcu_idx);
 
 		/* inherit live table's type */
 		if (live_table)
 			t->type = live_table->type;
 		dm_put_live_table(t->md, srcu_idx);
 		return 0;
 	}
 
-	tgt = dm_table_get_immutable_target(t);
-	if (!tgt) {
-		DMERR("table load rejected: immutable target is required");
-		return -EINVAL;
-	} else if (tgt->max_io_len) {
-		DMERR("table load rejected: immutable target that splits IO is not supported");
+	tgt = &t->targets[0];
+	if (tgt->max_io_len) {
+		DMERR("table load rejected: singleton target that splits IO is not supported");
 		return -EINVAL;
 	}
 
 	/* Non-request-stackable devices can't be used for request-based dm */
 	if (!tgt->type->iterate_devices ||
 	    !tgt->type->iterate_devices(tgt, device_is_rq_stackable, NULL)) {
 		DMERR("table load rejected: including non-request-stackable devices");
 		return -EINVAL;
 	}
 
 	return 0;
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

