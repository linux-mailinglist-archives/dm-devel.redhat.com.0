Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0F466F23
	for <lists+dm-devel@lfdr.de>; Fri,  3 Dec 2021 02:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638495291;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=osBkx2gTXUfrBRhiDawebuWp7TU7C1xZHvt9RcX5bSg=;
	b=E3Z5ZSFiSHjEPTXJ3owkUX3pCE9fiZ4z2aK75o/zfrF8xq4rPR4mFC1Nn6jTDjjBLHtpGx
	SR+uA0wYqkWFhEaxuXxkpuSDpEIhyA68rVWMrUgBDuEyE0xrxoR7QY7MBH38z2kiPYl1Le
	W7qGFph1CF2YCDwyzFvV+Oaim1rG1Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-T2kTtrBOMpi7_NwC-vPGyg-1; Thu, 02 Dec 2021 20:34:47 -0500
X-MC-Unique: T2kTtrBOMpi7_NwC-vPGyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B16F1023F4E;
	Fri,  3 Dec 2021 01:34:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BED15F4E0;
	Fri,  3 Dec 2021 01:34:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 177201809C89;
	Fri,  3 Dec 2021 01:34:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B31YKMQ028484 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 20:34:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6BF8B79447; Fri,  3 Dec 2021 01:34:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C4479450;
	Fri,  3 Dec 2021 01:34:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1B31YFZg015785; 
	Thu, 2 Dec 2021 19:34:15 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1B31YFhi015784;
	Thu, 2 Dec 2021 19:34:15 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Dec 2021 19:34:11 -0600
Message-Id: <1638495252-15739-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1638495252-15739-1-git-send-email-bmarzins@redhat.com>
References: <1638495252-15739-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/3] multipathd: update dm_info on multipath
	change events
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When multipathd gets a change event for a multipath device, the dm info
may have changed, so update it.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index 7a57a798..5cb70575 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -818,6 +818,7 @@ ev_add_map (char * dev, const char * alias, struct vectors * vecs)
 		conf = get_multipath_config();
 		reassign_maps = conf->reassign_maps;
 		put_multipath_config(conf);
+		dm_get_info(mpp->alias, &mpp->dmi);
 		if (mpp->wait_for_udev) {
 			mpp->wait_for_udev = 0;
 			if (get_delayed_reconfig() &&
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

