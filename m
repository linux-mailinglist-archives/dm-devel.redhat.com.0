Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CBBED22D1D8
	for <lists+dm-devel@lfdr.de>; Sat, 25 Jul 2020 00:35:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-TB6eJjEEN4SbRicbYDHfUg-1; Fri, 24 Jul 2020 18:34:59 -0400
X-MC-Unique: TB6eJjEEN4SbRicbYDHfUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04ABD189CF04;
	Fri, 24 Jul 2020 22:34:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA97C2B6FF;
	Fri, 24 Jul 2020 22:34:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF3F31809554;
	Fri, 24 Jul 2020 22:34:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06OMYZKc012253 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 18:34:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 14A49207B2B8; Fri, 24 Jul 2020 22:34:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 100C9207B2B0
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 22:34:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C04621012443
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 22:34:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-158-1QstNmtqNV-t6gHmNI574w-1; Fri, 24 Jul 2020 18:34:30 -0400
X-MC-Unique: 1QstNmtqNV-t6gHmNI574w-1
Received: by mail-wr1-f53.google.com with SMTP id z18so6020965wrm.12;
	Fri, 24 Jul 2020 15:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:mime-version
	:content-language:content-transfer-encoding;
	bh=u38xi1+AVJHre7qskT/YinUVDsmknHtYRB/XFGINS0k=;
	b=RQ2t3em4p7N2raXhhKBVVTbfYijCfl1bh6bHX3xshLEH7t7fOweSPS2o/iEQsC0l+d
	YF4f5CEx/1oLOHoJr3gkmd0xO5AKWi46vzmPpmCzqwY0mDFuXAjcz6rAElJQVzgVoJ4k
	ft07hUvkTCaNUutffemmcYR5fFhZ3UsnBWtMSYYwHX4VpkCMWJKtTIMx1+S7QbbCWEcX
	00Q9ckTiB94JYK5A++N4d9xKFbmArjN+tK/6PwPCp21ATxw3+ffyoszDbL52f+QxrLGF
	CFX/vJ/8hnpb52Lm/6QAfBxPLz6tta9wJUwfLYhkSER8Git0tEPsXbf2+AXczfnUEQYE
	zU2A==
X-Gm-Message-State: AOAM530ouWt3+6mZHmovP9njYRfXgv8VKRRZ0cem3RlvOJ9wmMnoPJnL
	NsQPfJU7w4Xa1LrSXzXr8rKASzE=
X-Google-Smtp-Source: ABdhPJxMgInTQWNGVdf4naVvkYAFqcpLaVMhV0xJqw9Gb/jy6BymBA0gwS1za2uLpiMrylzlrcWO5g==
X-Received: by 2002:a5d:6a4a:: with SMTP id t10mr10931956wrw.360.1595630068696;
	Fri, 24 Jul 2020 15:34:28 -0700 (PDT)
Received: from localhost (66.red-83-37-181.dynamicip.rima-tde.net.
	[83.37.181.66])
	by smtp.gmail.com with ESMTPSA id v12sm2879605wrs.2.2020.07.24.15.34.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jul 2020 15:34:28 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Hannes Reinecke <hare@suse.de>, DM-DEVEL ML <dm-devel@redhat.com>
Message-ID: <acc2f009-c4b8-0c09-c77c-9400aac38cb1@gmail.com>
Date: Sat, 25 Jul 2020 00:34:27 +0200
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH RFC] multipath-tools: *untested* use sysfs prio
 also for arrays with dual implicit/explicit alua support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit


Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Hannes Reinecke <hare@suse.de>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 897e48ca..5a82234f 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -595,7 +595,7 @@ detect_prio(struct config *conf, struct path * pp)
  		tpgs = path_get_tpgs(pp);
  		if (tpgs == TPGS_NONE)
  			return;
-		if ((tpgs == TPGS_EXPLICIT || !check_rdac(pp)) &&
+		if ((tpgs == TPGS_EXPLICIT || tpgs == TPGS_BOTH || !check_rdac(pp)) &&
  		    sysfs_get_asymmetric_access_state(pp, buff, 512) >= 0)
  			default_prio = PRIO_SYSFS;
  		else

In short:

diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 897e48ca..a9609a01 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -595,7 +595,7 @@ detect_prio(struct config *conf, struct path * pp)
  		tpgs = path_get_tpgs(pp);
  		if (tpgs == TPGS_NONE)
  			return;
-		if ((tpgs == TPGS_EXPLICIT || !check_rdac(pp)) &&
+		if ((tpgs != TPGS_IMPLICIT || !check_rdac(pp)) &&
  		    sysfs_get_asymmetric_access_state(pp, buff, 512) >= 0)
  			default_prio = PRIO_SYSFS;
  		else

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

