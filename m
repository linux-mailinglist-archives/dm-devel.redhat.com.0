Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C474D185FE7
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 22:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584306379;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CpC+7auU2Q/9ETJU5qlNzfxMdRvLX7MaQqlQ2CPM2iM=;
	b=PpddNX2VwHCz+H1n9BoR2o4BTjIKmpk6YllaDFAaAj7k7GDC4m6afMCc0sNRVRbeUyCcxu
	mKTov+TzrVdYT6HQ6LPidM9bLi6jkCNZsUNUKZ24+Cwh/v39AfZGIQd5TIrXdl4ZQQZCxN
	3PKZv+7w7DKmkH8hRU6A+UPFu1rJUZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-yzDdnHUKMM6c1o9oe6n5Gw-1; Sun, 15 Mar 2020 17:06:17 -0400
X-MC-Unique: yzDdnHUKMM6c1o9oe6n5Gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68652184D29F;
	Sun, 15 Mar 2020 21:06:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1AB10246E3;
	Sun, 15 Mar 2020 21:06:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA4D818089CE;
	Sun, 15 Mar 2020 21:06:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02FL5tbV008160 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Mar 2020 17:05:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D919710EE785; Sun, 15 Mar 2020 21:05:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB5510EE787
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 21:05:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35757800297
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 21:05:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-165-L3ly3_yzOR-nAnRUMaObCg-1;
	Sun, 15 Mar 2020 17:05:50 -0400
X-MC-Unique: L3ly3_yzOR-nAnRUMaObCg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1B39DAC66;
	Sun, 15 Mar 2020 21:05:49 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sun, 15 Mar 2020 22:05:18 +0100
Message-Id: <20200315210521.12109-2-mwilck@suse.com>
In-Reply-To: <20200315210521.12109-1-mwilck@suse.com>
References: <20200315210521.12109-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02FL5tbV008160
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/4] libmpathpersist: limit PRIN allocation
	length to 8192 bytes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Some targets (notably the qemu-pr-helper) don't support PERSISTENT
RESERVE IN  commands with more than 8192 bytes allocation length.
While I have found no explicit requirement in the SCSI specs that
the allocation lengh may not exceed 8k, an 8k limit is also enforced
by sg_persist(8), and actually by mpathpersist itself for the
--allocation-length option, but not for the auto-determined length.

Fix that.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_pr_ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libmpathpersist/mpath_pr_ioctl.c b/libmpathpersist/mpath_pr_ioctl.c
index 74b26b0c..1a28cba7 100644
--- a/libmpathpersist/mpath_pr_ioctl.c
+++ b/libmpathpersist/mpath_pr_ioctl.c
@@ -543,5 +543,7 @@ int get_prin_length(int rq_servact)
 			mx_resp_len = 0;
 			break;
 	}
+	if (mx_resp_len > MPATH_MAX_PARAM_LEN)
+		mx_resp_len = MPATH_MAX_PARAM_LEN;
 	return mx_resp_len;
 }
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

