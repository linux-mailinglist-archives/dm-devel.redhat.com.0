Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E0912185FE8
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 22:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584306379;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UMD52I3aZP8YqihirpI+87bmUz2O+o4p8iCZH6QBOZw=;
	b=ac1hHb1cpaHvigZvAbn3qHwp957lgu4woORdZYN46+sZiYLNK+W83oTN5Qy3DASihkIxay
	8zccXKeb2raxJ/wRBXjDcW6k5VLXRe9j+TPyMTE/eugaRhW/nl1iu4vHbO3pu4donm6lQZ
	o6BB3z2EPLkcEeqNMhXDND8bvctb9SY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-5D37Akx7M5u3yQJ4DLQ9Lw-1; Sun, 15 Mar 2020 17:06:17 -0400
X-MC-Unique: 5D37Akx7M5u3yQJ4DLQ9Lw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F71613F7;
	Sun, 15 Mar 2020 21:06:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B93C19351C;
	Sun, 15 Mar 2020 21:06:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC8B318089CF;
	Sun, 15 Mar 2020 21:06:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02FL5teM008159 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Mar 2020 17:05:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEB6B2026D66; Sun, 15 Mar 2020 21:05:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B88D62022EAC
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 21:05:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A26FA8EC773
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 21:05:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-490-3QxoIWj8O9yVx2r2_zNM2w-1;
	Sun, 15 Mar 2020 17:05:51 -0400
X-MC-Unique: 3QxoIWj8O9yVx2r2_zNM2w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id A8609AD79;
	Sun, 15 Mar 2020 21:05:49 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sun, 15 Mar 2020 22:05:21 +0100
Message-Id: <20200315210521.12109-5-mwilck@suse.com>
In-Reply-To: <20200315210521.12109-1-mwilck@suse.com>
References: <20200315210521.12109-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02FL5teM008159
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/4] libmpathpersist: ABI change: limit
	data-in/out size to 8192 bytes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Make sure that data structures used for PERSISTENT RESERVE IN/OUT
fit into 8k buffers.

This patch breaks the libmpathpersist ABI, because the offsets of
struct print_fulldescr_list.descriptors and of the fields num_transportid and
trnptid_list in struct prout_param_descriptor change.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/libmpathpersist/mpath_persist.h b/libmpathpersist/mpath_persist.h
index 7cf4faf9..bdf4069d 100644
--- a/libmpathpersist/mpath_persist.h
+++ b/libmpathpersist/mpath_persist.h
@@ -92,7 +92,7 @@ struct prin_readdescr
 	uint32_t prgeneration;
 	uint32_t additional_length;	/* The value should be either 0 or divisible by 8.
 					   0 indicates no registered reservation key. */
-	uint8_t	 key_list[MPATH_MAX_PARAM_LEN];
+	uint8_t	 key_list[MPATH_MAX_PARAM_LEN - 2 * sizeof(uint32_t)];
 };
 
 struct prin_resvdescr
@@ -141,7 +141,9 @@ struct print_fulldescr_list
 {
 	uint32_t prgeneration;
 	uint32_t number_of_descriptor;
-	uint8_t private_buffer[MPATH_MAX_PARAM_LEN]; /*Private buffer for list storage*/
+	/* Data-in; Private buffer for list storage */
+	uint8_t private_buffer[MPATH_MAX_PARAM_LEN - 2 * sizeof(uint32_t)];
+	/* array of pointers into private_buffer */
 	struct prin_fulldescr *descriptors[];
 };
 
@@ -163,8 +165,13 @@ struct prout_param_descriptor {		/* PROUT parameter descriptor */
 	uint8_t	 sa_flags;
 	uint8_t _reserved;
 	uint16_t _obsolete1;
-	uint8_t  private_buffer[MPATH_MAX_PARAM_LEN]; /*private buffer for list storage*/
-	uint32_t num_transportid;	/* Number of Transport ID listed in trnptid_list[]*/
+	/*private buffer for list storage; data-out */
+	/* 24: offsetof (struct prout_param_descriptor, private_buffer) */
+	uint8_t  private_buffer[MPATH_MAX_PARAM_LEN - 24];
+	/* Internal use below here */
+	/* Number of Transport ID listed in trnptid_list[] */
+	uint32_t num_transportid;
+	/* pointers into private_buffer */
 	struct transportid *trnptid_list[];
 };
 
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

