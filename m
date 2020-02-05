Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0E418153894
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 20:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sq4jDO9wNYkcvydU+EpmjY47W+OoskSrubvo8qpMkm8=;
	b=CvcJ+RSw/kjWaovFH9Ik0M+NOibU+dz2FXiz3sCFuC/qmYmtVXgj20+Xn+Ro0iN7Rzhl+n
	MhZSmIqzvZ/PczXDIMxCh2LH42zmSSA92ht25pP0ftWHLDPr/9j40K6MLI5fHGpRxmrpnd
	1ebLKQz6Z91Oaq2e4S//t6QW5COEgYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-Zc7JHfBiMmmzAQe8hJAIuw-1; Wed, 05 Feb 2020 13:58:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DC11107B7D6;
	Wed,  5 Feb 2020 18:58:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BE13863A5;
	Wed,  5 Feb 2020 18:58:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79F631803C42;
	Wed,  5 Feb 2020 18:58:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IwXY7019441 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A5473857B7; Wed,  5 Feb 2020 18:58:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF517859DC;
	Wed,  5 Feb 2020 18:58:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwTMO032674; 
	Wed, 5 Feb 2020 12:58:29 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IwT1E032673;
	Wed, 5 Feb 2020 12:58:29 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:10 -0600
Message-Id: <1580929100-32572-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 07/17] libmultipath: add missing hwe mpe
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Zc7JHfBiMmmzAQe8hJAIuw-1
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
index 20e3b8bf..85626e96 100644
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

