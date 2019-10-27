Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B6A6DE62E9
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 15:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572185225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HFNlYobQJAn4XSAQkAlPI0XeM4rAj9Bqhw/6IEelXXY=;
	b=HKKbl/Ddz8dzw+U1XPO5R5BZ6y4HPW4yQMGjPWYha3ZRZJGV3Gbh56DIhROjVAQbOfXz4z
	e+2h4drEjUL93elU7bAgb8Zk4GIfRub623ZbxzRPA7hdweRg026okobf1lK/aJTIMxzeH8
	a/tK6KzmGiDdU78vnrzEpNSQ7Syt768=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-71g3a0C2NiybsoAdqRRjIw-1; Sun, 27 Oct 2019 10:07:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C9A2107AD29;
	Sun, 27 Oct 2019 14:06:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6653260BF7;
	Sun, 27 Oct 2019 14:06:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E73E1803B4D;
	Sun, 27 Oct 2019 14:06:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9RE6na9007636 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Oct 2019 10:06:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31C975C207; Sun, 27 Oct 2019 14:06:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA0B5C1D4;
	Sun, 27 Oct 2019 14:06:49 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9A87308A9E0;
	Sun, 27 Oct 2019 14:06:22 +0000 (UTC)
IronPort-SDR: SmH9FqPh9e5O8ycqI2cqldjXEeL6kIV0EnnWGwiihrf71QTqDs1ayX8hnbQjAJd5Lc5RJQAxrM
	HWIi3Gu4jrvyV6CCgN+3U3xVEavDJkquPVostZXoFSl30x7bd+OuPxSpvpS9OfHp1sg5l6555+
	5CMOSD2wAHPSQ/rFfEC6Zz/yaKgRiEasR9MH8bn8vkxfGosfncDa0uIEXZ+nTlJILNwSWVJ42H
	sfUR3bj84u57roQQFSenXUZSTARUJAZ8stx612emjofHQIm2ZhzmvhkEnsLyuJiwhW/YwDPQSf
	9CE=
X-IronPort-AV: E=Sophos;i="5.68,236,1569254400"; d="scan'208";a="122197760"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 22:05:58 +0800
IronPort-SDR: zN2h6hxuB5+DDKRZ8eBOEmoxKTBONo+cjbjhvlkoRdDscY4JSxb8M9CA02LwO9K8XVwoC9NLaL
	CzleE/SVDDfOXw2cMuQBsVnVBcnSWgkruuc58S+bQ0LaIkAW+8v7GjuvF4/buO/k1AyZRxlY2A
	VYf08oGcnrb9wpCv4eGwpzExn7g17oY6ukjKnTQWI2wo6gdtubUc/mkX2pvcCHwYtnS90ROGDQ
	jyjG+Dr898NbaiX9EWbaie3DVAXdxFQc48yEf7GhEglMIZavCe+tuz5ZHPhdHWBlCTB2+WoFaR
	UQxa24Gk7UoTApJJHrspfB/3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 07:01:26 -0700
IronPort-SDR: uR98BDGb+oDCDl3aGAlMSwA0kM5bmjHUYEmzwIJdBaAnbIiG4wxWUs96BTPpyfSFVgv89PwrYn
	RH+tv5S0a748uqvVul6hso9M+kfuaBVmTJZBpOAT/Fo1JDEBdn1G6Cxvnt9rFQOdQLuiFyi6vr
	8s+VoUBcvoPOHWBap2dkA3k0uHknUkvrl3wD5qAPpQM2+XHdToK8arSo4HKSE8bv07RgMqUHLH
	IsdvHPotDFKSSmEmNfEfTAbE8hO1JSEcEW8mUp6r+4rBQYzSIHdw+wYiWyFVZxYBm+anB6dSiE
	l5k=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 07:05:56 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sun, 27 Oct 2019 23:05:44 +0900
Message-Id: <20191027140549.26272-4-damien.lemoal@wdc.com>
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Sun, 27 Oct 2019 14:06:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Sun, 27 Oct 2019 14:06:38 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=196f58c8b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 3/8] scsi: sd_zbc: Fix sd_zbc_complete()
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
X-MC-Unique: 71g3a0C2NiybsoAdqRRjIw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The ILLEGAL REQUEST/INVALID FIELD IN CDB error generated by an attempt
to reset a conventional zone does not apply to the reset write pointer
command with the ALL bit set, that is, to REQ_OP_ZONE_RESET_ALL
requests. Fix sd_zbc_complete() to be quiet only in the case of
REQ_OP_ZONE_RESET, excluding REQ_OP_ZONE_RESET_ALL.

Since REQ_OP_ZONE_RESET is the only request handled by
sd_zbc_complete(), also simplify the code using a simple if statement.

Fixes: d81e9d494354 ("scsi: implement REQ_OP_ZONE_RESET_ALL")
Cc: stable@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/scsi/sd_zbc.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index de4019dc0f0b..1efc69e194f8 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -263,25 +263,16 @@ void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned int good_bytes,
 	int result = cmd->result;
 	struct request *rq = cmd->request;
 
-	switch (req_op(rq)) {
-	case REQ_OP_ZONE_RESET:
-	case REQ_OP_ZONE_RESET_ALL:
-
-		if (result &&
-		    sshdr->sense_key == ILLEGAL_REQUEST &&
-		    sshdr->asc == 0x24)
-			/*
-			 * INVALID FIELD IN CDB error: reset of a conventional
-			 * zone was attempted. Nothing to worry about, so be
-			 * quiet about the error.
-			 */
-			rq->rq_flags |= RQF_QUIET;
-		break;
-
-	case REQ_OP_WRITE:
-	case REQ_OP_WRITE_ZEROES:
-	case REQ_OP_WRITE_SAME:
-		break;
+	if (req_op(rq) == REQ_OP_ZONE_RESET &&
+	    result &&
+	    sshdr->sense_key == ILLEGAL_REQUEST &&
+	    sshdr->asc == 0x24) {
+		/*
+		 * INVALID FIELD IN CDB error: reset of a conventional
+		 * zone was attempted. Nothing to worry about, so be
+		 * quiet about the error.
+		 */
+		rq->rq_flags |= RQF_QUIET;
 	}
 }
 
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

