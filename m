Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA50219E02
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:37:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-793FiIstM9aOMFMsTSLMOA-1; Thu, 09 Jul 2020 06:37:12 -0400
X-MC-Unique: 793FiIstM9aOMFMsTSLMOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B75F988C7A2;
	Thu,  9 Jul 2020 10:36:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92F066FED8;
	Thu,  9 Jul 2020 10:36:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43E061806B0B;
	Thu,  9 Jul 2020 10:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AaoAN031655 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6FEA65F248; Thu,  9 Jul 2020 10:36:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BBEA4C821
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50F3D856A54
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-349-1A_o_2dbP5GvrZkkLy53Xg-1;
	Thu, 09 Jul 2020 06:36:45 -0400
X-MC-Unique: 1A_o_2dbP5GvrZkkLy53Xg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F1970AE44;
	Thu,  9 Jul 2020 10:36:42 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:22 +0200
Message-Id: <20200709103623.8302-12-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AaoAN031655
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 53/54] multipath: call strchop() on command line
	argument
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

It's useful to sanitize these right away. We can't do this for DEV_DEVMAP,
as aliases with trailing whitespace aren't strictly forbidden, but for
the other types we can.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/multipath/main.c b/multipath/main.c
index 4c43314..cfb85dc 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -1028,6 +1028,8 @@ main (int argc, char *argv[])
 			condlog(0, "'%s' is not a valid argument\n", dev);
 			goto out;
 		}
+		if (dev_type == DEV_DEVNODE || dev_type == DEV_DEVT)
+			strchop(dev);
 	}
 	if (dev_type == DEV_UEVENT) {
 		openlog("multipath", 0, LOG_DAEMON);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

