Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1A241F4B3
	for <lists+dm-devel@lfdr.de>; Fri,  1 Oct 2021 20:14:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-S43josnXNbSCmtHaZtmE0g-1; Fri, 01 Oct 2021 14:14:15 -0400
X-MC-Unique: S43josnXNbSCmtHaZtmE0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E27F056B21;
	Fri,  1 Oct 2021 18:14:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5150C196E2;
	Fri,  1 Oct 2021 18:14:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CB6A4E58E;
	Fri,  1 Oct 2021 18:13:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 191IDZYd005342 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 1 Oct 2021 14:13:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02B542161E61; Fri,  1 Oct 2021 18:13:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF8232168695
	for <dm-devel@redhat.com>; Fri,  1 Oct 2021 18:13:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64ED780120D
	for <dm-devel@redhat.com>; Fri,  1 Oct 2021 18:13:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-343-9TfecgjdOUeWRsNlVviFaQ-1; Fri, 01 Oct 2021 14:12:58 -0400
X-MC-Unique: 9TfecgjdOUeWRsNlVviFaQ-1
Received: by mail-wr1-f51.google.com with SMTP id s21so16753623wra.7;
	Fri, 01 Oct 2021 11:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z8t0Jn4XpoLLWavfoIahUr2G93dElJyQrleuR1OMvzU=;
	b=i1ddBsAgLFGFrnRNZhvHoH0S9+0ie5jkJ7EWdJjBJWALV3pH1Yz09zsBLkZnaD6G4T
	KqHEe/tx68GTVPFBt8B1mOBWKfMxzgE7MwY6LGRH7Cef5Uabb+tBxNvaRQyicYb5fRLc
	9xeu1mTuw/Damtty8TPOqMNNbafwjJMl3h0uWy9JrSCcnBNtxeLdTaTZ13IJ5RY65cRr
	UAGoXuJy5JE8dHxOGOZzfpIkmgRNBo2BbhHszikKPWz2ijvkk5il0ePMmCEj3J7OKoMV
	3xQgl3oA+aWBKnKT6xmYK3mEOvJAJqBzpf3a4xEN8fUVNKXCtyyt+LEz9smkmfL8s4yR
	rgrg==
X-Gm-Message-State: AOAM530z/m8aNzqPTqYUu4QEIcL/m8m2F/TWX8ZkJKD9er02n6IW+MTy
	5+AnUj5J8APhOROxW6PyGQ==
X-Google-Smtp-Source: ABdhPJx2UvFFe3X7eSV8B4qQ9/Xni2ghJrfHhSKOGTYi6z+2L43muJ+1SFesUn/EIoQkRRUvXPRKSQ==
X-Received: by 2002:a5d:648b:: with SMTP id o11mr14238223wri.315.1633111977216;
	Fri, 01 Oct 2021 11:12:57 -0700 (PDT)
Received: from localhost (67.red-83-32-34.dynamicip.rima-tde.net.
	[83.32.34.67]) by smtp.gmail.com with ESMTPSA id
	g144sm2964473wmg.5.2021.10.01.11.12.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Oct 2021 11:12:56 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Fri,  1 Oct 2021 20:12:54 +0200
Message-Id: <20211001181254.24056-1-xose.vazquez@gmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	DM-DEVEL ML <dm-devel@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH RFC] multipath-tools: remove Hannes as IBM arrays
	maintainer
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Cc: Hannes Reinecke <hare@suse.de>
Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 763982cd..11282699 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -482,8 +482,6 @@ static struct hwentry default_hw[] = {
 	},
 	/*
 	 * IBM
-	 *
-	 * Maintainer: Hannes Reinecke <hare@suse.de>
 	 */
 	{
 		/* ProFibre 4000R */
-- 
2.32.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

