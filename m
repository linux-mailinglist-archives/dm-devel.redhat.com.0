Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 68C8C1EBA15
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:10:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591096239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dPKmoDS4VBr3A+dfHC1US6rHJheW0Jq31aADGJszOB8=;
	b=HDNESzvAxSwUrhZGlXcMQE3KOqeGW5aw62GNT+BWxS4ull/2Be1u/J9Qn24xKZMb6rqc4b
	zTygj1TThEUNJHR8/DpilVRgL5rxb1MoixAfygSXjfHUSZun1ux+TJAkmrz2cmVPbIHwGj
	m761IPTeuCoT9ybTH+1T70hDwN5Yuy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-_MzDn4fXOG-QklIranGbgA-1; Tue, 02 Jun 2020 07:10:36 -0400
X-MC-Unique: _MzDn4fXOG-QklIranGbgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432B81883605;
	Tue,  2 Jun 2020 11:10:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AD011A912;
	Tue,  2 Jun 2020 11:10:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F258965D10;
	Tue,  2 Jun 2020 11:10:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BA9cr027396 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:10:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5358D2156A49; Tue,  2 Jun 2020 11:10:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 466A02156A2D
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F01D1019CA7
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-255-0gMwpN3ZMVK-mc6TKUZq7g-1;
	Tue, 02 Jun 2020 07:10:04 -0400
X-MC-Unique: 0gMwpN3ZMVK-mc6TKUZq7g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EB0F9AE2B;
	Tue,  2 Jun 2020 11:10:04 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  2 Jun 2020 13:09:42 +0200
Message-Id: <20200602110956.121170-2-hare@suse.de>
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
References: <20200602110956.121170-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 01/15] dm-zoned: add debugging message for
	reading superblocks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 4a2e351365c5..ef1524d5928a 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1105,6 +1105,10 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
  */
 static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
 {
+	dmz_zmd_debug(zmd, "read superblock set %d dev %s block %llu",
+		      set, zmd->sb[set].dev->name,
+		      zmd->sb[set].block);
+
 	return dmz_rdwr_block(zmd->sb[set].dev, REQ_OP_READ,
 			      zmd->sb[set].block, zmd->sb[set].mblk->page);
 }
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

