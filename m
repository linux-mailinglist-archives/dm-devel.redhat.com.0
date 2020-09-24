Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8308E277297
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:38:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-TCC7ivUPPQSWTl1de9az_w-1; Thu, 24 Sep 2020 09:37:32 -0400
X-MC-Unique: TCC7ivUPPQSWTl1de9az_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3865E1007471;
	Thu, 24 Sep 2020 13:37:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1627C73697;
	Thu, 24 Sep 2020 13:37:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B61528C7A4;
	Thu, 24 Sep 2020 13:37:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODbHDd025502 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:37:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FB7C10AF9D5; Thu, 24 Sep 2020 13:37:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97BAD11921BE
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDE3C18AE948
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:11 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-280-92Dm05EVPT2GDutREVaiaQ-1;
	Thu, 24 Sep 2020 09:37:09 -0400
X-MC-Unique: 92Dm05EVPT2GDutREVaiaQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1B51DB10B;
	Thu, 24 Sep 2020 13:37:06 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:38 +0200
Message-Id: <20200924133644.14034-6-mwilck@suse.com>
In-Reply-To: <20200924133644.14034-1-mwilck@suse.com>
References: <20200924133644.14034-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODbHDd025502
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 05/11] libmultipath: prio: constify some function
	parameters
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

---
 libmultipath/prio.c | 4 ++--
 libmultipath/prio.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/libmultipath/prio.c b/libmultipath/prio.c
index 194563c..3a718ba 100644
--- a/libmultipath/prio.c
+++ b/libmultipath/prio.c
@@ -18,7 +18,7 @@ unsigned int get_prio_timeout(unsigned int timeout_ms,
 	return default_timeout;
 }
 
-int init_prio (char *multipath_dir)
+int init_prio (const char *multipath_dir)
 {
 	if (!add_prio(multipath_dir, DEFAULT_PRIO))
 		return 1;
@@ -87,7 +87,7 @@ int prio_set_args (struct prio * p, const char * args)
 	return snprintf(p->args, PRIO_ARGS_LEN, "%s", args);
 }
 
-struct prio * add_prio (char *multipath_dir, char * name)
+struct prio * add_prio (const char *multipath_dir, const char * name)
 {
 	char libname[LIB_PRIO_NAMELEN];
 	struct stat stbuf;
diff --git a/libmultipath/prio.h b/libmultipath/prio.h
index 599d1d8..26754f7 100644
--- a/libmultipath/prio.h
+++ b/libmultipath/prio.h
@@ -55,9 +55,9 @@ struct prio {
 
 unsigned int get_prio_timeout(unsigned int checker_timeout,
 			      unsigned int default_timeout);
-int init_prio (char *);
+int init_prio (const char *);
 void cleanup_prio (void);
-struct prio * add_prio (char *, char *);
+struct prio * add_prio (const char *, const char *);
 int prio_getprio (struct prio *, struct path *, unsigned int);
 void prio_get (char *, struct prio *, char *, char *);
 void prio_put (struct prio *);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

