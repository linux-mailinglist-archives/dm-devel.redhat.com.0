Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 228DD337CA8
	for <lists+dm-devel@lfdr.de>; Thu, 11 Mar 2021 19:27:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615487274;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LAngHocgiZWEfHI/O0WZdtNNyHIx+p1gcWRxyE9eKGA=;
	b=WS/EjxYmZPV4UiKsvsl+jXP2K8XRsv45rzjxe8XLwOF+CFJ2cSXKXyXIsv6SLLxQ3YigK2
	5KRZWuXiUhW3KYr0dAJs9EPQ5BFoFhe2vU80QBtR2ctLNIhEzn9hyMMytjE79JP2c1gNER
	VTrgnDE++5DHFHstv1tRaGi5gWwKgnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-IhV78nV3Oa2WKNYajs6bLw-1; Thu, 11 Mar 2021 13:27:51 -0500
X-MC-Unique: IhV78nV3Oa2WKNYajs6bLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF35D80BCA6;
	Thu, 11 Mar 2021 18:27:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A58B819704;
	Thu, 11 Mar 2021 18:27:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 397C218155DE;
	Thu, 11 Mar 2021 18:27:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12BIRYIl029555 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 13:27:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0397C60CCB; Thu, 11 Mar 2021 18:27:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71A3B60853;
	Thu, 11 Mar 2021 18:27:30 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 12BIRUVZ028851; Thu, 11 Mar 2021 13:27:30 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 12BIRT7R028847; Thu, 11 Mar 2021 13:27:30 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 11 Mar 2021 13:27:29 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <alpine.LRH.2.02.2103111327040.28706@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-ioctl: filter the returned values according
 to name or uuid prefix
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If we set non-empty param->name or param->uuid on the DM_LIST_DEVICES_CMD
ioctl, the set values are considered filter prefixes. The ioctl will only
return entries with matching name or uuid prefix.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-ioctl.c |   28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

Index: linux-2.6/drivers/md/dm-ioctl.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-ioctl.c	2021-03-11 18:53:58.000000000 +0100
+++ linux-2.6/drivers/md/dm-ioctl.c	2021-03-11 19:16:06.000000000 +0100
@@ -540,6 +540,30 @@ static void *get_result_buffer(struct dm
 	return ((void *) param) + param->data_start;
 }
 
+static bool filter_device(struct hash_cell *hc, const char *pfx_name, const char *pfx_uuid)
+{
+	const char *val;
+	size_t val_len, pfx_len;
+
+	val = hc->name;
+	val_len = strlen(val);
+	pfx_len = strnlen(pfx_name, DM_NAME_LEN);
+	if (pfx_len > val_len)
+		return false;
+	if (memcmp(val, pfx_name, pfx_len))
+		return false;
+
+	val = hc->uuid ? hc->uuid : "";
+	val_len = strlen(val);
+	pfx_len = strnlen(pfx_uuid, DM_UUID_LEN);
+	if (pfx_len > val_len)
+		return false;
+	if (memcmp(val, pfx_uuid, pfx_len))
+		return false;
+
+	return true;
+}
+
 static int list_devices(struct file *filp, struct dm_ioctl *param, size_t param_size)
 {
 	struct rb_node *n;
@@ -557,6 +581,8 @@ static int list_devices(struct file *fil
 	 */
 	for (n = rb_first(&name_rb_tree); n; n = rb_next(n)) {
 		hc = container_of(n, struct hash_cell, name_node);
+		if (!filter_device(hc, param->name, param->uuid))
+			continue;
 		needed += align_val(offsetof(struct dm_name_list, name) + strlen(hc->name) + 1);
 		needed += align_val(sizeof(uint32_t) * 2);
 		if (param->flags & DM_UUID_FLAG && hc->uuid)
@@ -581,6 +607,8 @@ static int list_devices(struct file *fil
 	for (n = rb_first(&name_rb_tree); n; n = rb_next(n)) {
 		void *uuid_ptr;
 		hc = container_of(n, struct hash_cell, name_node);
+		if (!filter_device(hc, param->name, param->uuid))
+			continue;
 		if (old_nl)
 			old_nl->next = (uint32_t) ((void *) nl -
 						   (void *) old_nl);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

