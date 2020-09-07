Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 76B6426054E
	for <lists+dm-devel@lfdr.de>; Mon,  7 Sep 2020 21:55:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-02Y6mhirM0uo85Srp5cjMg-1; Mon, 07 Sep 2020 15:55:51 -0400
X-MC-Unique: 02Y6mhirM0uo85Srp5cjMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D8D9801AE1;
	Mon,  7 Sep 2020 19:55:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B1695D9DD;
	Mon,  7 Sep 2020 19:55:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD33079FEE;
	Mon,  7 Sep 2020 19:55:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 087JtD6c026306 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 15:55:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 569712166BA3; Mon,  7 Sep 2020 19:55:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 524AA2166B44
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 19:55:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9C501859170
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 19:55:10 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-379-cDPQAKQKOPSbbRrTCXnB4Q-1; Mon, 07 Sep 2020 15:55:09 -0400
X-MC-Unique: cDPQAKQKOPSbbRrTCXnB4Q-1
Received: by mail-pg1-f175.google.com with SMTP id m5so8467416pgj.9
	for <dm-devel@redhat.com>; Mon, 07 Sep 2020 12:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=eltXtuK3r2z37KftA2eyNf0SqPMUtEd1HKXLHWFksr0=;
	b=abrVCVU7En+64x73zoI9heAl6nBCqODxuJgEf3H1QvnScqt/T3drjussJJA+mFjsGM
	/dqiHBQTXIudwTrs7GkqYWigrJKZlBjG/70kF7MP6MpDIMMBjPBq/lGhzi8i09C0k9Qa
	0VifmiAgLdgrigrSqU+vWEPAtwtp/vQg2SRv2/atHj39J5l8N1MJm+1wvbu5XqodzR97
	yZyEd+zxbPN3GAYs/joXvboziCZzUND959HLsg85e5+R+r1OQDqfKPVfYTBs6AdqAVuS
	Z7SFLf7lKFqqo27JUfe087cnfcRcUxfqkJBm49/kCoaF5De0+VKVjfKac2Yo9jHxhObT
	L1jA==
X-Gm-Message-State: AOAM531QzTyBBS8yrK7Wq4YoWMBcyzPSw8vJ8ufkuW3GJEazsPSHUjQ8
	wng7+nvdu9INKYSt55/B9PT2lp9WCrks7r3v+wexd7fDCx0EOFguMaJjh7CneHoesXs2dpnF8Fv
	oTRsZTUtyPUqjxTyjhrfQn90biZoQc7IB1RobQodv8SlQR4ZM9Og/5AdN/lvffbr+p4B3zQ==
X-Google-Smtp-Source: ABdhPJxrH6D4YiaOEVG99GaqE8CcMMpMJ0W+RC25GvwaxXD48hVAV4Qe+7EzzhWdKJGSlYNzpS2brQ==
X-Received: by 2002:a17:902:8605:: with SMTP id
	f5mr20585580plo.263.1599508507179; 
	Mon, 07 Sep 2020 12:55:07 -0700 (PDT)
Received: from localhost.localdomain ([192.30.189.3])
	by smtp.gmail.com with ESMTPSA id 2sm13868451pjg.32.2020.09.07.12.55.06
	for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Sep 2020 12:55:06 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.0.3\))
Message-Id: <EA072C02-DFA6-440C-88CB-5E379FBB23FD@purestorage.com>
Date: Mon, 7 Sep 2020 12:55:05 -0700
To: device-mapper development <dm-devel@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 087JtD6c026306
X-loop: dm-devel@redhat.com
Subject: [dm-devel] fix for kernel BUG at
 drivers/scsi/device_handler/scsi_dh_alua.c:662!
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello all,

>From my earlier post:
https://www.redhat.com/archives/dm-devel/2020-September/msg00083.html

Would it be better to move the unsetting the address of sdev to NULL lower? This would protect
against the crash we see when the alua_rtpg function tries to access the sdev address
that has been set to NULL in alua_bus_detach by another thread.

--- a/linux-5.4.17/drivers/scsi/device_handler/scsi_dh_alua.c	2020-07-29 22:48:30.000000000 -0600
+++ b/linux-5.4.17/drivers/scsi/device_handler/scsi_dh_alua.c	2020-09-07 13:38:23.771575702 -0600
@@ -1146,15 +1146,15 @@
 
 	spin_lock(&h->pg_lock);
 	pg = rcu_dereference_protected(h->pg, lockdep_is_held(&h->pg_lock));
-	rcu_assign_pointer(h->pg, NULL);
-	h->sdev = NULL;
-	spin_unlock(&h->pg_lock);
 	if (pg) {
 		spin_lock_irq(&pg->lock);
 		list_del_rcu(&h->node);
 		spin_unlock_irq(&pg->lock);
 		kref_put(&pg->kref, release_port_group);
 	}
+	rcu_assign_pointer(h->pg, NULL);
+	h->sdev = NULL;
+	spin_unlock(&h->pg_lock);
 	sdev->handler_data = NULL;
 	kfree(h);
 }

Thanks,
Brian

Brian Bunker
SW Eng
brian@purestorage.com




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

