Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 15D321A73B0
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586845787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B18xlTNm2U42jKaKwLec9rPeV6IuzsuYYSDLo6rRTfs=;
	b=PHZ7hnvnoZaDy0ZpRwUo1a73SkDWD+DmXUcQ3yH6zJA2upB9nmJVp5ZLH4Rfrk02ta91Si
	jcsfLI366v8cd7b4vN6hDQl/0rFddvPLqXEEfTWD8gS2MXT0WuEy6mNq/ZqCsUWAA0+t0E
	2zdIm7l9J5hhevSI4cuBgoT26KHaOcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-uqTMKHXfPk-6ViTJwlzU5A-1; Tue, 14 Apr 2020 02:29:45 -0400
X-MC-Unique: uqTMKHXfPk-6ViTJwlzU5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4468017FD;
	Tue, 14 Apr 2020 06:29:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52D4C5C1B5;
	Tue, 14 Apr 2020 06:29:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7779818089CE;
	Tue, 14 Apr 2020 06:29:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03B0KJHu029569 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Apr 2020 20:20:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB491124579; Sat, 11 Apr 2020 00:20:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5F5412F98B
	for <dm-devel@redhat.com>; Sat, 11 Apr 2020 00:20:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 253CD8FF663
	for <dm-devel@redhat.com>; Sat, 11 Apr 2020 00:20:11 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-Z40qqUNMOvinT9wYb_SvSA-1; Fri, 10 Apr 2020 20:20:08 -0400
X-MC-Unique: Z40qqUNMOvinT9wYb_SvSA-1
Received: by mail-wr1-f65.google.com with SMTP id 65so4092199wrl.1;
	Fri, 10 Apr 2020 17:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jhB68JClm4ABNZd4Z27jP8/6G2WhcvtBBYeVzUWPHVQ=;
	b=rDgRcby5hUZgq1BAOuohQmKuE9UdksXMBlZKzrY7c3qaO/amubiNh6fRaN4nJJO7cQ
	GnOpGsG2KtLjmsiy7GOlr9ZRnB3qKuybVDcEKO8746vAmVKwNI+bJL7vXgDjquB2qFqc
	JxjiSHU3zxaEsLRI1dJKEV75iH4tKDtyGc6HU5zH7pcVAu+Vy/YxeDV/bsnSlIaZKlgm
	5pv2n+2qgCDCSWDxO1sBPljsr/9S3yknNB8iTl38D9xJwOibT8owxhKMovW1RxGRumhI
	utcJ0qAcjkmZ+aIseC2F4NHqFq/RjNXQVyYwcDXZHuxx3czql7rkPD9r4PPCwQGsJz5+
	Y3Eg==
X-Gm-Message-State: AGi0Pubg+ozWjgM6nJMa2E3CdKY6pbm2b9MWV0eNK5t9VmljMdYRP0bv
	0dW9+PfMlhByhgo4ADzsnA==
X-Google-Smtp-Source: APiQypI3Koa4lb8I756i/148Kqv+HFg+EOte7BIcKkMCL6jzuKrikGEab+xgxrOKJ6QW/NcAvkalYA==
X-Received: by 2002:a5d:4145:: with SMTP id c5mr6880676wrq.362.1586564407358; 
	Fri, 10 Apr 2020 17:20:07 -0700 (PDT)
Received: from ninjahost.lan (host-2-102-14-153.as13285.net. [2.102.14.153])
	by smtp.gmail.com with ESMTPSA id
	b191sm5091594wmd.39.2020.04.10.17.20.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Apr 2020 17:20:06 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 11 Apr 2020 01:19:25 +0100
Message-Id: <20200411001933.10072-2-jbi.octave@gmail.com>
In-Reply-To: <20200411001933.10072-1-jbi.octave@gmail.com>
References: <0/9>
 <20200411001933.10072-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03B0KJHu029569
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 02:29:25 -0400
Cc: boqun.feng@gmail.com, "maintainer:DEVICE-MAPPER  LVM" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH 1/9] dm snapshot: Add missing annotation for
	dm_exception_table_lock() and dm_exception_table_unlock()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sparse reports warnings at dm_exception_table_lock()
and dm_exception_table_unlock()

warning: context imbalance in dm_exception_table_lock()
	- wrong count at exit
warning: context imbalance in dm_exception_table_unlock()
	- unexpected unlock

The root cause is the missing annotation at dm_exception_table_lock()
and dm_exception_table_unlock()

Add the missing __acquires(lock->complete_slot) annotation
Add the missing __acquires(lock->pending_slot) annotation
Add the missing __releases(lock->pending_slot) annotation
Add the missing __releases(lock->complete_slot) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/md/dm-snap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 6b11a266299f..1831dd28de5c 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -640,12 +640,16 @@ static void dm_exception_table_lock_init(struct dm_snapshot *s, chunk_t chunk,
 }
 
 static void dm_exception_table_lock(struct dm_exception_table_lock *lock)
+	__acquires(lock->complete_slot)
+	__acquires(lock->pending_slot)
 {
 	hlist_bl_lock(lock->complete_slot);
 	hlist_bl_lock(lock->pending_slot);
 }
 
 static void dm_exception_table_unlock(struct dm_exception_table_lock *lock)
+	__releases(lock->pending_slot)
+	__releases(lock->complete_slot)
 {
 	hlist_bl_unlock(lock->pending_slot);
 	hlist_bl_unlock(lock->complete_slot);
-- 
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

