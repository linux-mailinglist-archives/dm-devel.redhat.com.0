Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED9D10E81D
	for <lists+dm-devel@lfdr.de>; Mon,  2 Dec 2019 11:03:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575281024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vEahpYZWk9YkeFz+hpzlqEwKuUKlQJ9z2uWLyXCsQzA=;
	b=bSCIm6IZI2WaYOsGzLI50TxyDzr/U7T0UQuWYhyHThtj57cPBVxBgUuGrRN6fGYGofZsrn
	HcgHmPRrctnsgtIeR1gGtk8xKgyjWs5EMQQ//qKGNZMRbNTSm18f6X227DcuyTXwEso4M1
	qviJb5Qd385JftZQAPa0Ec7ScXv5C2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-Tz--C3jPP5GNY3yzEWs3Yw-1; Mon, 02 Dec 2019 05:03:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3741E801E70;
	Mon,  2 Dec 2019 10:03:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0FC85C541;
	Mon,  2 Dec 2019 10:03:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 300EC18089CD;
	Mon,  2 Dec 2019 10:03:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB15hpw2008586 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 1 Dec 2019 00:43:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1C7FB10ABC87; Sun,  1 Dec 2019 05:43:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17C4B10ABC86
	for <dm-devel@redhat.com>; Sun,  1 Dec 2019 05:43:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DE898001EF
	for <dm-devel@redhat.com>; Sun,  1 Dec 2019 05:43:48 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-18-ddXdmkzTPMyGC42VJC0TPA-1; Sun, 01 Dec 2019 00:43:44 -0500
Received: by mail-pl1-f193.google.com with SMTP id h13so14806596plr.1;
	Sat, 30 Nov 2019 21:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X7ley8JXHje4lCwDYJLUwhoPHGOKy00BtUbYE06y2mQ=;
	b=llrHYmQJ6DEHvHxyY3jkn/wVDh5VYpdtTZCHhPakGeGjyHHp86L9vQ+0bCeNdVrkB7
	Bj4aEMtWj/ce1zPz4QBPlaCBNnBFkBRDeuo7KyO2TFsenQ1w4Jr4VyBhzAqszL7jDw5e
	Q2wFXhagw7AZUi8cSCu4thJd/QF0NTc2B8JhU//iBwnwqkHnh1qrsw8+XjorqTkPTMHA
	7tOmfwmfpn0K9A2LVI9/OeHlTkX0/o9zRSselD0O7BVpVB/3mXKH0uYg1uo8pnW1xnTs
	9i+k+u0Sg+mpkxsg42rj7HzSo2yrjYE/IwS4idtsL1wieuCw4FCV8LBGhT4tAOqyqj6I
	50Qw==
X-Gm-Message-State: APjAAAVVQN+lTNrsWR84LWBHRjJOqlROuTWjyVfaiKRm5xeR/uDaXVWe
	W+3Q20kmaDaYIvOuS0+BgWo2IiVl8RM=
X-Google-Smtp-Source: APXvYqzChZcYdgldLt6cJOWuuRLOolGoelVm7oilHIxLRobVvFpZlI3HU50zBqiHHWrCv+3M+pAa9w==
X-Received: by 2002:a17:90a:353:: with SMTP id
	19mr29595680pjf.128.1575179023309; 
	Sat, 30 Nov 2019 21:43:43 -0800 (PST)
Received: from localhost.localdomain ([124.80.131.109])
	by smtp.googlemail.com with ESMTPSA id
	m71sm11730331pje.0.2019.11.30.21.43.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 30 Nov 2019 21:43:42 -0800 (PST)
From: Jieun Kim <jieun.kim4758@gmail.com>
X-Google-Original-From: Jieun Kim <Jieun.Kim4758@gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Sun,  1 Dec 2019 14:42:57 +0900
Message-Id: <20191201054257.13199-1-Jieun.Kim4758@gmail.com>
X-MC-Unique: ddXdmkzTPMyGC42VJC0TPA-1
X-MC-Unique: Tz--C3jPP5GNY3yzEWs3Yw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB15hpw2008586
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 05:03:09 -0500
Cc: Jieun Kim <Jieun.Kim4758@gmail.com>, dm-devel@redhat.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH 2/2] drivers: md: dm-log.c: Remove unused
	variable 'sz'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove unused variable 'sz' in disk_status function
detected by coccinelle scripts(returnvar.cocci)

Signed-off-by: Jieun Kim <Jieun.Kim4758@gmail.com>
---
 drivers/md/dm-log.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-log.c b/drivers/md/dm-log.c
index 8800ec1847b5..67e74362c6ac 100644
--- a/drivers/md/dm-log.c
+++ b/drivers/md/dm-log.c
@@ -800,7 +800,6 @@ static int core_status(struct dm_dirty_log *log, status_type_t status,
 static int disk_status(struct dm_dirty_log *log, status_type_t status,
 		       char *result, unsigned int maxlen)
 {
-	int sz = 0;
 	struct log_c *lc = log->context;
 
 	switch(status) {
@@ -818,7 +817,7 @@ static int disk_status(struct dm_dirty_log *log, status_type_t status,
 		DMEMIT_SYNC;
 	}
 
-	return sz;
+	return 0;
 }
 
 static struct dm_dirty_log_type _core_type = {
-- 
2.17.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

