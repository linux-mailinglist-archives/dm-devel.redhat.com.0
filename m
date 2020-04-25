Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DB5FB1B9874
	for <lists+dm-devel@lfdr.de>; Mon, 27 Apr 2020 09:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587972255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-to:
	 resent-from:resent-message-id:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=obIj21mgSvEp4mKwEbX4mpbgsx2IrNHJxSnc53KjwRQ=;
	b=LeOfrmCimOkeCqVK2EummYJGHKoI9AZg634T7ouuZ+YT3mljAO1S/o4hWow5bPZWtEqBVG
	vWOBiUA/4gaV0wsmrCmjmBk+cuQ8RV+CsklPbh5C99lKtVxPdGBMMoMt7ixzeCiCA4HlqL
	xMGWTUnvkDDgrhvMdv0EEl+VfL4igNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-55ZHNzzyOUCF_4b2Gi3hwQ-1; Mon, 27 Apr 2020 03:24:12 -0400
X-MC-Unique: 55ZHNzzyOUCF_4b2Gi3hwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFDB78014D5;
	Mon, 27 Apr 2020 07:24:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D7005C1D6;
	Mon, 27 Apr 2020 07:24:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 603C24CA95;
	Mon, 27 Apr 2020 07:23:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03QJ4M3v024849 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 26 Apr 2020 15:04:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF4272156A3A; Sun, 26 Apr 2020 19:04:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB46E2156A23
	for <dm-devel@redhat.com>; Sun, 26 Apr 2020 19:04:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CE4085A59E
	for <dm-devel@redhat.com>; Sun, 26 Apr 2020 19:04:20 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-313-T9_u_SUVM7uazkjc_QuUcw-1; Sun, 26 Apr 2020 15:04:14 -0400
X-MC-Unique: T9_u_SUVM7uazkjc_QuUcw-1
Received: from leda (p200300CF2F178A00625718FFFE7F1598.dip0.t-ipconnect.de
	[IPv6:2003:cf:2f17:8a00:6257:18ff:fe7f:1598])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id D8F93114D0
	for <dm-devel@redhat.com>; Sun, 26 Apr 2020 20:54:17 +0200 (CEST)
From: Christian Hesse <mail@eworm.de> (by way of Christian Hesse
	<mail@eworm.de>)
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Sat, 25 Apr 2020 21:11:13 +0200
Message-Id: <20200425191113.33868-1-mail@eworm.de>
MIME-Version: 1.0
Resent-Date: Sun, 26 Apr 2020 20:54:16 +0200
Resent-From: Christian Hesse <mail@eworm.de>
Resent-Message-ID: <20200426205416.168f275d@leda>
Resent-To: dm-devel@redhat.com
X-Spam-Status: No, score=4.05
X-Spamd-Bar: ++++
X-Rspamd-Server: mx
X-Spam-Level: ****
X-Stat-Signature: pb8zk3pzrs3wk9b8n69j63d7uea1uumu
X-Rspamd-Queue-Id: D8F93114D0
X-Spamd-Result: default: False [4.05 / 15.00]; ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[]; R_MISSING_CHARSET(2.50)[];
	NEURAL_HAM_LONG(-2.18)[-0.725]; MIME_GOOD(-0.10)[text/plain];
	BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
	MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_SHORT(-0.68)[-0.675];
	RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:3320, ipnet:2003::/19, country:DE];
	FORGED_RECIPIENTS(2.00)[christophe.varoqui@opensvc.com ..,
	dm-devel@redhat.com]
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03QJ4M3v024849
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 Apr 2020 03:23:40 -0400
Cc: Christian Hesse <mail@eworm.de>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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

