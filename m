Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 207A217C8B2
	for <lists+dm-devel@lfdr.de>; Sat,  7 Mar 2020 00:08:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583536082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nb7ciJqWc/gcoxOaBlFUS+YiluDixqWV5sw8YNboZhU=;
	b=XG8qQc7FYAvCRB3qo1vJCVfDAVMkdSGobq7uH7TR/IioyXS6iDrZuFT+Dkapu0Ro4oUYQq
	eIy3voQzOuTueIt5DMwJxIUyUBba0dqIAayZXC18qdYUQXcFUM+Rwt0H8QbNbl0Kg+4h6E
	UmeOBoVspRVyprUmmf2eu0g3sKdg1zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-SYiMlT8WPkSsq58kk68rQg-1; Fri, 06 Mar 2020 18:07:19 -0500
X-MC-Unique: SYiMlT8WPkSsq58kk68rQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06711184C804;
	Fri,  6 Mar 2020 23:07:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D14C890CF0;
	Fri,  6 Mar 2020 23:07:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DB1D18089D0;
	Fri,  6 Mar 2020 23:07:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026N6ZZs011273 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 18:06:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BDC52104FA55; Fri,  6 Mar 2020 23:06:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B95C1104FFBF
	for <dm-devel@redhat.com>; Fri,  6 Mar 2020 23:06:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8B9D800294
	for <dm-devel@redhat.com>; Fri,  6 Mar 2020 23:06:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-89-BYytu22-MsCwCCEKzUQ-YQ-1;
	Fri, 06 Mar 2020 18:06:31 -0500
X-MC-Unique: BYytu22-MsCwCCEKzUQ-YQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 39723B071;
	Fri,  6 Mar 2020 23:06:30 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat,  7 Mar 2020 00:06:05 +0100
Message-Id: <20200306230605.3473-5-mwilck@suse.com>
In-Reply-To: <20200306230605.3473-1-mwilck@suse.com>
References: <20200306230605.3473-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 026N6ZZs011273
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>,
	David Bond <dbond@suse.com>
Subject: [dm-devel] [PATCH 4/4] libmpathpersist: ABI change: limit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Make sure that data structures used for PERSISTENT RESERVE IN/OUT
fit into 8k buffers.

This patch breaks the libmpathpersist ABI.

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

