Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2197732A9F7
	for <lists+dm-devel@lfdr.de>; Tue,  2 Mar 2021 20:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614711979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nao2s2PKKMTEvU4czJoZgtlAnv5eda6MPF5TzPvQUnU=;
	b=R+0mnQ+m1dhDEAcCjJC2ODxELTk0Cl1LMJPBokKPshhuMkoAwqgZtCyxskcIIlng6O5FnR
	mf9lRa4zqr6636S9ey7awvAcnYpNgEU8ECW3eSyiZYxrkqcdrcB25xZaRUEfK/pz1YhTKf
	9YOtpAcBxoqDBGT3SID9TcxmLEhbS38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-IzxP09F9NvmhGdoQUwcNjQ-1; Tue, 02 Mar 2021 14:06:16 -0500
X-MC-Unique: IzxP09F9NvmhGdoQUwcNjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC516E5766;
	Tue,  2 Mar 2021 19:06:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9ABB18A5A;
	Tue,  2 Mar 2021 19:06:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81F0218095CD;
	Tue,  2 Mar 2021 19:06:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 122J604q011087 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Mar 2021 14:06:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61A5E18400; Tue,  2 Mar 2021 19:06:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-116-252.ams2.redhat.com
	[10.36.116.252])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D517262465;
	Tue,  2 Mar 2021 19:05:58 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1lHALE-0003kL-Fd; Tue, 02 Mar 2021 20:05:57 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Tue, 02 Mar 2021 20:05:55 +0100
Message-Id: <20210302190555.201228400@debian-a64.vm>
User-Agent: quilt/0.65
Date: Tue, 02 Mar 2021 20:05:17 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>, Mike Snitzer <msnitzer@redhat.com>, 
	Heinz Mauelshagen <heinzm@redhat.com>, axboe@kernel.dk,
	caspar@linux.alibaba.com, io-uring@vger.kernel.org,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, hch@lst.de
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 4/4] dm: support I/O polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline; filename=dm-poll.patch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Support I/O polling if submit_bio_noacct_mq_direct returned non-empty
cookie.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: linux-2.6/drivers/md/dm.c
===================================================================
--- linux-2.6.orig/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
+++ linux-2.6/drivers/md/dm.c	2021-03-02 19:26:34.000000000 +0100
@@ -1682,6 +1682,11 @@ static void __split_and_process_bio(stru
 		}
 	}
 
+	if (ci.poll_cookie != BLK_QC_T_NONE) {
+		while (atomic_read(&ci.io->io_count) > 1 &&
+		       blk_poll(ci.poll_queue, ci.poll_cookie, true)) ;
+	}
+
 	/* drop the extra reference count */
 	dec_pending(ci.io, errno_to_blk_status(error));
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

