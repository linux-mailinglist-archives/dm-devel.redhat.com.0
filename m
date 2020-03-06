Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD7E17C8AD
	for <lists+dm-devel@lfdr.de>; Sat,  7 Mar 2020 00:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583536039;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=69lKrrRhPQHZz/qXEaMndHP/nPf4s619wMmwcD/bW60=;
	b=e/PJjeW2slOATfNQr8JmWmJu7KcqrGg7GMeaxqkEhLceNukasDleFKy6XbrSXx2/c9LQlF
	h+Lj/74fUtWDWYJvpffO8i9dv/MF92lkXn9RRdMz5Y9IrB5756gFyJIblrujPH9UfxGTtX
	PN0N6tHu/6tCQkXBJ0tezEpdxlVeXB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-slhDj19FPR-IGTj5DKnvjg-1; Fri, 06 Mar 2020 18:07:15 -0500
X-MC-Unique: slhDj19FPR-IGTj5DKnvjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33273100550E;
	Fri,  6 Mar 2020 23:07:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE7EE1BC6D;
	Fri,  6 Mar 2020 23:07:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54DFA18089CD;
	Fri,  6 Mar 2020 23:07:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026N6Za9011266 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 18:06:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7D76F2166B2B; Fri,  6 Mar 2020 23:06:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 796582166B2C
	for <dm-devel@redhat.com>; Fri,  6 Mar 2020 23:06:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BF538BA502
	for <dm-devel@redhat.com>; Fri,  6 Mar 2020 23:06:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-45-ZLvD9UmBMgWWLNntts4MWQ-1;
	Fri, 06 Mar 2020 18:06:31 -0500
X-MC-Unique: ZLvD9UmBMgWWLNntts4MWQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 08BE9B03C;
	Fri,  6 Mar 2020 23:06:30 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat,  7 Mar 2020 00:06:04 +0100
Message-Id: <20200306230605.3473-4-mwilck@suse.com>
In-Reply-To: <20200306230605.3473-1-mwilck@suse.com>
References: <20200306230605.3473-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 026N6Za9011266
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>,
	David Bond <dbond@suse.com>
Subject: [dm-devel] [PATCH 3/4] libmpathpersist:
	mpath_format_readfullstatus(): use real buffer size
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

This changes no semantics, but it will allow changing the size of
prin_readfd.private_buffer in a follow-up patch.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_pr_ioctl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
index 8bf16c0d..8d8ca76f 100644
--- a/libmpathpersist/mpath_pr_ioctl.c
+++ b/libmpathpersist/mpath_pr_ioctl.c
@@ -233,6 +233,8 @@ static void mpath_format_readfullstatus(struct prin_resp *pr_buff)
 	uint32_t additional_length, k, tid_len_len = 0;
 	char tempbuff[MPATH_MAX_PARAM_LEN];
 	struct prin_fulldescr fdesc;
+	static const int pbuf_size =
+		sizeof(pr_buff->prin_descriptor.prin_readfd.private_buffer);
 
 	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readfd.prgeneration);
 	convert_be32_to_cpu(&pr_buff->prin_descriptor.prin_readfd.number_of_descriptor);
@@ -244,16 +246,18 @@ static void mpath_format_readfullstatus(struct prin_resp *pr_buff)
 	}
 
 	additional_length = pr_buff->prin_descriptor.prin_readfd.number_of_descriptor;
-	if (additional_length > MPATH_MAX_PARAM_LEN) {
+	if (additional_length > pbuf_size) {
 		condlog(3, "PRIN length %u exceeds max length %d", additional_length,
-			MPATH_MAX_PARAM_LEN);
+			pbuf_size);
 		return;
 	}
 
 	memset(&fdesc, 0, sizeof(struct prin_fulldescr));
 
-	memcpy( tempbuff, pr_buff->prin_descriptor.prin_readfd.private_buffer,MPATH_MAX_PARAM_LEN );
-	memset(&pr_buff->prin_descriptor.prin_readfd.private_buffer, 0, MPATH_MAX_PARAM_LEN);
+	memcpy( tempbuff, pr_buff->prin_descriptor.prin_readfd.private_buffer,
+		pbuf_size);
+	memset(&pr_buff->prin_descriptor.prin_readfd.private_buffer, 0,
+	       pbuf_size);
 
 	p =(unsigned char *)tempbuff;
 	ppbuff = (char *)pr_buff->prin_descriptor.prin_readfd.private_buffer;
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

