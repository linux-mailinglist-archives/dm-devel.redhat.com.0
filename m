Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BD2A9EEF
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 11:54:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DDD23082149;
	Thu,  5 Sep 2019 09:54:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7F301001947;
	Thu,  5 Sep 2019 09:54:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6395A18089C8;
	Thu,  5 Sep 2019 09:54:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x859sHBd026906 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 05:54:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FE3B5D9E5; Thu,  5 Sep 2019 09:54:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA4BA5D9E2;
	Thu,  5 Sep 2019 09:54:10 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDA6D18C8929;
	Thu,  5 Sep 2019 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567677240; x=1599213240;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=/XtlwHOsIPicnyo2flJ5KzL1vmCB4hpFdRCl5+DsDD4=;
	b=UqYKVliaqvgUoyg51C/qj/wr6pyD/4LyzvaFy4FJrbwaWmmDtusKhZ7z
	MUuSCu01tcsuhqugbIcOu0LrHSppT7uaI4d+5XxKowEjUEJ3IGhQay7by
	V+OAhfDdtjEcNsm9GhloMaCjfAg1y0AKlyyLZ0sDw4NA9yHcRh4I9jIOO
	rEOLppop0AzhobsHfcXyIvpw/PgRicbCZI0x+C3bT9l3bT4UikhdcXNmH
	CeT6UMuTliUSBs8kcfmVqPKhHZohdMZiEfCr0/fEkt9ZJZmBnfmgxyzKQ
	NKD/R1yjWQbGJyPe0qskLNq9oLUODRxQfiTMcO8uNO8lNi2v0+S3wj3d7 g==;
IronPort-SDR: HaI0zjOW90nwlp1j2wsoWbF7aw43TSrSEQbGn1TOHyit27hTmhY4jjRIXkPzcM24W4uwgD8Kgs
	f1PZbHwXADTtJCUTOjFNR6RyXY2F4Yp5cc6AUPfYWT0k518TT8ZDAsk1tpCeHMO/S3UVYQiYg9
	wkOBIb0IPBwgCMUxI/D6BIuk4bOCiroTVJ1XZzi3/BhS6Morv5Ss470tZFG8bUzW+l3VLjdvjV
	eVg4ayOKZUObzQDl/bT9/rNwVvX1mkwvSFa+jJhqyGOH6k+GZomuyqFe8mxXsltySxOZq+MsEd
	kc4=
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="119106284"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 05 Sep 2019 17:51:47 +0800
IronPort-SDR: dbWMGhh7qRQ3myMhe0vBEakahocaAgcANhzqkvWc/Fd7VpFbkl1gmTddh0ZMaMrzevj3Sxz/3j
	p8OAJ9XYso/PvkENkRgmBhMEnOetKjCyKIIFVBJqv6lwvffsMn2kyVI/mTLYtordbJRakXmvvQ
	bQ00ku8ohmB9U3UotwmVCIduYFAgmazeVZuhGwCRRwmx92GpVrI8kBqN+hoGY0/v8z2swlKXJU
	a7Z8MsFEInYtSQXQijuNsxWlOF++Ftt3Tn7rbFYJKQc17Unmwaz7TT2kovuQL5ww/88XLgaZ4D
	w47PP/G9gqUADRJa1NLM/qPy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 02:48:43 -0700
IronPort-SDR: PMcqYEJtk0jNIxalMYnj1tGVSoFhITi6da+9KU/BbwBavagIEJVYSrRDsTM+vRMVIhqb4doxaC
	kWs/cbz3itasjn4XhJExza74T8zJXrlVKgF16N2qLo9ED5Gpr/LnPa/himSsRWGYLYDjGCFtv0
	STrpHKMJiJS84SBMdTyKHRZHqd0C7HlprXT0V8ZnoE67PHSxG/6lbaaVjVLJ+ptkqjkjnY4g8Z
	ROg1ezQjpPJmmoeUX4o/5AB0aEA6jPX1G8VKMCa/3b1V6N5RrYlOG27+l4NgXPoMxhbwWl3Cag
	fWc=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Sep 2019 02:51:46 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu,  5 Sep 2019 18:51:35 +0900
Message-Id: <20190905095135.26026-8-damien.lemoal@wdc.com>
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.70]); Thu, 05 Sep 2019 09:54:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Thu, 05 Sep 2019 09:54:00 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=1441e10e1=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v5 7/7] sd: Set ELEVATOR_F_ZBD_SEQ_WRITE for ZBC
	disks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 05 Sep 2019 09:54:21 +0000 (UTC)

Using the helper blk_queue_required_elevator_features(), set the
elevator feature ELEVATOR_F_ZBD_SEQ_WRITE as required for the request
queue of SCSI ZBC disks.

This feature requirement can always be satisfied as the mq-deadline
elevator is always selected for in-kernel compilation when
CONFIG_BLK_DEV_ZONED (zoned block device support) is enabled.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 drivers/scsi/sd_zbc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 367614f0e34f..de4019dc0f0b 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -493,6 +493,8 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buf)
 	blk_queue_chunk_sectors(sdkp->disk->queue,
 			logical_to_sectors(sdkp->device, zone_blocks));
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, sdkp->disk->queue);
+	blk_queue_required_elevator_features(sdkp->disk->queue,
+					     ELEVATOR_F_ZBD_SEQ_WRITE);
 	nr_zones = round_up(sdkp->capacity, zone_blocks) >> ilog2(zone_blocks);
 
 	/* READ16/WRITE16 is mandatory for ZBC disks */
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
