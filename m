Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2B270217A26
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 23:22:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-9nlD8qGNPeacU29hCN126g-1; Tue, 07 Jul 2020 17:22:24 -0400
X-MC-Unique: 9nlD8qGNPeacU29hCN126g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BC1BFC0;
	Tue,  7 Jul 2020 21:22:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ADF679CE4;
	Tue,  7 Jul 2020 21:22:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BD8272F4D;
	Tue,  7 Jul 2020 21:22:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067LI5ar010493 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 17:18:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D8814C816; Tue,  7 Jul 2020 21:18:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65B388287D
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 21:18:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66A888007D0
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 21:18:03 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-5Waj_4_nOLOgsRTxjjEhsg-1; Tue, 07 Jul 2020 17:18:01 -0400
X-MC-Unique: 5Waj_4_nOLOgsRTxjjEhsg-1
Received: by mail-wm1-f68.google.com with SMTP id l2so686014wmf.0;
	Tue, 07 Jul 2020 14:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cLHz9dbPtFa6pyCNteEwZJnsZ87V50CW05UmV8YwEk4=;
	b=RQBqFGm0FtGJSQPxMYNgwySBa9ZME4ZYUxceKQ0vGmHv8zDjlf4aNV5KNodCW9zA2C
	0woVKY54amhoq1t3Nu0v6ew2nmOJmcctZRebXNButgG/ubj5ZRRTpJ0mNEkWlpCUcF31
	PAqdMlRuEgENRk9qR8oS1KZ5mpm4IK1qryNsN93oN/xZyzpp1HtmUZyR2fFwsu7+2SX6
	h2Zh6txV0DDm1x2qAvitSuG52XL0wqdetg8c2kmaPbkk+YkDayRQqvEruacrbV0t9lkh
	QDY8xyk19nZ2p5UQ2HWx0quK/Z54Yq0erkGkE+/CAB2ubTtovOU1iEKXQmBEkUlrUdHy
	NiPQ==
X-Gm-Message-State: AOAM533Xppy6aH4OKa2mtkB33j49LMnH0AmNGOIQYKOHfDkdJFGTIXwv
	L0wuQbZUrFoisiBdxe8aFg==
X-Google-Smtp-Source: ABdhPJxoGeXyF8IAhKv+MtUajjs/YEE9STg2OylU67tmEPihulkz0WKnpRyeUrbTPB/ZiNeBa8xH7Q==
X-Received: by 2002:a1c:acc3:: with SMTP id v186mr6319535wme.79.1594156680012; 
	Tue, 07 Jul 2020 14:18:00 -0700 (PDT)
Received: from localhost (181.red-83-37-105.dynamicip.rima-tde.net.
	[83.37.105.181]) by smtp.gmail.com with ESMTPSA id
	z132sm2831884wmb.21.2020.07.07.14.17.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jul 2020 14:17:59 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Tue,  7 Jul 2020 23:17:58 +0200
Message-Id: <20200707211758.12528-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Khazhismel Kumykov <khazhy@google.com>, DM-DEVEL ML <dm-devel@redhat.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] multipath-tools: add info to man page for the
	historical-service-time path selector
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

Cc: Khazhismel Kumykov <khazhy@google.com>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 multipath/multipath.conf.5 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 05a5e8ff..6e637769 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -205,6 +205,10 @@ of outstanding I/O to the path.
 (Since 2.6.31 kernel) Choose the path for the next bunch of I/O based on the amount
 of outstanding I/O to the path and its relative throughput.
 .TP
+.I "historical-service-time 0"
+(Since 5.8 kernel) Choose the path for the next bunch of I/O based on the shortest
+time by comparing estimated service time (based on historical service time).
+.TP
 The default is: \fBservice-time 0\fR
 .RE
 .
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

