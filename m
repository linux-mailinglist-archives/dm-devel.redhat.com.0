Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E1767608
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jul 2023 21:06:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690571190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rnH+TLPxKDAiM0cEW4rsbseIThH8OSmjZJ39BuExleI=;
	b=FN/DPMjEj9FwtYf0R4mNusBtABpCryqPgbpnmdRCQ/2WUesiTN+Mj3mUQl5xNUtbSKvpoE
	wHq7RbmZqsCv6YOLqdFmZe/4+pmbzEUxREc7QGlO5lKj+BeM+WOZv9l9SJp3hLA4Nm9ihR
	Iei54oVtqkCrITkx2KHkP0zF1V54ve0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-VknQCtHNNNaUz6Fwg7vnlw-1; Fri, 28 Jul 2023 15:06:27 -0400
X-MC-Unique: VknQCtHNNNaUz6Fwg7vnlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEE62830DB5;
	Fri, 28 Jul 2023 19:06:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07F5240C2072;
	Fri, 28 Jul 2023 19:06:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B085B19451C0;
	Fri, 28 Jul 2023 19:06:12 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3DF8C194658C
 for <dm-devel@listman.corp.redhat.com>; Fri, 28 Jul 2023 19:06:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2E2CA492B03; Fri, 28 Jul 2023 19:06:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15460492B02;
 Fri, 28 Jul 2023 19:06:12 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 36SJ61Gv008333;
 Fri, 28 Jul 2023 14:06:01 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 36SJ61XJ008332;
 Fri, 28 Jul 2023 14:06:01 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 28 Jul 2023 14:05:54 -0500
Message-Id: <1690571155-8283-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1690571155-8283-1-git-send-email-bmarzins@redhat.com>
References: <1690571155-8283-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [dm-devel] [RFC PATCH 3/4] libmultipath: fix timeouts for
 detect_alua()
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

detect_alua calls prioritizer functions that expect the timeout to be in
milliseconds instead of seconds. Fix this and also respect the
checker_timeout setting.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 2b1a11d5..9392134f 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1016,15 +1016,17 @@ detect_alua(struct path * pp)
 	int ret;
 	int tpgs;
 	unsigned int timeout;
+	struct config *conf;
 
 
 	if (pp->bus != SYSFS_BUS_SCSI) {
 		pp->tpgs = TPGS_NONE;
 		return;
 	}
-
-	if (sysfs_get_timeout(pp, &timeout) <= 0)
-		timeout = DEF_TIMEOUT;
+	conf = get_multipath_config();
+	timeout = conf->checker_timeout * 1000;
+	put_multipath_config(conf);
+	timeout = get_prio_timeout(pp, timeout);
 
 	tpgs = get_target_port_group_support(pp, timeout);
 	if (tpgs == -RTPG_INQUIRY_FAILED)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

