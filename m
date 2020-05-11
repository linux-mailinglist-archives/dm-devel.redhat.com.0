Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 743261CD3B6
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CMqs/FWhbc6SusUJhjp60Yzpv5FiVnQo8t3T6x9DCR8=;
	b=XQfhC7DDZsYBYUARP2J0XHGdeqZ4vrAkdBWYUCCSOXAFbJ4FkTY0i+DWu48rD6xx7DflLf
	w0a73Xo3LUksISTLN16tsSZhIffW3LF9Wj+mmyZgIZnY/kq8LnaBE+6B9NrOX08vFU4CIn
	+91P2mqhkMqZ6rAH5jruQYMbMrxAP28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-65KdoaQkMx-6_4v__tlIvg-1; Mon, 11 May 2020 04:25:07 -0400
X-MC-Unique: 65KdoaQkMx-6_4v__tlIvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20F34A0BD9;
	Mon, 11 May 2020 08:25:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD0336C794;
	Mon, 11 May 2020 08:25:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 610A94CAAE;
	Mon, 11 May 2020 08:25:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8Oqgb031857 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:24:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 219A9B553C; Mon, 11 May 2020 08:24:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BF54D0B46
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A5B180CDB5
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-313-fPb9nCeTN5OFMPS5W8dR7w-1;
	Mon, 11 May 2020 04:24:46 -0400
X-MC-Unique: fPb9nCeTN5OFMPS5W8dR7w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 164D1AE28;
	Mon, 11 May 2020 08:24:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 11 May 2020 10:24:17 +0200
Message-Id: <20200511082430.39455-3-hare@suse.de>
In-Reply-To: <20200511082430.39455-1-hare@suse.de>
References: <20200511082430.39455-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 02/15] dm-zoned: add 'message' callback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add callback for 'dmsetup message' to allow the reclaim process
to be triggered manually.
Eg.

	dmsetup message /dev/dm-X 0 message

will start the reclaim process even if the default threshold
of 50 percent of free random zones is not reached.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/admin-guide/device-mapper/dm-zoned.rst | 12 ++++++++++++
 drivers/md/dm-zoned-target.c                         | 15 +++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-zoned.rst b/Documentation/admin-guide/device-mapper/dm-zoned.rst
index 4165fbf1aeb6..7547ce635161 100644
--- a/Documentation/admin-guide/device-mapper/dm-zoned.rst
+++ b/Documentation/admin-guide/device-mapper/dm-zoned.rst
@@ -160,3 +160,15 @@ where <nr_zones> is the total number of zones, <nr_unmap_rnd> is the number
 of unmapped (ie free) random zones, <nr_rnd> the total number of zones,
 <nr_unmap_seq> the number of unmapped sequential zones, and <nr_seq> the
 total number of sequential zones.
+
+Normally the reclaim process will be started once there are less than 50
+percent free random zones. In order to start the reclaim process manually
+even before reaching this threshold the 'dmsetup message' function can be
+used:
+
+Ex::
+
+	dmsetup message /dev/dm-X 0 reclaim
+
+will start the reclaim process and random zones will be moved to sequential
+zones.
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 0b4b27d280fb..0bfe34162dbb 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -990,6 +990,20 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 	return;
 }
 
+static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
+		       char *result, unsigned int maxlen)
+{
+	struct dmz_target *dmz = ti->private;
+	int r = -EINVAL;
+
+	if (!strcasecmp(argv[0], "reclaim")) {
+		dmz_schedule_reclaim(dmz->reclaim);
+		r = 0;
+	} else
+		DMERR("unrecognized message %s", argv[0]);
+	return r;
+}
+
 static struct target_type dmz_type = {
 	.name		 = "zoned",
 	.version	 = {1, 1, 0},
@@ -1004,6 +1018,7 @@ static struct target_type dmz_type = {
 	.resume		 = dmz_resume,
 	.iterate_devices = dmz_iterate_devices,
 	.status		 = dmz_status,
+	.message	 = dmz_message,
 };
 
 static int __init dmz_init(void)
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

