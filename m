Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 87751219E07
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:38:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-LDT2ublhP-WyqrafrHQ-Bw-1; Thu, 09 Jul 2020 06:37:05 -0400
X-MC-Unique: LDT2ublhP-WyqrafrHQ-Bw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BD1B107BEF7;
	Thu,  9 Jul 2020 10:36:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75100100239A;
	Thu,  9 Jul 2020 10:36:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C49993F91;
	Thu,  9 Jul 2020 10:36:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AanDn031611 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30FF85F253; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF235F248
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24D07185A797
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-420-VnUMMMJkMe-2ERj_-qywMQ-1;
	Thu, 09 Jul 2020 06:36:44 -0400
X-MC-Unique: VnUMMMJkMe-2ERj_-qywMQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B558DAE39;
	Thu,  9 Jul 2020 10:36:42 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:21 +0200
Message-Id: <20200709103623.8302-11-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AanDn031611
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 52/54] libmultipath: constify get_mpe_wwid()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

As this returns a pointer to a struct member, the return value
should also be a const char*.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/config.c    | 2 +-
 libmultipath/config.h    | 2 +-
 libmultipath/configure.c | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 658bec8..69a2723 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -157,7 +157,7 @@ struct mpentry *find_mpe(vector mptable, char *wwid)
 	return NULL;
 }
 
-char *get_mpe_wwid(vector mptable, char *alias)
+const char *get_mpe_wwid(const struct _vector *mptable, const char *alias)
 {
 	int i;
 	struct mpentry * mpe;
diff --git a/libmultipath/config.h b/libmultipath/config.h
index 92c61a0..2bb7153 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -239,7 +239,7 @@ int find_hwe (const struct _vector *hwtable,
 	      const char * vendor, const char * product, const char *revision,
 	      vector result);
 struct mpentry * find_mpe (vector mptable, char * wwid);
-char * get_mpe_wwid (vector mptable, char * alias);
+const char *get_mpe_wwid (const struct _vector *mptable, const char *alias);
 
 struct hwentry * alloc_hwe (void);
 struct mpentry * alloc_mpe (void);
diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index db9a255..7461e99 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1350,7 +1350,8 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 	int ret = 1;
 	struct path * pp;
 	char buff[FILE_NAME_SIZE];
-	char * refwwid = NULL, tmpwwid[WWID_SIZE];
+	const char *refwwid = NULL;
+	char tmpwwid[WWID_SIZE];
 	struct udev_device *udevice;
 	int flags = DI_SYSFS | DI_WWID;
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

