Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3198028C
	for <lists+dm-devel@lfdr.de>; Sat,  3 Aug 2019 00:09:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09717308FC22;
	Fri,  2 Aug 2019 22:09:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B975C220;
	Fri,  2 Aug 2019 22:09:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D3021800204;
	Fri,  2 Aug 2019 22:09:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72M3sdU027170 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 18:03:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7ED2619D70; Fri,  2 Aug 2019 22:03:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C51819C70;
	Fri,  2 Aug 2019 22:03:48 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A31775AFE3;
	Fri,  2 Aug 2019 22:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1564783417; x=1596319417;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=zU3ikIWVxGMkAFf8epj4nTgDxhosVsB4gUBv9UWh4jw=;
	b=R8s7DB8cxNaEzvkxVGqwQz+LGKk0jjWmhGtgPbhlQoUC+YhBuzr+/cCS
	8noxx8YCuhbWMRMSx+L8FzTC6mUuJbWgBQXxhY6Wer6at08Z86bQotuIp
	/pJKaCMPZn4bEo1YQjfy56DmLNn2g1DH9q9kTuXr/4KdFSeBQ/Uzr9imc
	w6EbE3fKvjjGz+tJtMWxYfu/NyJuxXy+xjvELGVpTq9Cc+AIRNPNG5K8O
	CTyfbAByuIdNGBn7wEZ2Kd1rGKx0tkAMerynMcOXmGzvfPcbnmtZCD2qi
	UKAjZAlpnJXE2gQqMR1BC20iEnglOBunGNAsHsgzY/7SR4x2zzNuqhDt+ A==;
IronPort-SDR: PpzSrhLx3WXKl7mzqi/KbjNsvt8Yumi7are8PKL2S5Ncov8n5MISfwS5Dn+PSCdOgfk7J0F5nD
	T884qZ+fJaTbRXBjIQYhjRb01HsJd9BT4kENqMHX5gZa8EQWdYhSwZbTFK1NvpG5xKl6ocbtnE
	Dp8/xhkBuB9rq8Id/L+nfdCJzAXqLctZCdK5OJ85/twqBbfXzUzPtywN5z7twlUC5gMPxnlj4e
	lYp2JSP2hoY8Bct9zeCCklY+l2d1Zlo1AsaM0XfH2EoeZgyeyGlIcjgFhBzr4jZxFeOE0p2nBv
	RlQ=
X-IronPort-AV: E=Sophos;i="5.64,339,1559491200"; d="scan'208";a="116441579"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 03 Aug 2019 06:02:55 +0800
IronPort-SDR: SfxAsPDJe/0JMG8u2OACn1Ka/yw/NmU5q7jT9H9vrsdJdt1gPDH3iq4WSMifBKiUpaQVI3D6mb
	4HYrHst+TBfQvHIYKfatd8NKtIKtcN1Q0EaulE6jDejPKfXcn0GPq2JB2pazbUwio8SYXO2GHE
	TOHfEN3Ayoc8ae+dUX3DnWffGAmfpzrJr7kMiVofYPx3fLybk3TgdZ1jpSjdiRNqRVolusqEf4
	hoI3YDpKBGyYAxdW2FVgAro3iomSA1HypKWL3esnau5dZSbn8CsgsFGrdS6d9SDXqtkccsT/Q9
	F0cqu5t0cDEgE9Ozfraz4KZk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	02 Aug 2019 15:00:50 -0700
IronPort-SDR: iABc9s5kgeagipVr0MvTQzDFRmfdYcV0TSm0mNmkfnDRYfbMJS1wzAXUKtMfegPa6anPLdxGkN
	pOOX0P2xbIc8qFFNTcVgnfw0ZSRq/9DJ45D098cdB3PT1ERSMJ/tojwnc0q6LOuGkGIZsI9fxj
	H+0uqVrq0w5uHMod3JojOIQo69GtZEaVabHCEu7ChWtFhLu1kyr/ZFiDgwM9z9kSWqmmeLpHO+
	vqqwRaUag1//dxZYaXQVd6cdZ09vLSYuUbqqQzh1Kd3YhH+5euiXda70eTTmP+3Xq5AFd9hhoQ
	jDc=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 02 Aug 2019 15:02:54 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Fri,  2 Aug 2019 15:02:50 -0700
Message-Id: <20190802220251.1217-2-dmitry.fomichev@wdc.com>
In-Reply-To: <20190802220251.1217-1-dmitry.fomichev@wdc.com>
References: <20190802220251.1217-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Fri, 02 Aug 2019 22:03:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 02 Aug 2019 22:03:36 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=110ab3187=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 1/2] dm-zoned: add SPDX license identifiers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 02 Aug 2019 22:09:36 +0000 (UTC)

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 1 +
 drivers/md/dm-zoned-reclaim.c  | 1 +
 drivers/md/dm-zoned-target.c   | 1 +
 drivers/md/dm-zoned.h          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 8545dcee9fd0..23e9a6d9350b 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2017 Western Digital Corporation or its affiliates.
  *
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index edf4b95eb075..387894e2add1 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2017 Western Digital Corporation or its affiliates.
  *
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 51d029bbb740..1bf6e6eebee1 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2017 Western Digital Corporation or its affiliates.
  *
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index ed8de49c9a08..1a3b06de2c00 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2017 Western Digital Corporation or its affiliates.
  *
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
