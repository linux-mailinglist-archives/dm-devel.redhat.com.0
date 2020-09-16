Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5628B26C46B
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 17:40:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-uX5mmEKhMR-Z7mUfP0cdOA-1; Wed, 16 Sep 2020 11:40:08 -0400
X-MC-Unique: uX5mmEKhMR-Z7mUfP0cdOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A87A84E245;
	Wed, 16 Sep 2020 15:40:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D512C60E1C;
	Wed, 16 Sep 2020 15:40:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87826183D036;
	Wed, 16 Sep 2020 15:40:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GFdZnV024293 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:39:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFDB52016F2C; Wed, 16 Sep 2020 15:39:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB702026F94
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2939101AA45
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:34 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-411-jCu8YrJ4PmKp8k5PbluEPA-1;
	Wed, 16 Sep 2020 11:39:30 -0400
X-MC-Unique: jCu8YrJ4PmKp8k5PbluEPA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 95A23B3D5;
	Wed, 16 Sep 2020 15:39:42 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 17:37:18 +0200
Message-Id: <20200916153718.582-20-mwilck@suse.com>
In-Reply-To: <20200916153718.582-1-mwilck@suse.com>
References: <20200916153718.582-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GFdZnV024293
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 19/19] mpathpersist: remove logsink and udev
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We can use libmultipath's internal symbols now.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 mpathpersist/main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 0f0db4b..729857f 100644
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
 
@@ -608,16 +605,17 @@ int main(int argc, char *argv[])
 		exit (1);
 	}
 
-	udev = udev_new();
+	if (libmultipath_init())
+		exit(1);
 	if (libmpathpersist_init()) {
-		udev_unref(udev);
+		libmultipath_exit();
 		exit(1);
 	}
 
 	ret = handle_args(argc, argv, 0);
 
 	libmpathpersist_exit();
-	udev_unref(udev);
+	libmultipath_exit();
 
 	return (ret >= 0) ? ret : MPATH_PR_OTHER;
 }
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

