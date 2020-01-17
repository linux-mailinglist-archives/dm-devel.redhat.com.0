Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 665FF1401C1
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227538;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ncUyOmUcu+Z7ccV9TnuEAdNtEfPj1oLIijWXC3D3d9w=;
	b=TFrUcwWA0GWwObBGfieXGbb7J51VIjK6SywsGK1p1BSCaX9kXlBH3UO53Bfy/kmyu4LaKu
	dFbnRn7WghuTGSjsVl9PuwxBQWik086TKzUHeTb5I4HcVhSX27Csq8i9hYTRyGOc/ozhVA
	8/yIA/3ENGagPFFwDv4z5BbGqakcKtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-eSQcsMJfO_e6xHif2Owjsw-1; Thu, 16 Jan 2020 21:18:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F3DA800D55;
	Fri, 17 Jan 2020 02:18:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 490741C947;
	Fri, 17 Jan 2020 02:18:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E01F718089CE;
	Fri, 17 Jan 2020 02:18:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2IXad030642 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3EF857BA4B; Fri, 17 Jan 2020 02:18:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26D449A84;
	Fri, 17 Jan 2020 02:18:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2IVdG017261; 
	Thu, 16 Jan 2020 20:18:31 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2IVAe017260;
	Thu, 16 Jan 2020 20:18:31 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:11 -0600
Message-Id: <1579227500-17196-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 06/15] libmultipath: add missing hwe mpe variable
	merges
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: eSQcsMJfO_e6xHif2Owjsw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There were some variables in the hwe and mpe structs that weren't being
merged by merge_hwe() and merge_mpe().

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

