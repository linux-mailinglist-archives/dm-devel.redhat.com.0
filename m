Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D819746E44
	for <lists+dm-devel@lfdr.de>; Tue,  4 Jul 2023 12:08:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688465338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wsVOAG/TvA52nv+9Jcet78JKtEt/eOdNPapVZGHmvTQ=;
	b=YU7sIYQ+0C/ayWzhVW9AucoNRh1jgnknhWQFbrSrm53ihLFkMiYIQ7YNkMmdVWqncEdaYh
	whVIJXBv2/ccy/s3fVfxSyCU7GoaI9sGmY3kd7GB59pBvHlb06VLkmBWfM6dkQje6nZQSB
	BvHs3a++GwZalfiJmK0O0i27pLYrBqE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-bHtSXnohM4S3zDGwqQIyfA-1; Tue, 04 Jul 2023 06:08:52 -0400
X-MC-Unique: bHtSXnohM4S3zDGwqQIyfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10FF43C18FE2;
	Tue,  4 Jul 2023 10:08:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7D4315230A0;
	Tue,  4 Jul 2023 10:08:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 015F11946595;
	Tue,  4 Jul 2023 10:08:27 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3F0F11946586
 for <dm-devel@listman.corp.redhat.com>; Tue,  4 Jul 2023 10:08:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1D02E40C206F; Tue,  4 Jul 2023 10:08:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14FCE40C2063
 for <dm-devel@redhat.com>; Tue,  4 Jul 2023 10:08:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E87FA38149A3
 for <dm-devel@redhat.com>; Tue,  4 Jul 2023 10:08:24 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-ehdX-F9EPv-gPeHBDJL9jg-1; Tue,
 04 Jul 2023 06:08:23 -0400
X-MC-Unique: ehdX-F9EPv-gPeHBDJL9jg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 39623204A9;
 Tue,  4 Jul 2023 10:08:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0964A1346D;
 Tue,  4 Jul 2023 10:08:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Rq6SAJbvo2TQYwAAMHmgww
 (envelope-from <mwilck@suse.com>); Tue, 04 Jul 2023 10:08:22 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue,  4 Jul 2023 12:08:18 +0200
Message-ID: <20230704100818.30263-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH] Fixup "libmultipath: fix dev_loss_tmo even if
 not set in configuration"
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
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

My previous patch "libmultipath: fix dev_loss_tmo even if not set in
configuration" implicitly assumed that DEV_LOSS_TMO is 0, which is true
but unclean. Make the intention of the code more explicit.

Signed-off-by: Martin Wilck <mwilck@suse.com>

---
Ben: If you ack this, I'll squash it into the previous patch.
     Also, please have a look at https://listman.redhat.com/archives/dm-devel/2023-June/055113.html
     (I know the commit message is truncated, will fix).
     If this passes, I'd like to submit to Christophe this week.

---
 libmultipath/discovery.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 285cbd6..5626d48 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -895,9 +895,11 @@ sysfs_set_scsi_tmo (struct config *conf, struct multipath *mpp)
 			continue;
 		}
 
-		if (pp->dev_loss < min_dev_loss) {
-			warn_dev_loss = (pp->dev_loss != DEV_LOSS_TMO_UNSET);
+		if (pp->dev_loss == DEV_LOSS_TMO_UNSET)
 			pp->dev_loss = min_dev_loss;
+		else if (pp->dev_loss < min_dev_loss) {
+			pp->dev_loss = min_dev_loss;
+			warn_dev_loss = true;
 		}
 		if (pp->dev_loss != DEV_LOSS_TMO_UNSET &&
 		    pp->fast_io_fail > 0 &&
-- 
2.41.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

