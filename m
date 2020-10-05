Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC6BE283FA1
	for <lists+dm-devel@lfdr.de>; Mon,  5 Oct 2020 21:28:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521--xK_AgC2NWqzV4WmQfh-oA-1; Mon, 05 Oct 2020 15:28:43 -0400
X-MC-Unique: -xK_AgC2NWqzV4WmQfh-oA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94334801ADD;
	Mon,  5 Oct 2020 19:28:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35AC66FEE9;
	Mon,  5 Oct 2020 19:28:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47225180B657;
	Mon,  5 Oct 2020 19:28:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 095JSDoP028796 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Oct 2020 15:28:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 777822028DCC; Mon,  5 Oct 2020 19:28:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72DB4200A795
	for <dm-devel@redhat.com>; Mon,  5 Oct 2020 19:28:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74AFE800CAF
	for <dm-devel@redhat.com>; Mon,  5 Oct 2020 19:28:11 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-144-Z327d57yODiElyQDmKUmsg-1; Mon, 05 Oct 2020 15:28:09 -0400
X-MC-Unique: Z327d57yODiElyQDmKUmsg-1
Received: by mail-wr1-f68.google.com with SMTP id m6so10904766wrn.0;
	Mon, 05 Oct 2020 12:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=olQljkiZatNDcrgQkESmsdcthv4IVT82xVvaJJFCX9g=;
	b=rV4QXGK9ewPAAxvxf5xvQprgq26NtANoytzh0Nx7pfJkBAl7fUAN6r4bL7uDqZntj0
	e9pl6Jug1QMYaLqpt3Z3FDFIHQhX8di0nzYnD3I85hfgDUW2iiMMFo+c/HU8xrjJ7Vlj
	Lnwr1JQNxqJ9yr0XzFmPXxsISGH0FbuBQdmE3qvR62xSyGGhO1PZVtAXUzz/s3HaVnoh
	vTvNZrvQOEfJpR4lnF583i10bkp69UBSVsNbhonoZDuChI891eIJxvKR2SQDja/0a3RS
	ztQAVZ2InAWTjVTFxf2SaRnigflF+/aDGUVhv61dB3IRxW2hfZojtvwULSxRsrmEOCaT
	pBTA==
X-Gm-Message-State: AOAM530cRmgtHzPWOHyR71dEMu8OdHSmqCzHQ2KMM94f48TnujZ4T3zW
	ruK/fUQl4/iGQ+U1AewJuv+/QIcxYGdG
X-Google-Smtp-Source: ABdhPJzBqwRe4TxXYsjKWdRkc+ApefxuDwIz5e1YoWye1gTUjqXkMKVGI32RGPCelDGR5EVCZq8JCQ==
X-Received: by 2002:a5d:5602:: with SMTP id l2mr978721wrv.410.1601926087925;
	Mon, 05 Oct 2020 12:28:07 -0700 (PDT)
Received: from localhost ([90.160.137.52])
	by smtp.gmail.com with ESMTPSA id d6sm1131706wrq.67.2020.10.05.12.28.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 05 Oct 2020 12:28:07 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Mon,  5 Oct 2020 21:28:06 +0200
Message-Id: <20201005192806.15177-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Khazhismel Kumykov <khazhy@google.com>, DM-DEVEL ML <dm-devel@redhat.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2] multipath-tools: add info about the
	historical-service-time path selector to man page
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just minimal info.

Cc: Khazhismel Kumykov <khazhy@google.com>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 multipath/multipath.conf.5 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 05a5e8ff..5e65cb93 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -205,6 +205,11 @@ of outstanding I/O to the path.
 (Since 2.6.31 kernel) Choose the path for the next bunch of I/O based on the amount
 of outstanding I/O to the path and its relative throughput.
 .TP
+.I "historical-service-time 0"
+(Since 5.8 kernel) Choose the path for the next bunch of IOs based on the
+estimation of future service time based on the history of previous I/O submitted
+to each path.
+.TP
 The default is: \fBservice-time 0\fR
 .RE
 .
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

