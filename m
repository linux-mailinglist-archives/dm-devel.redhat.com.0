Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED482772B8
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:40:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563--LogvFCPNAW3Xz7Yzedhqg-1; Thu, 24 Sep 2020 09:40:12 -0400
X-MC-Unique: -LogvFCPNAW3Xz7Yzedhqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CE601084D74;
	Thu, 24 Sep 2020 13:40:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91ED78437;
	Thu, 24 Sep 2020 13:40:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 840C81826D34;
	Thu, 24 Sep 2020 13:40:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODe2CJ026305 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:40:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9FD02166B27; Thu, 24 Sep 2020 13:40:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E393C2156A2D
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6630380158E
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-482-52w4mQLaOMaRFc7tqN_9sw-1;
	Thu, 24 Sep 2020 09:39:29 -0400
X-MC-Unique: 52w4mQLaOMaRFc7tqN_9sw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9A493B135;
	Thu, 24 Sep 2020 13:39:27 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:37:15 +0200
Message-Id: <20200924133716.14120-21-mwilck@suse.com>
In-Reply-To: <20200924133716.14120-1-mwilck@suse.com>
References: <20200924133716.14120-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODe2CJ026305
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 20/21] mpathpersist: remove logsink and udev
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We can use libmultipath's internal symbols now. The libmultipath
initialization is taken care of by libmpathpersist_init().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 mpathpersist/main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 278e48f..3c2e657 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -42,13 +42,10 @@ void * mpath_alloc_prin_response(int prin_sa);
 void mpath_print_transport_id(struct prin_fulldescr *fdesc);
 int construct_transportid(const char * inp, struct transportid transid[], int num_transportids);
 
-int logsink;
-
 void rcu_register_thread_memb(void) {}
 
 void rcu_unregister_thread_memb(void) {}
 
-struct udev *udev;
 
 static int verbose, loglevel, noisy;
 
@@ -641,16 +638,13 @@ int main(int argc, char *argv[])
 		exit (1);
 	}
 
-	udev = udev_new();
 	if (libmpathpersist_init()) {
-		udev_unref(udev);
 		exit(1);
 	}
 
 	ret = handle_args(argc, argv, 0);
 
 	libmpathpersist_exit();
-	udev_unref(udev);
 
 	return (ret >= 0) ? ret : MPATH_PR_OTHER;
 }
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

