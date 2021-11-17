Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA0454F43
	for <lists+dm-devel@lfdr.de>; Wed, 17 Nov 2021 22:23:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637184184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8aYsRqcjdn6/VfhUi18WTVaV33uacr5GDIgK9mFnMIc=;
	b=MvtDONrv8ma/sinDu9OA+baXw9woZe7iWAIKF8+HylXybkk3YbYfy3QFmIXGRUYHGSQa5g
	n3Rm7H26XF5hKslss3fwdsFomNxUB0Da4FFmeQB/9ps/23N8s+rWEhEblHB4GnBum2Uepu
	L1lBNVuwTExMaA0lLKyxy5yodLTrgCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-hOYcCpwwN9ipqIURapFy6Q-1; Wed, 17 Nov 2021 16:22:04 -0500
X-MC-Unique: hOYcCpwwN9ipqIURapFy6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B93971006AA3;
	Wed, 17 Nov 2021 21:21:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97AB35C22B;
	Wed, 17 Nov 2021 21:21:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B7E84E9E2;
	Wed, 17 Nov 2021 21:21:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHLLj12025333 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 16:21:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 86D3A17CEE; Wed, 17 Nov 2021 21:21:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D2735D9DE;
	Wed, 17 Nov 2021 21:21:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AHLLbmi004955; 
	Wed, 17 Nov 2021 15:21:37 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AHLLbDW004954;
	Wed, 17 Nov 2021 15:21:37 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Nov 2021 15:21:24 -0600
Message-Id: <1637184084-4882-10-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1637184084-4882-1-git-send-email-bmarzins@redhat.com>
References: <1637184084-4882-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 9/9] libmultipath: add path wildcard "%I" for
	init state
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Enable printing pp->initialized with 'multipathd show paths format "%I"'.
This is supposed to go on top of Ben's "multipathd: remove udev settle
dependency" series, to simplify checking multipathd's state.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/print.c   | 21 +++++++++++++++++++++
 libmultipath/structs.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/libmultipath/print.c b/libmultipath/print.c
index d2ef0104..e61349f9 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -504,6 +504,26 @@ snprint_dm_path_state (struct strbuf *buff, const struct path * pp)
 	}
 }
 
+static int snprint_initialized(struct strbuf *buff, const struct path * pp)
+{
+	static const char *init_state_name[] = {
+		[INIT_NEW] = "new",
+		[INIT_FAILED] = "failed",
+		[INIT_MISSING_UDEV] = "udev-missing",
+		[INIT_REQUESTED_UDEV] = "udev-requested",
+		[INIT_OK] = "ok",
+		[INIT_REMOVED] = "removed",
+		[INIT_PARTIAL] = "partial",
+	};
+	const char *str;
+
+	if (pp->initialized < INIT_NEW || pp->initialized >= __INIT_LAST)
+		str = "undef";
+	else
+		str = init_state_name[pp->initialized];
+	return append_strbuf_str(buff, str);
+}
+
 static int
 snprint_vpr (struct strbuf *buff, const struct path * pp)
 {
@@ -804,6 +824,7 @@ struct path_data pd[] = {
 	{'g', "vpd page data", 0, snprint_path_vpd_data},
 	{'0', "failures",      0, snprint_path_failures},
 	{'P', "protocol",      0, snprint_path_protocol},
+	{'I', "init_st",       0, snprint_initialized},
 	{0, NULL, 0 , NULL}
 };
 
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index c21d1eda..c0f8929c 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -206,6 +206,7 @@ enum initialized_states {
 	 * change uevent is received.
 	 */
 	INIT_PARTIAL,
+	__INIT_LAST,
 };
 
 enum prkey_sources {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

