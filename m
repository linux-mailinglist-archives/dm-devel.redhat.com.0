Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E4735163D33
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582094960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=saX1l6+1El72uNjk1BWBBwL2A37j3UMSQsql5Q2Q+z0=;
	b=ZTZAUy9YltYDaryzWr9TcFoXR3VxEX2znXcZOZa+NVhz7RUMWlK2N/ST9Rzch7zavtd388
	ZEjjN5aYPwg7xauS1iWF4EqWbEB1uzy4CfBv6UO31GiboQInxw66j7kq18AAJ33LN8Dd1B
	IfE0rJw360rC/ZQPoYgDoV2UFZ+l6Js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-ZBEloPjNPJWvrda1HDc8IA-1; Wed, 19 Feb 2020 01:49:18 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE991088380;
	Wed, 19 Feb 2020 06:49:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E20060C87;
	Wed, 19 Feb 2020 06:49:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35E8C35B13;
	Wed, 19 Feb 2020 06:49:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6msak015878 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:48:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C74868B54C; Wed, 19 Feb 2020 06:48:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AFC88B546;
	Wed, 19 Feb 2020 06:48:52 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6movH009945; 
	Wed, 19 Feb 2020 00:48:51 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6mocX009944;
	Wed, 19 Feb 2020 00:48:50 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:48:28 -0600
Message-Id: <1582094920-9883-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
References: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 06/18] libmultipath: add missing hwe mpe
	variable merges
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ZBEloPjNPJWvrda1HDc8IA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There were some variables in the hwe and mpe structs that weren't being
merged by merge_hwe() and merge_mpe().

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index dc64ef59..366f4e30 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -372,6 +372,10 @@ merge_hwe (struct hwentry * dst, struct hwentry * src)
 	merge_num(san_path_err_threshold);
 	merge_num(san_path_err_forget_rate);
 	merge_num(san_path_err_recovery_time);
+	merge_num(marginal_path_err_sample_time);
+	merge_num(marginal_path_err_rate_threshold);
+	merge_num(marginal_path_err_recheck_gap_time);
+	merge_num(marginal_path_double_failed_time);
 
 	snprintf(id, sizeof(id), "%s/%s", dst->vendor, dst->product);
 	reconcile_features_with_options(id, &dst->features,
@@ -397,6 +401,7 @@ merge_mpe(struct mpentry *dst, struct mpentry *src)
 	if (dst->prkey_source == PRKEY_SOURCE_NONE &&
 	    src->prkey_source != PRKEY_SOURCE_NONE) {
 		dst->prkey_source = src->prkey_source;
+		dst->sa_flags = src->sa_flags;
 		memcpy(&dst->reservation_key, &src->reservation_key,
 		       sizeof(dst->reservation_key));
 	}
@@ -413,6 +418,9 @@ merge_mpe(struct mpentry *dst, struct mpentry *src)
 	merge_num(deferred_remove);
 	merge_num(delay_watch_checks);
 	merge_num(delay_wait_checks);
+	merge_num(san_path_err_threshold);
+	merge_num(san_path_err_forget_rate);
+	merge_num(san_path_err_recovery_time);
 	merge_num(marginal_path_err_sample_time);
 	merge_num(marginal_path_err_rate_threshold);
 	merge_num(marginal_path_err_recheck_gap_time);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

