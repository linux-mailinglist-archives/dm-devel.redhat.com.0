Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB579AA3C
	for <lists+dm-devel@lfdr.de>; Mon, 11 Sep 2023 18:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694450389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m2xTUFhuuUThl0HJ8FPDoMetEDQX0dTRaKqVkR2XBEI=;
	b=E+Kk3NOzzP2VvB9xll3qVO5jgLJ2IqgEWG3OQ8BNlizd54wg3tr7XfMJYgT2gDaoXXlHOz
	VvpdmcQ1w/1b7pVpJSgGKmXNOQ4hUHoONFpKMQz7sg85qJwSc7fC7Zwme0Zj+eE5bwfUC0
	p4aeJRqpe9k9HdLx9FIX71GyyJbJukA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-FWlX47Q7MzykITFvc-FT-g-1; Mon, 11 Sep 2023 12:39:44 -0400
X-MC-Unique: FWlX47Q7MzykITFvc-FT-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 489EF3813F32;
	Mon, 11 Sep 2023 16:39:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 062F140C200A;
	Mon, 11 Sep 2023 16:39:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AEB451946A42;
	Mon, 11 Sep 2023 16:39:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE99419465A3
 for <dm-devel@listman.corp.redhat.com>; Mon, 11 Sep 2023 16:39:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C225D2156711; Mon, 11 Sep 2023 16:39:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA8912156701
 for <dm-devel@redhat.com>; Mon, 11 Sep 2023 16:39:19 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E73C3C02B64
 for <dm-devel@redhat.com>; Mon, 11 Sep 2023 16:39:19 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-173-q9AjeYsjMPC7wHdIu_kKeg-1; Mon,
 11 Sep 2023 12:39:16 -0400
X-MC-Unique: q9AjeYsjMPC7wHdIu_kKeg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CA06221860;
 Mon, 11 Sep 2023 16:39:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 963DD139CC;
 Mon, 11 Sep 2023 16:39:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WH3uIrJC/2RzEAAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 11 Sep 2023 16:39:14 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 11 Sep 2023 18:38:10 +0200
Message-ID: <20230911163846.27197-2-mwilck@suse.com>
In-Reply-To: <20230911163846.27197-1-mwilck@suse.com>
References: <20230911163846.27197-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [PATCH v2 01/37] libmultipath: sysfs_set_scsi_tmo: do
 nothing for ACT_DRY_RUN
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
Cc: dm-devel@redhat.com, Jehan Singh <jehan.singh@suse.com>,
 Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

"multipath -d" might change sysfs timeouts of SCSI devices.
Make sure it doesn't.

Signed-off-by: Martin Wilck <mwilck@suse.com>
Cc: Jehan Singh <jehan.singh@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c | 4 ++--
 libmultipath/discovery.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 9513baa..029fbbd 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1193,13 +1193,13 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 
 		if (cmpp)
 			mpp->queue_mode = cmpp->queue_mode;
+		if (cmd == CMD_DRY_RUN && mpp->action == ACT_UNDEF)
+			mpp->action = ACT_DRY_RUN;
 		if (setup_map(mpp, &params, vecs)) {
 			remove_map(mpp, vecs->pathvec, NULL);
 			continue;
 		}
 
-		if (cmd == CMD_DRY_RUN)
-			mpp->action = ACT_DRY_RUN;
 		if (mpp->action == ACT_UNDEF)
 			select_action(mpp, curmp,
 				      force_reload == FORCE_RELOAD_YES ? 1 : 0);
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index e4de48e..84ce5fe 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -857,6 +857,9 @@ sysfs_set_scsi_tmo (struct config *conf, struct multipath *mpp)
 	bool warn_dev_loss = false;
 	bool warn_fast_io_fail = false;
 
+	if (mpp->action == ACT_DRY_RUN || mpp->action == ACT_REJECT)
+		return 0;
+
 	if (mpp->no_path_retry > 0) {
 		uint64_t no_path_retry_tmo =
 			(uint64_t)mpp->no_path_retry * conf->checkint;
-- 
2.42.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

