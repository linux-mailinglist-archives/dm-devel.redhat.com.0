Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E64931B9397
	for <lists+dm-devel@lfdr.de>; Sun, 26 Apr 2020 21:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587928811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RL17JgzQl5wCR0tpAlj3RFs8JlasHySQ1i+C5ZvbHFM=;
	b=DdDTPHaP1Mmcc1JKSz9RU5xlH9zN+d2OMS3XpFY5CmGqwtLkigPKiFZ15aB/BVD12aefC/
	DrwzfKkEsY6zOAIAxl61SuEG88IH7qMiTIpEQdxQnerWjL529zZP5O+tYf7lTek1adWleI
	vFIS6kKt3dqjTbUeKL1UQjP3FUA2izw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-IH22HDOlNWa77L388bRd6A-1; Sun, 26 Apr 2020 15:20:07 -0400
X-MC-Unique: IH22HDOlNWa77L388bRd6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F81A1005510;
	Sun, 26 Apr 2020 19:19:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6A8417F6A;
	Sun, 26 Apr 2020 19:19:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B06B1809542;
	Sun, 26 Apr 2020 19:19:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03QJJIkU026099 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 26 Apr 2020 15:19:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CE542166BA2; Sun, 26 Apr 2020 19:19:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98F8E2166BA0
	for <dm-devel@redhat.com>; Sun, 26 Apr 2020 19:19:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8E70811E77
	for <dm-devel@redhat.com>; Sun, 26 Apr 2020 19:19:15 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-33-q-rtjAV4Pga9H6VixPrrtA-1; Sun, 26 Apr 2020 15:19:13 -0400
X-MC-Unique: q-rtjAV4Pga9H6VixPrrtA-1
Received: from leda.eworm.de (p54B79167.dip0.t-ipconnect.de [84.183.145.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 4C65F115FD;
	Sun, 26 Apr 2020 21:14:08 +0200 (CEST)
Received: by leda.eworm.de (Postfix, from userid 1000)
	id 1C400122E7B; Sun, 26 Apr 2020 21:13:37 +0200 (CEST)
From: Christian Hesse <list@eworm.de>
To: Device-mapper development mailing list <dm-devel@redhat.com>
Date: Sun, 26 Apr 2020 21:13:25 +0200
Message-Id: <20200426191325.15388-1-list@eworm.de>
MIME-Version: 1.0
X-Spam-Status: No, score=1.73
X-Spamd-Bar: +
X-Rspamd-Server: mx
X-Spam-Level: *
X-Stat-Signature: fcpe96hhkg3rttw5ifqits6p944emcm6
X-Rspamd-Queue-Id: 4C65F115FD
X-Spamd-Result: default: False [1.73 / 15.00]; ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	GENERIC_REPUTATION(0.00)[-0.62023748620626];
	FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
	R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
	NEURAL_HAM_LONG(-2.78)[-0.926]; DKIM_SIGNED(0.00)[];
	NEURAL_HAM_SHORT(-0.69)[-0.694]; RCPT_COUNT_TWO(0.00)[2];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[list@eworm.de,eworm@leda.eworm.de];
	RCVD_COUNT_ZERO(0.00)[0]; MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:3320, ipnet:84.128.0.0/10, country:DE];
	FROM_NEQ_ENVFROM(0.00)[list@eworm.de,eworm@leda.eworm.de]
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03QJJIkU026099
X-loop: dm-devel@redhat.com
Cc: "mail@eworm.de" <mail@eworm.de>
Subject: [dm-devel] [PATCH 1/1] fix boolean value with json-c 0.14
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "mail@eworm.de" <mail@eworm.de>

Upstream removed the TRUE and FALSE defines in commit
0992aac61f8b087efd7094e9ac2b84fa9c040fcd.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 libdmmp/libdmmp_private.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
index ac85b63f..29400826 100644
--- a/libdmmp/libdmmp_private.h
+++ b/libdmmp/libdmmp_private.h
@@ -82,7 +82,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
 do { \
 	json_type j_type = json_type_null; \
 	json_object *j_obj_tmp = NULL; \
-	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != TRUE) { \
+	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != 1) { \
 		_error(ctx, "Invalid JSON output from multipathd IPC: " \
 		       "key '%s' not found", key); \
 		rc = DMMP_ERR_IPC_ERROR; \
@@ -90,7 +90,7 @@ do { \
 	} \
 	if (j_obj_tmp == NULL) { \
 		_error(ctx, "BUG: Got NULL j_obj_tmp from " \
-		       "json_object_object_get_ex() while it return TRUE"); \
+		       "json_object_object_get_ex() while it return 1"); \
 		rc = DMMP_ERR_BUG; \
 		goto out; \
 	} \


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

