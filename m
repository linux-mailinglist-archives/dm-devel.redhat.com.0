Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C3B53185FE9
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 22:06:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584306381;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xVuXAKUdiPTA4374MbuCLMRHOLVQEcNVeMpHMLcPCdo=;
	b=heR3ALcOzsiiHygw2ht52mMhoX5fU+Kqeedf9zlangcGcMyYMOWPLpaeEQdAqC0kcP47vq
	20rj8/tWsEGMxerNR2dSiL6FoVy5St5gc4atKlonXb2aRcBfB2KQDhFrzteAyUB3qOXkO6
	Eg1djIEzuECCPpglgrgWErJTFQpCcHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-YMQO7oHeMQmJ_h9syjQjxQ-1; Sun, 15 Mar 2020 17:06:19 -0400
X-MC-Unique: YMQO7oHeMQmJ_h9syjQjxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C28413F6;
	Sun, 15 Mar 2020 21:06:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7C895DA7C;
	Sun, 15 Mar 2020 21:06:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D391A18089CD;
	Sun, 15 Mar 2020 21:06:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02FL5tM9008161 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Mar 2020 17:05:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6F1410EE788; Sun, 15 Mar 2020 21:05:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB1410EE785
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 21:05:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DB308007AC
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 21:05:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-77-fO98HXNUNkG8ABULAV5GsQ-1;
	Sun, 15 Mar 2020 17:05:50 -0400
X-MC-Unique: fO98HXNUNkG8ABULAV5GsQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 40715AD08;
	Sun, 15 Mar 2020 21:05:49 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sun, 15 Mar 2020 22:05:19 +0100
Message-Id: <20200315210521.12109-3-mwilck@suse.com>
In-Reply-To: <20200315210521.12109-1-mwilck@suse.com>
References: <20200315210521.12109-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02FL5tM9008161
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 2/4] libmpathpersist: format_transportids():
	avoid PROUT overflow
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This limits the PERSISTENT RESERVE OUT data size to max. 8192 bytes.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_pr_ioctl.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
index 1a28cba7..c78e8000 100644
--- a/libmpathpersist/mpath_pr_ioctl.c
+++ b/libmpathpersist/mpath_pr_ioctl.c
@@ -1,5 +1,6 @@
 #include <stdio.h>
 #include <stdlib.h>
+#include <stddef.h>
 
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -138,38 +139,64 @@ retry :
 	return status;
 }
 
+/*
+ * Helper macro to avoid overflow of prout_param_descriptor in
+ * format_transportids(). Data must not be written past
+ * MPATH_MAX_PARAM_LEN bytes from struct prout_param_descriptor.
+ */
+#define check_overflow(ofs, n, start, label)				\
+	do {								\
+		if ((ofs) + (n) +					\
+		    offsetof(struct prout_param_descriptor, private_buffer) \
+		    > MPATH_MAX_PARAM_LEN)				\
+		{							\
+			(ofs) = (start);				\
+			goto label;					\
+		}							\
+	} while(0)
+
 uint32_t  format_transportids(struct prout_param_descriptor *paramp)
 {
 	unsigned int i = 0, len;
 	uint32_t buff_offset = 4;
-	memset(paramp->private_buffer, 0, MPATH_MAX_PARAM_LEN);
+	memset(paramp->private_buffer, 0, sizeof(paramp->private_buffer));
 	for (i=0; i < paramp->num_transportid; i++ )
 	{
+		uint32_t start_offset = buff_offset;
+
+		check_overflow(buff_offset, 1, start_offset, end_loop);
 		paramp->private_buffer[buff_offset] = (uint8_t)((paramp->trnptid_list[i]->format_code & 0xff)|
 							(paramp->trnptid_list[i]->protocol_id & 0xff));
 		buff_offset += 1;
 		switch(paramp->trnptid_list[i]->protocol_id)
 		{
 			case MPATH_PROTOCOL_ID_FC:
+				check_overflow(buff_offset, 7 + 8 + 8,
+					       start_offset, end_loop);
 				buff_offset += 7;
 				memcpy(&paramp->private_buffer[buff_offset], &paramp->trnptid_list[i]->n_port_name, 8);
 				buff_offset +=8 ;
 				buff_offset +=8 ;
 				break;
 			case MPATH_PROTOCOL_ID_SAS:
+				check_overflow(buff_offset, 3 + 12,
+					       start_offset, end_loop);
 				buff_offset += 3;
 				memcpy(&paramp->private_buffer[buff_offset], &paramp->trnptid_list[i]->sas_address, 8);
 				buff_offset += 12;
 				break;
 			case MPATH_PROTOCOL_ID_ISCSI:
-				buff_offset += 1;
 				len = (paramp->trnptid_list[i]->iscsi_name[1] & 0xff)+2;
+				check_overflow(buff_offset, 1 + len,
+					       start_offset, end_loop);
+				buff_offset += 1;
 				memcpy(&paramp->private_buffer[buff_offset], &paramp->trnptid_list[i]->iscsi_name,len);
 				buff_offset += len ;
 				break;
 		}
 
 	}
+end_loop:
 	buff_offset -= 4;
 	paramp->private_buffer[0] = (unsigned char)((buff_offset >> 24) & 0xff);
 	paramp->private_buffer[1] = (unsigned char)((buff_offset >> 16) & 0xff);
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

