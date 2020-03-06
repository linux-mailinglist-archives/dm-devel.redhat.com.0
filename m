Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8F617C8AE
	for <lists+dm-devel@lfdr.de>; Sat,  7 Mar 2020 00:07:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583536040;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rKtu6pTvNbB0LrAWgGAeiZbaLI3jBHVO+CUsQRW6n7Y=;
	b=hrGVsnE2EW+/uSHSPRV3EpjEeJaJ2FW1bedf4mISf8W/ALphK54t7vn2qYJPsvdZ/ZpzSz
	C7482pjvL2vZKEBKKoDXNnpS7F7+u/4kN2NOFfVNsqkUk1f2+xLZw8TWBVgVUcwbIzqT3x
	ULMQTfAb3HXMLrnXPTwjKDAaSao+BTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-QzgKU5boNfKqpEUzE3-aeQ-1; Fri, 06 Mar 2020 18:07:17 -0500
X-MC-Unique: QzgKU5boNfKqpEUzE3-aeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6707213F9;
	Fri,  6 Mar 2020 23:07:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 346FF60BE0;
	Fri,  6 Mar 2020 23:07:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB79318089CD;
	Fri,  6 Mar 2020 23:07:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026N6Zba011267 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 18:06:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E34D2166B2C; Fri,  6 Mar 2020 23:06:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79E862166B28
	for <dm-devel@redhat.com>; Fri,  6 Mar 2020 23:06:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9317E8BA508
	for <dm-devel@redhat.com>; Fri,  6 Mar 2020 23:06:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-167-hOHhPSeDNI-7RKsnESpLHQ-1;
	Fri, 06 Mar 2020 18:06:31 -0500
X-MC-Unique: hOHhPSeDNI-7RKsnESpLHQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9EAF1AE17;
	Fri,  6 Mar 2020 23:06:29 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat,  7 Mar 2020 00:06:02 +0100
Message-Id: <20200306230605.3473-2-mwilck@suse.com>
In-Reply-To: <20200306230605.3473-1-mwilck@suse.com>
References: <20200306230605.3473-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 026N6Zba011267
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>,
	David Bond <dbond@suse.com>
Subject: [dm-devel] [PATCH 1/4] libmpathpersist: limit PRIN allocation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

