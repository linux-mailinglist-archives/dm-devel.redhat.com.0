Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 31E31157201
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 10:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581327962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XQ/WFTdC60ASkFXCutrEeXiO9j9QCvavQxYDsf7/mDo=;
	b=Bn/RSw3S/i0LPRJ7Ur0/K0s97iKQZFOEszPImdi91doPyzhl8tFlG/1avo5W39v3IMDeuA
	FP0q3WISi1sDgm2IQYzEjpZg/6k/WQHFfS/VGww4bLeXWIQqg4UoKHsA/IrZFK+w3gtmqq
	EtWIxkmg1WfWXvWn1bGkpibMWtLRbKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-vjyksmNePN6aD1y8pw7fkw-1; Mon, 10 Feb 2020 04:45:12 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25C9D107ACCA;
	Mon, 10 Feb 2020 09:45:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 091A889F35;
	Mon, 10 Feb 2020 09:45:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E16718089CD;
	Mon, 10 Feb 2020 09:44:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017F3wAx005624 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 10:03:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 90033117928; Fri,  7 Feb 2020 15:03:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87482109941
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 15:03:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C53A18EB458
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 15:03:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-10-cur-ZLfoPo6dcP3wLuCNnw-1;
	Fri, 07 Feb 2020 10:03:49 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E6FD0B245;
	Fri,  7 Feb 2020 14:45:34 +0000 (UTC)
From: Enzo Matsumiya <ematsumiya@suse.de>
To: christophe.varoqui@opensvc.com
Date: Fri,  7 Feb 2020 11:45:25 -0300
Message-Id: <20200207144525.16341-1-ematsumiya@suse.de>
X-MC-Unique: cur-ZLfoPo6dcP3wLuCNnw-1
X-MC-Unique: vjyksmNePN6aD1y8pw7fkw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017F3wAx005624
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Feb 2020 04:44:34 -0500
Cc: Enzo Matsumiya <ematsumiya@suse.de>, dm-devel@redhat.com,
	Martin.Wilck@suse.com
Subject: [dm-devel] [PATCH 1/1] libmultipath: fix files read from config_dir
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If config_dir contains a file named, for example, "some.conf.backup", this file
will still be loaded by multipath because process_config_dir()
(libmultipath/config.c) uses strstr() to check for the ".conf" extension, but
that doesn't guarantee that ".conf" is at the end of the filename.

This patch will make sure that only files ending in ".conf" are loaded from
config_dir.

This is to comply with config_dir entry description in man 5 multipath.conf.

Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
---
 libmultipath/config.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 20e3b8bf..4785ade8 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -671,8 +671,11 @@ process_config_dir(struct config *conf, vector keywords, char *dir)
 	sr.n = n;
 	pthread_cleanup_push_cast(free_scandir_result, &sr);
 	for (i = 0; i < n; i++) {
-		if (!strstr(namelist[i]->d_name, ".conf"))
+		char *ext = strrchr(namelist[i]->d_name, '.');
+
+		if (!ext || strcmp(ext, ".conf"))
 			continue;
+
 		old_hwtable_size = VECTOR_SIZE(conf->hwtable);
 		snprintf(path, LINE_MAX, "%s/%s", dir, namelist[i]->d_name);
 		path[LINE_MAX-1] = '\0';
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

